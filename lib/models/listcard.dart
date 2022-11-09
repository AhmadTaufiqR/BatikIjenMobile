class ListCardProduct {
  final String image, name, desc;
  final int price;

  ListCardProduct(
      {required this.image,
      required this.name,
      required this.desc,
      required this.price});
}

List<ListCardProduct> card = [
  ListCardProduct(
      image: 'assets/category/batik cap.png',
      name: 'Batik Cap Khas Jember',
      desc:
          'Batik ini adalah hasil maha karya asli orang jember yang terbuat dari bahan yang berkualitas dan tidak akan luntur',
      price: 200000),
  ListCardProduct(
      image: 'assets/category/batik celup.png',
      name: 'Batik Celup Khas Bondowoso',
      desc:
          'Batik ini adalah hasil maha karya asli orang jember yang terbuat dari bahan yang berkualitas dan tidak akan luntur',
      price: 300000),
];
