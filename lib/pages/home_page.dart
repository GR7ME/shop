import 'package:flutter/material.dart';
import 'package:shop/apiServices/api_services.dart';
import 'package:shop/pages/product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: apiService().getAllProducts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Center(child: ListTile(
                  leading: Image.network(snapshot.data[index]["image"]),
                  title: Text(snapshot.data[index]["title"]),
                  subtitle: Text("Price: "+snapshot.data[index]["price"].toString()),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage(snapshot.data[index]["id"]))),
                ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
