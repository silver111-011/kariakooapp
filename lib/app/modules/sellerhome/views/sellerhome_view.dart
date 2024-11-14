











//import 'package:agape_s_application1/app/modules/chat/views/chat_view.dart';
import 'package:agape_s_application1/app/modules/OrderRequest/views/orderRequest_view.dart';
import 'package:agape_s_application1/app/modules/chat/views/chat_view.dart';
import 'package:agape_s_application1/app/modules/sellerhome/controllers/sellerhome_controller.dart';
import 'package:agape_s_application1/app/modules/sellerprofile/views/sellerprofile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
//import '../../sellerprofile/views/sellerprofile_view.dart';
//import '../../chat/views/chat_view.dart';
//import '../controllers/sellerhome_controller.dart';
import '../../../models/product.dart';

class SellerHomeView extends StatefulWidget {
  //final String userId;
  final String sellerId;

  const SellerHomeView({
    Key? key,
   // required this.userId,
    required this.sellerId,
  }) : super(key: key);

  @override
  _SellerHomeViewState createState() => _SellerHomeViewState();
}




class _SellerHomeViewState extends State<SellerHomeView> {
  final SellerHomeController controller = Get.find<SellerHomeController>();
  int _currentIndex = 0;
    //late Product product; // Define product variable

  @override
  void initState() {
    super.initState();
    controller.loadSellerId(); // Load the seller's ID and start streaming products
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('karibu'),
          centerTitle: true,
          automaticallyImplyLeading: false,

//       actions: [
//   IconButton(
//     icon: Icon(Icons.notifications, color: Colors.black), // Change color as needed
//     onPressed: () {
//       Get.toNamed(Routes.orderRequestsView);
//     },
//   ),
// ],


        ),
        body: Center(child: Text('User not logged in')),
      );
    }
    final String userId = user.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text('Karibu Kariakoo'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildProductsTab(),
          
          OrderRequestsView(),
          SellerProfileView(sellerId: 'sellerId' ,),
          //ChatView(),
             ChatView(
            userId: FirebaseAuth.instance.currentUser!.uid,
            sellerId: widget.sellerId,
            businessName: 'seller.businessName', 
            productName: 'product.name', 
            productImage: 'product.imagePath', 
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });


    //        // Handle navigation to ChatView for the 'Chat' tab
    // if (index == 3) { // Assuming 'Chat' is at index 1 based on your items list
    //   Get.toNamed(Routes.chatView, arguments: {
    //     'userId': userId, // Replace with actual user ID
    //     'sellerId': product.sellerId, // Replace with actual seller ID
    //     'productId': product.id, // Replace with actual product ID if needed
    //     'sellerName': product.businessName, // Replace with actual business name
    //     'productName': product.name, // Replace with actual product name
    //     'productImage': product.imagePath, // Replace with actual product image
    //     'buyerName': userId, // Replace with actual buyer name or logic
    //   });
    // }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Bidhaa'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'taarifa'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Kuhusu mimi'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'chati'),
          
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Color.fromARGB(255, 8, 14, 190),
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Ongeza Bidhaa'),
                      content: AddProductForm(controller: controller),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ghairi'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.add),
            )
          : null,
    );
  }

  Widget _buildProductsTab() {
    return StreamBuilder<List<Product>>(
      stream: controller.productsStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('hakuna bidhaa'));
        }

        final products = snapshot.data!;

        if (products.isEmpty) {
          return Center(child: Text('Hakuna bidhaa yoyote'));
        }

        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListTile(
              leading: Image.network(product.imagePath, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(product.name),
              subtitle: Text('Idadi: ${product.stock}\nBei: \Tsh${product.price}'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Sahihisha'),
                            onTap: () {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('sahihisha Bidhaa'),
                                    content: EditProductForm(
                                      controller: controller,
                                      product: product,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('ghairi'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Futa'),
                            onTap: () async {
                              Navigator.pop(context);
                              await controller.deleteProduct(product.id);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}



class AddProductForm extends StatefulWidget {
  final SellerHomeController controller;

  AddProductForm({required this.controller});

  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  XFile? selectedImage;

  Future<void> pickImage() async {
    final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = pickedFile;
      });
    }
  }

  Future<String?> uploadImage(XFile? image) async {
    if (image == null) return null;

    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('product_images')
        .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

    await storageReference.putFile(File(image.path));
    return await storageReference.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: categoryController,
            decoration: InputDecoration(labelText: 'Kundi'),
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Jina la bidhaa'),
          ),
          TextField(
            controller: priceController,
            decoration: InputDecoration(labelText: 'Bei yake'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: stockController,
            decoration: InputDecoration(labelText: 'Idadi'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: businessNameController,
            decoration: InputDecoration(labelText: 'Jina la biashara'),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: pickImage,
            child: selectedImage == null
                ? Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Icon(Icons.add_a_photo, size: 50),
                  )
                : Image.file(File(selectedImage!.path), height: 150, fit: BoxFit.cover),
          ),
          SizedBox(height: 10),

                  ElevatedButton(
                                   onPressed: () async {
              final String category = categoryController.text.trim();
              final String name = nameController.text.trim();
              final double price = double.parse(priceController.text.trim());
              final int stock = int.parse(stockController.text.trim());
              final String businessName = businessNameController.text.trim();
              final String imagePath = await uploadImage(selectedImage) ?? '';

              if (category.isNotEmpty &&
                  name.isNotEmpty &&
                  price > 0 &&
                  stock > 0 &&
                  imagePath.isNotEmpty &&
                  businessName.isNotEmpty) {
                final Product product = Product(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  category: category,
                  name: name,
                  price: price,
                  stock: stock,
                  imagePath: imagePath,
                  sellerId: FirebaseAuth.instance.currentUser?.uid ?? '',
                  businessName: businessName,
                );

                await widget.controller.addProduct(product);
                Navigator.of(context).pop();
              }
            },
                            child: Text('weka'),
                            style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:Theme.of(context).primaryColor,// Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(double.infinity, 60), // Increase the height of the button
                    ),
                        ),
//                         ElevatedButton(
//              onPressed: () async {
//               final String category = categoryController.text.trim();
//               final String name = nameController.text.trim();
//               final double price = double.parse(priceController.text.trim());
//               final int stock = int.parse(stockController.text.trim());
//               final String businessName = businessNameController.text.trim();
//               final String imagePath = await uploadImage(selectedImage) ?? '';

//               if (category.isNotEmpty &&
//                   name.isNotEmpty &&
//                   price > 0 &&
//                   stock > 0 &&
//                   imagePath.isNotEmpty &&
//                   businessName.isNotEmpty) {
//                 final Product product = Product(
//                   id: DateTime.now().millisecondsSinceEpoch.toString(),
//                   category: category,
//                   name: name,
//                   price: price,
//                   stock: stock,
//                   imagePath: imagePath,
//                   sellerId: FirebaseAuth.instance.currentUser?.uid ?? '',
//                   businessName: businessName,
//                 );

//                 await widget.controller.addProduct(product);
//                 Navigator.of(context).pop();
//               }
//             },
//   style: ElevatedButton.styleFrom(
//     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//     backgroundColor: Color.fromARGB(255, 49, 73, 214),
//     minimumSize: Size.fromHeight(40),
//   ),
//   child: Text(
//     'weka',
//     style: TextStyle(
//       fontSize: 10,
//       fontWeight: FontWeight.bold,
//       color: Colors.white,
//     ),
//   ),
// ),
      
        ],
      ),
    );
  }
}

