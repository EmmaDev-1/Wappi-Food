import 'package:flutter/material.dart';

class mainOrder extends StatefulWidget {
  const mainOrder({super.key});

  @override
  State<mainOrder> createState() => _mainOrderState();
}

class ListRestaurant {
  final String imagePath;
  final String title;
  final int iteam;
  final String time;
  final String deliveryCost;
  bool isFavorite;

  ListRestaurant(
      {required this.imagePath,
      required this.title,
      required this.iteam,
      required this.time,
      required this.deliveryCost,
      required this.isFavorite});
}

class MyCustomScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child; // No se aplica ningún efecto adicional
  }
}

class _mainOrderState extends State<mainOrder> {
  //Restaurants
  //Restaurants list
  List<ListRestaurant> restaurants = [
    ListRestaurant(
        imagePath: 'assets/images/restaurant_taqueria.jpg',
        title: 'Gonsaleña',
        iteam: 2,
        time: '3-Feb-2024',
        deliveryCost: '200',
        isFavorite: false),
    ListRestaurant(
        imagePath: 'assets/images/restaurant_carlsJr.png',
        title: 'Carl\'s Jr',
        iteam: 4,
        time: '25-Jan-2024',
        deliveryCost: '450',
        isFavorite: false),
    ListRestaurant(
        imagePath: 'assets/images/restaurant_pizzaHot.png',
        title: 'Pizza Hut',
        iteam: 2,
        time: '5-Jan-2024',
        deliveryCost: '230',
        isFavorite: false),
    ListRestaurant(
        imagePath: 'assets/images/restaurant_pandaExpress.png',
        title: 'Panda Express',
        iteam: 5,
        time: '2-Jan-2024',
        deliveryCost: '258',
        isFavorite: false),
    ListRestaurant(
        imagePath: 'assets/images/restaurant_carlsJr.png',
        title: 'Carl\'s Jr',
        iteam: 2,
        time: '27-Dec-2023',
        deliveryCost: '489',
        isFavorite: false),
    ListRestaurant(
        imagePath: 'assets/images/restaurant_mcdonalds.png',
        title: 'Mc Donald\'s',
        iteam: 1,
        time: '15-Dec-2023',
        deliveryCost: '125',
        isFavorite: false),
    ListRestaurant(
        imagePath: 'assets/images/restaurant_wingStop.png',
        title: 'Wing Stop',
        iteam: 3,
        time: '8-Dec-2023',
        deliveryCost: '650',
        isFavorite: false),
  ];

  //Controllers
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                    children: [
                      headerContent(),
                      ordersContent(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  headerContent() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 1,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.065,
        left: MediaQuery.of(context).size.height * 0.015,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        'My Orders',
        style: TextStyle(
          fontFamily: 'QuickSand-Bold',
          fontSize: MediaQuery.of(context).size.width * 0.07,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }

  ordersContent() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.height * 1,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.003,
        ),
        child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(restaurants.length, (index) {
                ListRestaurant restaurant = restaurants[index];

                return GestureDetector(
                  onTap: () {
                    print("Se presionó el ítem: ${restaurant.title}");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 0.14,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.001,
                      bottom: MediaQuery.of(context).size.height * 0.001,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 194, 194, 194)
                              .withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.22,
                                  height: MediaQuery.of(context).size.height *
                                      0.135,
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.015,
                                    top: MediaQuery.of(context).size.height *
                                        0.005,
                                    right: MediaQuery.of(context).size.height *
                                        0.015,
                                  ),
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.084,
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(restaurant.imagePath),
                                        fit: BoxFit.contain,
                                      ), // Bordes redondeados
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: MediaQuery.of(context).size.height *
                                        0.03,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.09,
                                      margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        right:
                                            MediaQuery.of(context).size.height *
                                                0.015,
                                      ),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/icon_order.png'),
                                              fit: BoxFit.cover)),
                                    ))
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                margin: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                child: Text(
                                  restaurant.title,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    fontFamily: 'Quicksand-Bold',
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.007,
                                ),
                                child: Text(
                                  '${restaurant.iteam} iteams • \$${restaurant.deliveryCost}MX',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontFamily: 'QuickSand',
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.007,
                                ),
                                child: Text(
                                  ' ${restaurant.time}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontFamily: 'QuickSand',
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.26,
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.005,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              /*
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => navigationBar()),
                );
                */
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 226, 226,
                                  226), // Puedes cambiar el color aquí
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: const Text(
                              'See shop',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Quicksand-Bold',
                                color: Color.fromARGB(255, 83, 83, 83),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ));
  }
}
