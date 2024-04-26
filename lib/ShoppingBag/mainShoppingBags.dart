import 'package:flutter/material.dart';
import 'package:project/DashBoard/mainDashBoard.dart';
import 'package:lottie/lottie.dart';

class mainShoppingBag extends StatefulWidget {
  const mainShoppingBag({super.key});

  @override
  State<mainShoppingBag> createState() => _mainShoppingBagState();
}

class ShoppingList {
  final String imagePath;
  final String title;
  final String price;
  final int cout;
  final String restaurant;

  ShoppingList({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.cout,
    required this.restaurant,
  });
}

class _mainShoppingBagState extends State<mainShoppingBag>
    with SingleTickerProviderStateMixin {
  //variables

  //Controllers
  ScrollController _scrollController = ScrollController();
  late AnimationController successAnimationController;

  //ShoppingList list
  List<ShoppingList> shoppingLists = [
    ShoppingList(
        imagePath: 'assets/images/shoppingBagItem1.png',
        title: 'Fried Rice',
        price: "89.0",
        cout: 1,
        restaurant: 'Panda Express'),
    ShoppingList(
        imagePath: 'assets/images/shoppingBagItem2.png',
        title: 'Chow Mein',
        price: "99.0",
        cout: 1,
        restaurant: 'Panda Express'),
    ShoppingList(
        imagePath: 'assets/images/shoppingBagItem3.png',
        title: 'Orange Chicken',
        price: "198.0",
        cout: 2,
        restaurant: 'Panda Express'),
    ShoppingList(
        imagePath: 'assets/images/shoppingBagItem4.png',
        title: 'Broccoli Beef',
        price: "198.0",
        cout: 2,
        restaurant: 'Panda Express'),
    ShoppingList(
        imagePath: 'assets/images/shoppingBagItem5.png',
        title: 'Pepsi',
        price: "50.0",
        cout: 2,
        restaurant: 'Panda Express'),
  ];

  @override
  void initState() {
    super.initState();
    successAnimationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
  }

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
                      shoppingListContent(),
                      payBotton()
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
        top: MediaQuery.of(context).size.height * 0.06,
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
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width * 0.15,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Text(
              'Shopping Bag',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'QuickSand-Bold',
                fontSize: MediaQuery.of(context).size.width * 0.07,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  shoppingListContent() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.81,
        width: MediaQuery.of(context).size.height * 1,
        child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(shoppingLists.length, (index) {
                ShoppingList shoppingList = shoppingLists[index];

                return GestureDetector(
                  onTap: () {
                    print("Se presionó el ítem: ${shoppingList.title}");
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
                              image: AssetImage(shoppingList.imagePath),
                              fit: BoxFit.contain,
                            ), // Bordes redondeados
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.47,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  shoppingList.title,
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
                                child: Text(
                                  '${shoppingList.restaurant}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.037,
                                    fontFamily: 'Quicksand-Bold',
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.height *
                                          0.01,
                                    ),
                                    child: Text(
                                      '\$${shoppingList.price}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.037,
                                        fontFamily: 'Quicksand',
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      child: Image.asset(
                                        'assets/images/icon_shopping_box.png',
                                        fit: BoxFit.contain,
                                      )),
                                  Container(
                                    child: Text(
                                      'x${shoppingList.cout}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.037,
                                        fontFamily: 'Quicksand',
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
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ));
  }

  payBotton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () async =>
                    false, // Evita que el diálogo se cierre con gestos o teclas de retorno.
                child: Dialog(
                  child: Container(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              const Color.fromARGB(255, 255, 94, 0)),
                        ),
                        SizedBox(height: 20),
                        Text("Processing payment..."),
                      ],
                    ),
                  ),
                ),
              );
            },
          );

          Future.delayed(Duration(seconds: 2), () {
            // Aquí cerramos específicamente el Dialog del progreso
            Navigator.of(context, rootNavigator: true).pop('dialog');
            Navigator.of(context).pop();
            // Ahora mostramos el diálogo de éxito
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    "Enjoy your order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontFamily: 'Quicksand-Bold',
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  content: Lottie.asset('assets/animations/success.json',
                      repeat: false,
                      frameRate: FrameRate.max,
                      controller: successAnimationController,
                      fit: BoxFit.fill, onLoaded: (composition) {
                    successAnimationController.forward();
                  }),
                  //Lottie.asset('assets/animations/success.json'),
                );
              },
            );
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 255, 94, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23.0),
          ),
        ),
        child: Text(
          'Pay Now',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.045,
            fontFamily: 'Quicksand-Bold',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
