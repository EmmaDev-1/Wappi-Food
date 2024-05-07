class ListRestaurant {
  final String imagePath;
  final String title;
  final double stars;
  final String time;
  final String deliveryCost;
  bool isFavorite;

  ListRestaurant(
      {required this.imagePath,
      required this.title,
      required this.stars,
      required this.time,
      required this.deliveryCost,
      required this.isFavorite});
}

//Restaurants list
List<ListRestaurant> restaurants = [
  ListRestaurant(
      imagePath: 'assets/images/restaurant_carlsJr.png',
      title: 'Carl\'s Jr',
      stars: 5.0,
      time: '20-30',
      deliveryCost: '15',
      isFavorite: false),
  ListRestaurant(
      imagePath: 'assets/images/restaurant_chilis.png',
      title: 'Chili\'s',
      stars: 4.5,
      time: '20-45',
      deliveryCost: '25',
      isFavorite: false),
  ListRestaurant(
      imagePath: 'assets/images/restaurant_donuts.png',
      title: 'Donkin Donuts',
      stars: 3.8,
      time: '15-20',
      deliveryCost: '10',
      isFavorite: false),
  ListRestaurant(
      imagePath: 'assets/images/restaurant_mcdonalds.png',
      title: 'Mc Donald\'s',
      stars: 3.4,
      time: '20-30',
      deliveryCost: '15',
      isFavorite: false),
  ListRestaurant(
      imagePath: 'assets/images/restaurant_pandaExpress.png',
      title: 'Panda Express',
      stars: 3.1,
      time: '20-30',
      deliveryCost: '15',
      isFavorite: false),
  ListRestaurant(
      imagePath: 'assets/images/restaurant_pizzaHot.png',
      title: 'Pizza Hut',
      stars: 4.9,
      time: '40-50',
      deliveryCost: '25',
      isFavorite: false),
  ListRestaurant(
      imagePath: 'assets/images/restaurant_subway.png',
      title: 'Subway',
      stars: 4.0,
      time: '25-45',
      deliveryCost: '25',
      isFavorite: false),
  ListRestaurant(
      imagePath: 'assets/images/restaurant_taqueria.jpg',
      title: 'Gonsaleña',
      stars: 5,
      time: '10-15',
      deliveryCost: '15',
      isFavorite: false),
  ListRestaurant(
      imagePath: 'assets/images/restaurant_vips.png',
      title: 'Vips',
      stars: 4.9,
      time: '30-50',
      deliveryCost: '30',
      isFavorite: false),
  ListRestaurant(
      imagePath: 'assets/images/restaurant_wingStop.png',
      title: 'Wing Stop',
      stars: 4.6,
      time: '30-45',
      deliveryCost: '20',
      isFavorite: false),
];