class EditProductForm extends StatefulWidget {
  final SellerHomeController controller;
  final Product product;

  EditProductForm({required this.controller, required this.product});

  @override
  _EditProductFormState createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  late TextEditingController categoryController;
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController stockController;
  late TextEditingController businessNameController;
  final ImagePicker imagePicker = ImagePicker();
  XFile? selectedImage;

  @override
  void initState() {
    super.initState();
    categoryController = TextEditingController(text: widget.product.category);
    nameController = TextEditingController(text: widget.product.name);
    priceController = TextEditingController(text: widget.product.price.toString());
    stockController = TextEditingController(text: widget.product.stock.toString());
    businessNameController = TextEditingController(text: widget.product.businessName);
  }

  Future<void> pickImage() async {
    final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = pickedFile;
      });
    }
  }

  Future<String?> uploadImage(XFile? image) async {
    if (image == null) return null;

    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('product_images')
        .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

    await storageReference.putFile(File(image.path));
    return await storageReference.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: categoryController,
            decoration: InputDecoration(labelText: 'Kundi'),
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Jina la bidhaa'),
          ),
          TextField(
            controller: priceController,
            decoration: InputDecoration(labelText: 'Bei ya bidhaa'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: stockController,
            decoration: InputDecoration(labelText: 'Idadi'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: businessNameController,
            decoration: InputDecoration(labelText: 'Jina la biashara'),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: pickImage,
            child: selectedImage == null
                ? Image.network(widget.product.imagePath, height: 150, fit: BoxFit.cover)
                : Image.file(File(selectedImage!.path), height: 150, fit: BoxFit.cover),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              final String category = categoryController.text.trim();
              final String name = nameController.text.trim();
              final double price = double.parse(priceController.text.trim());
              final int stock = int.parse(stockController.text.trim());
              final String businessName = businessNameController.text.trim();
              final String imagePath = selectedImage != null
                  ? (await uploadImage(selectedImage) ?? widget.product.imagePath)
                  : widget.product.imagePath;

              if (category.isNotEmpty &&
                  name.isNotEmpty &&
                  price > 0 &&
                  stock > 0 &&
                  imagePath.isNotEmpty &&
                  businessName.isNotEmpty) {
                final Product updatedProduct = Product(
                  id: widget.product.id,
                  category: category,
                  name: name,
                  price: price,
                  stock: stock,
                  imagePath: imagePath,
                  sellerId: FirebaseAuth.instance.currentUser?.uid ?? '',
                  businessName: businessName,
                );

                await widget.controller.updateProduct(updatedProduct);
                Navigator.of(context).pop();
              }
            },
            child: Text('Badilisha Bidhaa'),
          ),
        ],
      ),
    );
  }
}

















