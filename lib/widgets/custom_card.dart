import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';

import '../views/update_product_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.routeName,
            arguments: products);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.1),
                    spreadRadius: 0,
                    offset: Offset(10, 10),
                    blurRadius: 0)
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${products.title}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${products.price}",
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 50,
            top: -40,
            child: Image.network(
              "${products.image}",
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
