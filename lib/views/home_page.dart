import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/services/get_all_product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.cartShopping),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("New Trends"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 70),
        child: FutureBuilder(
            future: GetAllProductService().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                      mainAxisSpacing: 100,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) => CustomCard(
                    products: products[index],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