// //import 'package:agape_s_application1/app/modules/chat/views/chat_view.dart';
// import 'package:agape_s_application1/app/modules/OrderRequest/views/orderRequest_view.dart';
// import 'package:agape_s_application1/app/modules/sellerhome/controllers/sellerhome_controller.dart';
// import 'package:agape_s_application1/app/modules/sellerprofile/views/sellerprofile_view.dart';
// import 'package:agape_s_application1/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io';
// //import '../../sellerprofile/views/sellerprofile_view.dart';
// //import '../../chat/views/chat_view.dart';
// //import '../controllers/sellerhome_controller.dart';
// import '../../../models/product.dart';

// class SellerHomeView extends StatefulWidget {
//   //final String userId;
//   final String sellerId;

//   const SellerHomeView({
//     Key? key,
//    // required this.userId,
//     required this.sellerId,
//   }) : super(key: key);

//   @override
//   _SellerHomeViewState createState() => _SellerHomeViewState();
// }




// class _SellerHomeViewState extends State<SellerHomeView> {
//   final SellerHomeController controller = Get.find<SellerHomeController>();
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     controller.loadSellerId(); // Load the seller's ID and start streaming products
//   }

//   @override
//   Widget build(BuildContext context) {
//     final User? user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Seller Home'),
//           centerTitle: true,
//           automaticallyImplyLeading: false,

// //       actions: [
// //   IconButton(
// //     icon: Icon(Icons.notifications, color: Colors.black), // Change color as needed
// //     onPressed: () {
// //       Get.toNamed(Routes.orderRequestsView);
// //     },
// //   ),
// // ],


//         ),
//         body: Center(child: Text('User not logged in')),
//       );
//     }
//     final String userId = user.uid;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Seller Home'),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//       ),
//       body: IndexedStack(
//         index: _currentIndex,
//         children: [
//           _buildProductsTab(),
//           //ChatView(),
//           OrderRequestsView(),
//           SellerProfileView(sellerId: 'sellerId' ,),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Products'),
//           BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.blue,
//       ),
//       floatingActionButton: _currentIndex == 0
//           ? FloatingActionButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       title: Text('Add Product'),
//                       content: AddProductForm(controller: controller),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text('Cancel'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: Icon(Icons.add),
//             )
//           : null,
//     );
//   }

//   Widget _buildProductsTab() {
//     return StreamBuilder<List<Product>>(
//       stream: controller.productsStream,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }

