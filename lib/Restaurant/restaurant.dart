import 'package:flutter/material.dart';
import 'package:project/Models/listRestaurants.dart';
import 'package:project/Restaurant/iteamSlider.dart';
import 'package:project/navigationBar/notificationBar.dart';

class restaurantPage extends StatefulWidget {
  final ListRestaurant restaurant;
  const restaurantPage({super.key, required this.restaurant});

  @override
  State<restaurantPage> createState() => _restaurantPageState();
}

class ListRestaurantIteam {
  final String imagePath;
  final String title;
  final String description;
  final double price;
  ListRestaurantIteam({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  });
}

class _restaurantPageState extends State<restaurantPage> {
  //Restaurants list
  List<ListRestaurantIteam> restaurantIteams = [
    ListRestaurantIteam(
      imagePath: 'assets/images/menu_iteam_1.webp',
      title: 'Famous Star® with Cheese',
      description:
          'Charbroiled all-beef patty, melted American cheese, lettuce, tomato, '
          'sliced onions, dill pickles, Special Sauce, and mayonnaise on a seeded bun.',
      price: 105.00,
    ),
    ListRestaurantIteam(
      imagePath: 'assets/images/menu_iteam_2.webp',
      title: 'Hand-Breaded Chiken Sandwich',
      description:
          'Premium, all-white chicken fillet, hand dipped in buttermilk, lightly '
          'breaded and fried to a golden brown, garlic pickle and mayonnaise served on a potato bun.',
      price: 120.00,
    ),
    ListRestaurantIteam(
      imagePath: 'assets/images/menu_iteam_3.webp',
      title: 'Double Wester Bacon CheeseBurger®',
      description:
          'Two charbroiled all-beef patties, two strips of bacon, two slices '
          'of melted American cheese, crispy onion rings and tangy BBQ Sauce on a seeded bun.',
      price: 190.00,
    ),
    ListRestaurantIteam(
      imagePath: 'assets/images/menu_iteam_4.webp',
      title: '6 Piece - Chicken Stars™',
      description:
          'Crispy star-shaped chicken nuggets with the choice of dipping sauce. '
          'Served with Fries and a Soft Drink.',
      price: 165.00,
    ),
    ListRestaurantIteam(
      imagePath: 'assets/images/menu_iteam_5.webp',
      title: 'Natural-Cut French Fries',
      description: 'Premium-quality, skin-on, Natural-Cut French fries.',
      price: 70.00,
    ),
    ListRestaurantIteam(
      imagePath: 'assets/images/menu_iteam_6.webp',
      title: 'El Diablo Loaded Fries™',
      description: 'Natural-Cut fries topped with fiery habanero sauce, '
          'shredded cheese, and jalapeno coins',
      price: 95.00,
    ),
    ListRestaurantIteam(
      imagePath: 'assets/images/menu_iteam_7.webp',
      title: 'Hand-Scooped Ice-Cream Oreo Shake™',
      description: 'Creamy, hand-scooped ice cream blended with real milk and '
          'topped with Whipped Topping.',
      price: 75.00,
    ),
    ListRestaurantIteam(
      imagePath: 'assets/images/menu_iteam_8.webp',
      title: 'Hand-Scooped Ice-Cream Strawberry Shake™',
      description: 'Creamy, hand-scooped ice cream blended with real milk and '
          'topped with Whipped Topping.',
      price: 75.00,
    ),
    ListRestaurantIteam(
      imagePath: 'assets/images/menu_iteam_9.webp',
      title: 'Chocolate Chip Cookie',
      description: 'Semi-sweet chocolate chip cookies.',
      price: 40.00,
    ),
  ];

