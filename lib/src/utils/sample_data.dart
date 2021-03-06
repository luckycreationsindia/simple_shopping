import 'package:simple_shopping/src/models/product.dart';

class SampleData {
  static List<Product> allProducts = [];

  List<Product> generateProductData() {
    allProducts.clear();
    List<Product> result = [];
    result.add(
      Product(
        id: "1",
        name: "Men 1",
        description:
            "Keep this hip this season with the HRX Men's Athleisure T-shirt.\nThis versatile T-shirt can be styled any way you like for the ultimate gym-to-street look.",
        image: "assets/images/products/men1.jpg",
        price: 400.00,
        tags: ['Men', 'Blue'],
      ),
    );
    result.add(
      Product(
        id: "2",
        name: "Men 2",
        description:
        "Keep this hip this season with the HRX Men's Athleisure T-shirt.\nThis versatile T-shirt can be styled any way you like for the ultimate gym-to-street look.",
        image: "assets/images/products/men2.png",
        price: 200.00,
        tags: ['Men', 'Yellow'],
      ),
    );
    result.add(
      Product(
        id: "3",
        name: "Men 3",
        description:
        "Keep this hip this season with the HRX Men's Athleisure T-shirt.\nThis versatile T-shirt can be styled any way you like for the ultimate gym-to-street look.",
        image: "assets/images/products/men3.png",
        price: 800.00,
        tags: ['Men', 'Red'],
      ),
    );
    result.add(
      Product(
        id: "4",
        name: "Women 1",
        description:
        "Keep this hip this season with the HRX Men's Athleisure T-shirt.\nThis versatile T-shirt can be styled any way you like for the ultimate gym-to-street look.",
        image: "assets/images/products/women1.png",
        price: 400.00,
        tags: ['Women', 'Red'],
      ),
    );
    result.add(
      Product(
        id: "5",
        name: "Women 2",
        description:
        "Keep this hip this season with the HRX Men's Athleisure T-shirt.\nThis versatile T-shirt can be styled any way you like for the ultimate gym-to-street look.",
        image: "assets/images/products/women2.png",
        price: 500.00,
        tags: ['Women', 'Red'],
      ),
    );
    result.add(
      Product(
        id: "6",
        name: "Women 3",
        description:
        "Keep this hip this season with the HRX Men's Athleisure T-shirt.\nThis versatile T-shirt can be styled any way you like for the ultimate gym-to-street look.",
        image: "assets/images/products/women3.png",
        price: 1800.00,
        tags: ['Women', 'Red'],
      ),
    );
    result.add(
      Product(
        id: "7",
        name: "Kid 1",
        description:
        "Keep this hip this season with the HRX Men's Athleisure T-shirt.\nThis versatile T-shirt can be styled any way you like for the ultimate gym-to-street look.",
        image: "assets/images/products/kid1.png",
        price: 1400.00,
        tags: ['Kid', 'Blue'],
      ),
    );
    result.add(
      Product(
        id: "8",
        name: "Kid 2",
        description:
        "Keep this hip this season with the HRX Men's Athleisure T-shirt.\nThis versatile T-shirt can be styled any way you like for the ultimate gym-to-street look.",
        image: "assets/images/products/kid2.png",
        price: 1500.00,
        tags: ['Kid', 'Purple'],
      ),
    );
    result.add(
      Product(
        id: "9",
        name: "Kid 3",
        description:
        "Keep this hip this season with the HRX Men's Athleisure T-shirt.\nThis versatile T-shirt can be styled any way you like for the ultimate gym-to-street look.",
        image: "assets/images/products/kid3.png",
        price: 1700.00,
        tags: ['Kid', 'Blue'],
      ),
    );

    allProducts.addAll(result);

    return result;
  }
}