//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }

//         if (!snapshot.hasData || snapshot.data == null) {
//           return Center(child: Text('No products available'));
//         }

//         final products = snapshot.data!;

//         if (products.isEmpty) {
//           return Center(child: Text('No products available'));
//         }

//         return ListView.builder(
//           itemCount: products.length,
//           itemBuilder: (context, index) {
//             final product = products[index];
//             return ListTile(
//               leading: Image.network(product.imagePath, width: 50, height: 50, fit: BoxFit.cover),
//               title: Text(product.name),
//               subtitle: Text('Stock: ${product.stock}\nPrice: \$${product.price}'),
//               trailing: IconButton(
//                 icon: Icon(Icons.edit),
//                 onPressed: () {
//                   showModalBottomSheet(
//                     context: context,
//                     builder: (context) {
//                       return Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           ListTile(
//                             leading: Icon(Icons.edit),
//                             title: Text('Edit'),
//                             onTap: () {
//                               Navigator.pop(context);
//                               showDialog(
//                                 context: context,
//                                 builder: (context) {
//                                   return AlertDialog(
//                                     title: Text('Edit Product'),
//                                     content: EditProductForm(
//                                       controller: controller,
//                                       product: product,
//                                     ),
//                                     actions: [
//                                       TextButton(
//                                         onPressed: () {
//                                           Navigator.of(context).pop();
//                                         },
//                                         child: Text('Cancel'),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             },
//                           ),
//                           ListTile(
//                             leading: Icon(Icons.delete),
//                             title: Text('Delete'),
//                             onTap: () async {
//                               Navigator.pop(context);
//                               await controller.deleteProduct(product.id);
//                             },
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }



// class AddProductForm extends StatefulWidget {
//   final SellerHomeController controller;

//   AddProductForm({required this.controller});

//   @override
//   _AddProductFormState createState() => _AddProductFormState();
// }

// class _AddProductFormState extends State<AddProductForm> {
//   final TextEditingController categoryController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController stockController = TextEditingController();
//   final TextEditingController businessNameController = TextEditingController();
//   final ImagePicker imagePicker = ImagePicker();
//   XFile? selectedImage;

//   Future<void> pickImage() async {
//     final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         selectedImage = pickedFile;
//       });
//     }
//   }

//   Future<String?> uploadImage(XFile? image) async {
//     if (image == null) return null;

//     final Reference storageReference = FirebaseStorage.instance
//         .ref()
//         .child('product_images')
//         .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

//     await storageReference.putFile(File(image.path));
//     return await storageReference.getDownloadURL();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(
//             controller: categoryController,
//             decoration: InputDecoration(labelText: 'Category'),
//           ),
//           TextField(
//             controller: nameController,
//             decoration: InputDecoration(labelText: 'Name'),
//           ),
//           TextField(
//             controller: priceController,
//             decoration: InputDecoration(labelText: 'Price'),
//             keyboardType: TextInputType.number,
//           ),
//           TextField(
//             controller: stockController,
//             decoration: InputDecoration(labelText: 'Stock'),
//             keyboardType: TextInputType.number,
//           ),
//           TextField(
//             controller: businessNameController,
//             decoration: InputDecoration(labelText: 'Business Name'),
//           ),
//           SizedBox(height: 10),
//           GestureDetector(
//             onTap: pickImage,
//             child: selectedImage == null
//                 ? Container(
//                     height: 150,
//                     width: double.infinity,
//                     color: Colors.grey[200],
//                     child: Icon(Icons.add_a_photo, size: 50),
//                   )
//                 : Image.file(File(selectedImage!.path), height: 150, fit: BoxFit.cover),
//           ),
//           SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () async {
//               final String category = categoryController.text.trim();
//               final String name = nameController.text.trim();
//               final double price = double.parse(priceController.text.trim());
//               final int stock = int.parse(stockController.text.trim());
//               final String businessName = businessNameController.text.trim();
//               final String imagePath = await uploadImage(selectedImage) ?? '';

