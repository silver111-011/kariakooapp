




import 'package:agape_s_application1/app/repositories/cartrepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../../models/product.dart';
import '../../cart/controllers/cart_controller.dart';
import '../controllers/bidhaa_details_controller.dart';

class BidhaaDetailsView extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    // Retrieve arguments
    final arguments = Get.arguments;

    if (arguments == null || arguments is! Map<String, dynamic>) {
      // Handle the case when arguments are null or not of the expected type
      // Log the error for debugging
      debugPrint("Error: Arguments are null or not of type Map<String, dynamic>");
      // Optionally, navigate back, show an error, or provide default values
      // Here, we navigate back to the previous page
      Future.microtask(() => Get.back());
      return Scaffold(
        body: Center(
          child: Text('Error: Missing or invalid arguments'),
        ),
      );
    }

    final Map<String, dynamic> args = arguments;
    final Product product = args['product'];
    final String userId = args['userId'];

    // Debugging: Check if arguments are not null
    assert(product != null, 'Product is null');
    assert(userId != null, 'User ID is null');


    // Initialize the controller with the arguments
    final BidhaaDetailsController controller = Get.put(BidhaaDetailsController(product: product, userId: userId));
    //final CartRepository cartRepository = CartRepository(userId: userId);
    final CartRepository cartRepository = Get.find<CartRepository>();
     final CartController cartController = Get.put(CartController(cartRepository));
   // final CartController cartController =  Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Bidhaa: ${product.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Bei: Tsh ${product.price}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Muuzaji: ${product.businessName}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Expanded(
              child: Image.network(
                product.imagePath, // Assuming the product model has an imageUrl property
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
               Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.startChat();
                      Get.toNamed(Routes.chatView, arguments: {
                        'userId': userId,
                        'sellerId': product.sellerId,
                        'productId': product.id,
                        'sellerName': product.businessName,
                        'productName': product.name,
                        'productImage': product.imagePath,
                        'buyerName': userId // or fetch from user data
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:Theme.of(context).primaryColor,// Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(double.infinity, 60), // Increase the height of the button
                    ),
                    child: Text('Chati'),
                  ),
                ),
                
                SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      cartController.addProduct(product);
                      Get.toNamed(Routes.cartView);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(double.infinity, 60), // Increase the height of the button
                    ),
                    child: Text('Ongeza kwa cart'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