  @override
  void initState() {
    super.initState();
    setStatusBarDarkStyle();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: CustomScrollView(
        slivers: [disenoSuperior(), disenoInferior()],
      )),
    );
  }

  disenoSuperior() {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true, // Esto centra el título en la AppBar
      actions: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.restaurant.isFavorite =
                        !widget.restaurant.isFavorite;
                    if (widget.restaurant.isFavorite) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "${widget.restaurant.title} has been added to favorites"),
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
                  height: MediaQuery.of(context).size.height * 0.12,
                  alignment: Alignment.topCenter,
                  child: Container(
                    child: Icon(
                      widget.restaurant.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.restaurant.isFavorite
                          ? const Color.fromARGB(255, 255, 17, 0)
                          : null,
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.18,

      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Calcular la tasa de colapso del SliverAppBar
          var rate = (constraints.biggest.height - kToolbarHeight) /
              (MediaQuery.of(context).size.height * 0.18 - kToolbarHeight);
          // Determinar la visibilidad del título basado en el tamaño actual
          var visible = rate <
              0.5; // Ajusta este valor si es necesario para controlar cuándo aparece el título

          return FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            title: visible
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 1,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.02,
                      bottom: MediaQuery.of(context).size.height * 0.02,
                    ),
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Text(
                      widget.restaurant.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontFamily: 'Quicksand-Bold',
                        color: const Color.fromARGB(255, 0, 0, 0),
                        letterSpacing:
                            MediaQuery.of(context).size.width * 0.015,
                      ),
                    ),
                  )
                : null,
            background: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 238, 238, 238),
                image: DecorationImage(
                  image: AssetImage(widget.restaurant.imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            collapseMode: CollapseMode
                .none, // Juega con los modos para ver cuál te gusta más
          );
        },
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(12.0),
        child: Container(
          height: 15,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.05,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 238, 238, 238),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.10), // Sombra gris con ligera opacidad
                spreadRadius: 0.6, // Cuánto se expande la sombra
                blurRadius: 6, // Cuánto se difumina la sombra
                offset:
                    const Offset(0, -6), // Desplazamiento de la sombra (eje X, eje Y)
              ),
            ],
          ),
        ),
      ),
    );
  }

  disenoInferior() {
    return SliverToBoxAdapter(
      child: Container(
        height: MediaQuery.of(context).size.height * 1.49,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 238, 238, 238),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.height * 1,
              child: Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.height * 0.14,
                    child: Column(
                      children: [
                        Text(
                          'Wappi Delivery',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            fontFamily: 'Quicksand',
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(
                          '${widget.restaurant.time} min',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontFamily: 'Quicksand-Bold',
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: 1,
                    color: const Color.fromARGB(255, 177, 177, 177),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.height * 0.12,
                    child: Column(
                      children: [
                        Text(
                          'Delivery Fee',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            fontFamily: 'Quicksand',
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(
                          '\$${widget.restaurant.deliveryCost} Mx',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontFamily: 'Quicksand-Bold',
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.07,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: Color.fromARGB(255, 255, 94, 0),
                        ),
                        Text(
                          '${widget.restaurant.stars}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.055,
                            fontFamily: 'Quicksand-Bold',
                            color: const Color.fromARGB(255, 255, 94, 0),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.height * 1,
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.menu_rounded,
                    size: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontFamily: 'Quicksand-Bold',
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            restaurantMenu(),
          ],
        ),
      ),
    );
  }

  restaurantMenu() {
    return Column(
      children: List.generate(restaurantIteams.length, (index) {
        ListRestaurantIteam restaurantIteam = restaurantIteams[index];

        return GestureDetector(
          onTap: () {
            showItemDetails(context, restaurantIteam);
          },
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.15,
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              restaurantIteam.title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                fontFamily: 'Quicksand-Bold',
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Esta línea añade los puntos suspensivos
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              restaurantIteam.description,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                                fontFamily: 'Quicksand',
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Esta línea añade los puntos suspensivos
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              '\$${restaurantIteam.price} Mx',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                                fontFamily: 'Quicksand-Bold',
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.01,
                        right: MediaQuery.of(context).size.height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(restaurantIteam.imagePath),
                          fit: BoxFit.fill,
                        ), // Bordes redondeados
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.height * 0.39,
                color: const Color.fromARGB(255, 221, 221, 221),
              ),
            ],
          ),
        );
      }),
    );
  }
}
