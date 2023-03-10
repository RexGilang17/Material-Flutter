import 'package:flutter/material.dart';

List<Product> productData = [
  Product(
      productPrice: 369000,
      productName: "Headset Gaming",
      productImage: "images/Av.jpg"),
  Product(productPrice: 249000, productName: "Microphone"),
  Product(productPrice: 599000, productName: "SSD NVME 256"),
  Product(productPrice: 220000, productName: "Kamera"),
  Product(productPrice: 70000, productName: "Mouse pad"),
  Product(productPrice: 109000, productName: "Mouse")
];

class CommerceApp extends StatefulWidget {
  CommerceApp({super.key});

  @override
  State<CommerceApp> createState() => _CommerceAppState();
}

class _CommerceAppState extends State<CommerceApp> {
  bool isDark = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: isDark ? Brightness.dark : Brightness.light,
        ),
        home: ShopPage(
          themeValue: isDark,
          themeChangedCallback: () {
            setState(() {
              isDark = !isDark;
            });
          },
        ));
  }
}

class ShopPage extends StatefulWidget {
  ShopPage(
      {super.key,
      required this.themeValue,
      required this.themeChangedCallback});
  bool themeValue;
  VoidCallback themeChangedCallback;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Shop"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FavoritePage()));
                },
                icon: Icon(Icons.favorite)),
            Switch(
              value: widget.themeValue,
              onChanged: (value) {
                widget.themeChangedCallback();
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: productData.length,
          itemBuilder: (context, index) {
            return ProductCard(product: productData[index]);
          },
        )
        );
  }
}

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorite Product"),
      ),
      body: ListView.builder(
        itemCount: productData.length,
        itemBuilder: (context, index) {
          if (productData[index].isFav) {
            return ProductCard(product: productData[index]);
          } else
            return Container();
        },
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  Product product;
  ProductCard({required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: Image.asset(widget.product.productImage),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.productName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("Rp.${widget.product.productPrice}")
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.product.favorite();
                  });
                },
                icon: widget.product.isFav
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(Icons.favorite_border_rounded))
          ],
        ),
      ),
    );
  }
}

class Product {
  String productName;
  int productPrice;
  String productImage;
  bool isFav = false;
  Product(
      {required this.productPrice,
      required this.productName,
      this.productImage = "images/headset.jpg"});

  void favorite() {
    isFav = !isFav;
  }
}