//               if (category.isNotEmpty &&
//                   name.isNotEmpty &&
//                   price > 0 &&
//                   stock > 0 &&
//                   imagePath.isNotEmpty &&
//                   businessName.isNotEmpty) {
//                 final Product product = Product(
//                   id: DateTime.now().millisecondsSinceEpoch.toString(),
//                   category: category,
//                   name: name,
//                   price: price,
//                   stock: stock,
//                   imagePath: imagePath,
//                   sellerId: FirebaseAuth.instance.currentUser?.uid ?? '',
//                   businessName: businessName,
//                    lipaNambaName: '', mobilemoneyType: '', lipaNamba: '',
                  
//                 );

//                 await widget.controller.addProduct(product);
//                 Navigator.of(context).pop();
//               }
//             },
//             child: Text('Add Product'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class EditProductForm extends StatefulWidget {
//   final SellerHomeController controller;
//   final Product product;

//   EditProductForm({required this.controller, required this.product});

//   @override
//   _EditProductFormState createState() => _EditProductFormState();
// }

// class _EditProductFormState extends State<EditProductForm> {
//   late TextEditingController categoryController;
//   late TextEditingController nameController;
//   late TextEditingController priceController;
//   late TextEditingController stockController;
//   late TextEditingController businessNameController;
//   final ImagePicker imagePicker = ImagePicker();
//   XFile? selectedImage;

//   @override
//   void initState() {
//     super.initState();
//     categoryController = TextEditingController(text: widget.product.category);
//     nameController = TextEditingController(text: widget.product.name);
//     priceController = TextEditingController(text: widget.product.price.toString());
//     stockController = TextEditingController(text: widget.product.stock.toString());
//     businessNameController = TextEditingController(text: widget.product.businessName);
//   }

//   Future<void> pickImage() async {
//     final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         selectedImage = pickedFile;
//       });
//     }
//   }

//   Future<String?> uploadImage(XFile? image) async {
//     if (image == null) return null;

//     final Reference storageReference = FirebaseStorage.instance
//         .ref()
//         .child('product_images')
//         .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

//     await storageReference.putFile(File(image.path));
//     return await storageReference.getDownloadURL();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(
//             controller: categoryController,
//             decoration: InputDecoration(labelText: 'Category'),
//           ),
//           TextField(
//             controller: nameController,
//             decoration: InputDecoration(labelText: 'Name'),
//           ),
//           TextField(
//             controller: priceController,
//             decoration: InputDecoration(labelText: 'Price'),
//             keyboardType: TextInputType.number,
//           ),
//           TextField(
//             controller: stockController,
//             decoration: InputDecoration(labelText: 'Stock'),
//             keyboardType: TextInputType.number,
//           ),
//           TextField(
//             controller: businessNameController,
//             decoration: InputDecoration(labelText: 'Business Name'),
//           ),
//           SizedBox(height: 10),
//           GestureDetector(
//             onTap: pickImage,
//             child: selectedImage == null
//                 ? Image.network(widget.product.imagePath, height: 150, fit: BoxFit.cover)
//                 : Image.file(File(selectedImage!.path), height: 150, fit: BoxFit.cover),
//           ),
//           SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () async {
//               final String category = categoryController.text.trim();
//               final String name = nameController.text.trim();
//               final double price = double.parse(priceController.text.trim());
//               final int stock = int.parse(stockController.text.trim());
//               final String businessName = businessNameController.text.trim();
//               final String imagePath = selectedImage != null
//                   ? (await uploadImage(selectedImage) ?? widget.product.imagePath)
//                   : widget.product.imagePath;

//               if (category.isNotEmpty &&
//                   name.isNotEmpty &&
//                   price > 0 &&
//                   stock > 0 &&
//                   imagePath.isNotEmpty &&
//                   businessName.isNotEmpty) {
//                 final Product updatedProduct = Product(
//                   id: widget.product.id,
//                   category: category,
//                   name: name,
//                   price: price,
//                   stock: stock,
//                   imagePath: imagePath,
//                   sellerId: FirebaseAuth.instance.currentUser?.uid ?? '',
//                   businessName: businessName, lipaNamba: '', lipaNambaName: '',
//                 );

//                 await widget.controller.updateProduct(updatedProduct);
//                 Navigator.of(context).pop();
//               }
//             },
//             child: Text('Update Product'),
//           ),
//         ],
//       ),
//     );
//   }
// }


