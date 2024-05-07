import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project/Geolocation/getGeolocation.dart';
import 'package:project/Models/listRestaurants.dart';
import 'package:project/Navegation/navegationAnimation.dart';
import 'package:project/Order/mainOrders.dart';
import 'package:project/Profile/mainProfile.dart';
import 'package:project/Restaurant/restaurant.dart';
import 'package:project/navigationBar/notificationBar.dart';
import '../ShoppingBag/mainShoppingBags.dart';

class mainDashBoard extends StatefulWidget {
  const mainDashBoard({super.key});

  @override
  State<mainDashBoard> createState() => _mainDashBoardState();
}

class ListItem {
  final String imagePath;
  final String title;

  ListItem({required this.imagePath, required this.title});
}

class MyCustomScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child; // No se aplica ningún efecto adicional
  }
}

class _mainDashBoardState extends State<mainDashBoard> {
  //Variables
  int _currentIndex = 0;
  Timer? _timer;
  bool _isExpanded = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<String> _locationFuture;
  //List Section

  //Body List
  int navBarIndex = 0;

  List navBody = [const mainOrder(), const mainProfile()];

  //Image list
  List<ListItem> items = [
    ListItem(imagePath: 'assets/images/icon_burger.png', title: 'Burgers'),
    ListItem(imagePath: 'assets/images/icon_pizza.png', title: 'Pizzas'),
    ListItem(imagePath: 'assets/images/icon_beer.png', title: 'Alcohol'),
    ListItem(imagePath: 'assets/images/icon_breakfast.png', title: 'Breakfast'),
    ListItem(imagePath: 'assets/images/icon_cake.png', title: 'Desserts'),
    ListItem(imagePath: 'assets/images/icon_salads.png', title: 'Salads'),
    ListItem(imagePath: 'assets/images/icon_sandwich.png', title: 'Sandwiches'),
    ListItem(imagePath: 'assets/images/icon_taco.png', title: 'Tacos'),
    ListItem(imagePath: 'assets/images/icon_hotDog.png', title: 'Hot Dogs'),
  ];

  //Image list
  final List<String> _imageList = [
    'assets/images/carusel_img3.jpg',
    'assets/images/carusel_img7.jpg',
    'assets/images/carusel_img2.jpg',
    'assets/images/carusel_img4.jpg',
    'assets/images/carusel_img5.jpg',
    'assets/images/carusel_img6.jpg',
    'assets/images/carusel_img1.jpg',
  ];

  //Controllers
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _startTimer();
    setStatusBarLightStyle();
    _locationFuture = getLocation(context);
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imageList.length;
      });
    });
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
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
                    topContent(),
                    foodContent(),
                    restaurantContent(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  topContent() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration:
                const Duration(milliseconds: 400), // Duración de la animación
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Container(
              key: ValueKey<String>(
                  _imageList[_currentIndex]), // Clave única para cada imagen
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_imageList[_currentIndex]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.06,
              left: MediaQuery.of(context).size.height * 0.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: _isExpanded
                            ? MediaQuery.of(context).size.width * 0.65
                            : MediaQuery.of(context).size.width * 0.12,
                        height: MediaQuery.of(context).size.height * 0.055,
                        margin: EdgeInsets.only(
                            left: _isExpanded
                                ? MediaQuery.of(context).size.height * 0.0
                                : MediaQuery.of(context).size.height * 0.015),
                        decoration: BoxDecoration(
                          color: _isExpanded
                              ? const Color.fromARGB(255, 255, 94, 0)
                              : const Color.fromARGB(255, 255, 94, 0),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(_isExpanded ? 0 : 100),
                            right: Radius.circular(_isExpanded ? 100 : 100),
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height *
                                      0.006,
                                ),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  size: 35,
                                  color:
                                      _isExpanded ? Colors.white : Colors.white,
                                ),
                              ),
                              if (_isExpanded)
                                Center(
                                  child: FutureBuilder<String>(
                                    future: _locationFuture,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          '${snapshot.data}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            fontFamily: 'QuickSand-Bold',
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        );
                                      } else {
                                        return Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.45,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.039,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      Color.fromARGB(
                                                          255, 255, 255, 255)),
                                              strokeWidth: 2.5,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          crearRuta(context, const mainShoppingBag()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: MediaQuery.of(context).size.height * 0.055,
                        padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.9,
                          bottom: MediaQuery.of(context).size.width * 0.9,
                        ),
                        margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.02,
                        ),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(0, 255, 94, 0),
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(100),
                                right: Radius.circular(100))),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 35,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    left: MediaQuery.of(context).size.height * 0.015,
                    right: MediaQuery.of(context).size.height * 0.015,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontFamily: 'QuickSand',
                      ),
                      prefixIcon: const Icon(Icons.search,
                          color: Color.fromARGB(255, 83, 83, 83)),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 228, 228, 228)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 228, 228, 228),
                            width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 153, 93),
                            width: 2.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  foodContent() {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.16,
        child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(items.length, (index) {
                ListItem item = items[index];

                return GestureDetector(
                  onTap: () {
                    print("Se presionó el ítem: ${item.title}");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.11,
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.01,
                      right: MediaQuery.of(context).size.height * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(25), // Esquinas redondeadas

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.2), // Color de la sombra
                          spreadRadius: 1, // Extensión de la sombra
                          blurRadius: 5, // Desenfoque de la sombra
                          offset: const Offset(0,
                              3), // Desplazamiento horizontal y vertical de la sombra
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          height: MediaQuery.of(context).size.height * 0.07,
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.005,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(item.imagePath),
                              fit: BoxFit.contain,
                            ),
                            borderRadius:
                                BorderRadius.circular(10), // Bordes redondeados
                          ),
                        ),
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'QuickSand-Bold',
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ));
  }

  restaurantContent() {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.415,
        width: MediaQuery.of(context).size.height * 1,
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
                    Navigator.push(
                      context,
                      crearRuta(
                          context, restaurantPage(restaurant: restaurant)),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.15,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                      bottom: MediaQuery.of(context).size.height * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.12,
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.03,
                            right: MediaQuery.of(context).size.height * 0.02,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(restaurant.imagePath),
                              fit: BoxFit.contain,
                            ), // Bordes redondeados
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.47,
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
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
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    color: Color.fromARGB(255, 255, 94, 0),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.005,
                                    ),
                                    child: Text(
                                      '${restaurant.stars}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontFamily: 'QuickSand',
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.motorcycle,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      ' ${restaurant.time} Min  •  \$${restaurant.deliveryCost} Mx',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontFamily: 'QuickSand',
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  restaurant.isFavorite =
                                      !restaurant.isFavorite;
                                  if (restaurant.isFavorite) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            "${restaurant.title} has been added to favorites"),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                curve: Curves.elasticIn,
                                width: MediaQuery.of(context).size.width * 0.09,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                alignment: Alignment.topCenter,
                                child: Container(
                                  child: Icon(
                                    restaurant.isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: restaurant.isFavorite
                                        ? const Color.fromARGB(255, 255, 17, 0)
                                        : null,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
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
