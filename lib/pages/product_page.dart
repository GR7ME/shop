import 'package:flutter/material.dart';
import 'package:shop/apiServices/api_services.dart';

class ProductsPage extends StatelessWidget {
  final int id;
  ProductsPage(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Page"),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: apiService().getOneProducts(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Image.network(
                      snapshot.data["image"],
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(height: 10),
                    Text(snapshot.data["title"]),
                    const SizedBox(height: 10),
                    Text("Price : ${snapshot.data["price"]}"),
                    const SizedBox(height: 10),
                    Text("Description : ${snapshot.data["description"]}")
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
