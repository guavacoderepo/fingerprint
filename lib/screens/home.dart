import 'package:fingerprint/modules/products.dart';
import 'package:fingerprint/utilities/font.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../utilities/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blue,
        leading: const Icon(IconlyLight.notification),
        title: h2("Xenia", color: white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: white.withOpacity(0.6),
              child: const Icon(IconlyLight.profile),
            ),
          )
        ],
      ),
      body: FutureBuilder<Products>(
        future: productsclass.fatchproducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: snapshot.data!.products.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    // contentPadding: EdgeInsets.all(),
                    dense: true,
                    isThreeLine: true,
                    leading: SizedBox(
                      height: 80,
                      width: 80,
                      child: FadeInImage.assetNetwork(
                        placeholder: "images/placeholder.png",
                        image: snapshot.data!.products[i].thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: h2(snapshot.data!.products[i].brand,
                        size: 16, align: TextAlign.left),
                    subtitle: h2(snapshot.data!.products[i].category,
                        size: 12, align: TextAlign.left),
                    trailing: h2(
                        "\$ ${snapshot.data!.products[i].price.toString()}",
                        size: 12,
                        align: TextAlign.left),
                  );
                });
          } else {
            return h2("loading");
          }
        },
      ),
    );
  }
}
