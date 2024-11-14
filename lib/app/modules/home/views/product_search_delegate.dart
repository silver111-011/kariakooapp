import 'package:agape_s_application1/repositories/AuthenticationRepository.dart';
import 'package:agape_s_application1/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class ProductSearchDelegate extends SearchDelegate {
  final HomeController homeController = Get.find<HomeController>();

   @override
  String get searchFieldLabel => 'Tafuta'; // Changed the placeholder text to Kiswahili

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = homeController.products.where((product) =>
        product.name.toLowerCase().contains(query.toLowerCase()) ||
        product.businessName.toLowerCase().contains(query.toLowerCase()));

    return ListView(
      children: results.map((product) {
        return ListTile(
          title: Text(product.name),
          subtitle: Text(product.businessName),
          onTap: () {
            final userId = Get.find<AuthenticationRepository>().getCurrentUserId();
            Get.toNamed(
              Routes.bidhaaDetailsView,
              arguments: {'product': product, 'userId': userId},
            );
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = homeController.products.where((product) =>
        product.name.toLowerCase().contains(query.toLowerCase()) ||
        product.businessName.toLowerCase().contains(query.toLowerCase()));

    return ListView(
      children: suggestions.map((product) {
        return ListTile(
          title: Text(product.name),
          subtitle: Text(product.businessName),
          onTap: () {
            query = product.name;
            showResults(context);
          },
        );
      }).toList(),
    );
  }
}
