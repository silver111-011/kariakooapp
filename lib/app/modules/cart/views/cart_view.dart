









// cart_view.dart
import 'package:agape_s_application1/app/models/orderRequest.dart';
import 'package:agape_s_application1/app/modules/OrderRequest/controllers/orderRequest_controller.dart';
import 'package:agape_s_application1/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';


class CartView extends StatelessWidget {
  final OrderRequestsController orderRequestsController = Get.put(OrderRequestsController());

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to order requests page or show notifications
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.products.isEmpty) {
          return Center(
            child: Text('Hakuna chochote'),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    final quantity = controller.quantities[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Row(
                          children: [
                            Image.network(
                              product.imagePath,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    Text('Tsh ${product.price}'),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () {
                                            controller.removeProduct(product);
                                          },
                                        ),
                                        Text('$quantity'),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            controller.addProduct(product);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jumla Tsh ${controller.totalPrice}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final orderRequest = OrderRequest(
                          orderId: 'unique_order_id', // Generate a unique order ID
                          buyerId: 'current_user_id', // Get the current user's ID
                          sellerId: 'seller_id', // Get the seller's ID
                          products: controller.products,
                          quantities: controller.quantities,
                          totalPrice: controller.totalPrice,
                        );
                        orderRequestsController.addOrderRequest(orderRequest);
                        Get.toNamed(Routes.paymentView, arguments: {
                          'orderRequest': orderRequest,
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                        minimumSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        'ingiza',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
         
            ],
          );
        }
      }),
    );
  }


}


