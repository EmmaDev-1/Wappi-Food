// modal_content.dart
import 'package:flutter/material.dart';
import 'package:project/Models/listRestaurants.dart';
import 'package:project/Order/mainOrders.dart';

class ListOrderDetails {
  final String imagePath;
  final String title;
  final int iteamCount;
  ListOrderDetails({
    required this.imagePath,
    required this.title,
    required this.iteamCount,
  });
}

List<ListOrderDetails> orderDetails = [
  ListOrderDetails(
      imagePath: 'assets/images/menu_iteam_2.webp',
      title: 'Hand-Breaded Chiken Sandwich',
      iteamCount: 1),
  ListOrderDetails(
      imagePath: 'assets/images/menu_iteam_3.webp',
      title: 'Double Wester Bacon CheeseBurger®',
      iteamCount: 1),
  ListOrderDetails(
      imagePath: 'assets/images/menu_iteam_4.webp',
      title: '6 Piece - Chicken Stars™',
      iteamCount: 1),
  ListOrderDetails(
      imagePath: 'assets/images/menu_iteam_5.webp',
      title: 'Natural-Cut French Fries',
      iteamCount: 1),
  ListOrderDetails(
      imagePath: 'assets/images/menu_iteam_6.webp',
      title: 'El Diablo Loaded Fries™',
      iteamCount: 1),
  ListOrderDetails(
      imagePath: 'assets/images/menu_iteam_7.webp',
      title: 'Hand-Scooped Ice-Cream Oreo Shake™',
      iteamCount: 1),
  ListOrderDetails(
      imagePath: 'assets/images/menu_iteam_8.webp',
      title: 'Hand-Scooped Ice-Cream Strawberry Shake™',
      iteamCount: 1),
  ListOrderDetails(
      imagePath: 'assets/images/menu_iteam_9.webp',
      title: 'Chocolate Chip Cookie',
      iteamCount: 1),
];

late final ListRestaurant restaurant;

void showOrderDetails(
    BuildContext context, ListOrdersRestaurant orderRestaurant) {
  String deliveryCostString = orderRestaurant.deliveryCost;
  String deliveryFeeString = orderRestaurant.restaurant.deliveryCost;
  int deliveryCost = int.parse(deliveryCostString);
  int deliveryFee = int.parse(deliveryFeeString);
  int subTotal = deliveryCost - deliveryFee;

  showModalBottomSheet(
    context: context,
    isScrollControlled:
        true, // Esto permite que el modal sea más alto que la mitad de la pantalla
    builder: (BuildContext context) {
      return StatefulBuilder(
        // Permite actualizar el estado dentro del showModalBottomSheet
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.015,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        fontFamily: 'QuickSand-Bold',
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    )),
                Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.015,
                    ),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Order Summary',
                      style: TextStyle(
                        fontFamily: 'QuickSand-Bold',
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.015,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          children:
                              List.generate(orderRestaurant.iteam, (index) {
                        var orderDetail = orderDetails[index];
                        return Column(
                          children: [
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.085,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.007,
                                top: MediaQuery.of(context).size.height * 0.012,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.078,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                        image:
                                            AssetImage(orderDetail.imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.height *
                                          0.015,
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.65,
                                          child: Text(
                                            orderDetail.title,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'QuickSand-Bold',
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                              color: const Color.fromARGB(
                                                  255, 0, 0, 0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.65,
                                          child: Text(
                                            '${orderDetail.iteamCount} iteam',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'QuickSand',
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              color: const Color.fromARGB(
                                                  255, 100, 100, 100),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 1.5,
                              width: MediaQuery.of(context).size.height,
                              color: const Color.fromARGB(255, 221, 221, 221),
                              margin: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.height * 0.095,
                                right:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                            ),
                          ],
                        );
                      })),
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                  width: MediaQuery.of(context).size.width,
                  color: const Color.fromARGB(255, 221, 221, 221),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.9,
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.008,
                          bottom: MediaQuery.of(context).size.height * 0.015,
                        ),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(153, 138, 253, 173),
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: Text(
                          'Your order has been successfully deliver on\n ${orderRestaurant.time}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'QuickSand',
                            fontSize: MediaQuery.of(context).size.width * 0.038,
                            color: const Color.fromARGB(172, 40, 126, 66),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.015,
                          right: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SubTotal',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'QuickSand',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                Text(
                                  '\$$subTotal Mx',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'QuickSand',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delivery Fee',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'QuickSand',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                Text(
                                  '\$$deliveryFee Mx',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'QuickSand',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 1.5,
                              width: MediaQuery.of(context).size.height,
                              color: const Color.fromARGB(255, 221, 221, 221),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'QuickSand-Bold',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                Text(
                                  '\$${orderRestaurant.deliveryCost}Mx',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'QuickSand-Bold',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
