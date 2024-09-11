import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/services/update_product.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  static const routeName = "updateProductPage";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName;

  String? productDescription;

  num? price;

  String? image;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("UpdateProduct"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormFieldWidget(
                  hintText: "Product name",
                  onChange: (data) {
                    productName = data;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormFieldWidget(
                  hintText: "Product description",
                  onChange: (data) {
                    productDescription = data;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormFieldWidget(
                  keyboardType: TextInputType.number,
                  hintText: "Product price",
                  onChange: (data) {
                    price = num.parse(data);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormFieldWidget(
                  hintText: "Product image",
                  onChange: (data) {
                    image = data;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                  buttonText: "Update",
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      await updateProduct(product);
                      print("success");
                    } on Exception catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        title: productName ?? product.title,
        price: price == null ? product.price : price,
        des: productDescription ?? product.description,
        image: image ?? product.image,
        id: product.id,
        category: product.category);
  }
}
