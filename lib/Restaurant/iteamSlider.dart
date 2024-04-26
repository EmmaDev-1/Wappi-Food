// modal_content.dart
import 'package:flutter/material.dart';
import 'package:project/Restaurant/restaurant.dart';

void showItemDetails(
    BuildContext context, ListRestaurantIteam restaurantIteam) {
  int quantity = 1;
  showModalBottomSheet(
    context: context,
    isScrollControlled:
        true, // Esto permite que el modal sea más alto que la mitad de la pantalla
    builder: (BuildContext context) {
      return StatefulBuilder(
        // Permite actualizar el estado dentro del showModalBottomSheet
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          20), // Radio para la esquina superior izquierda
                      topRight: Radius.circular(
                          20), // Radio para la esquina superior derecha
                    ),
                    image: DecorationImage(
                      image: AssetImage(restaurantIteam.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: SingleChildScrollView(
                    // Asegura que el contenido pueda desplazarse si es necesario
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          restaurantIteam.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontFamily: 'Quicksand-Bold',
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          restaurantIteam.description,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontFamily: 'Quicksand',
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '\$${restaurantIteam.price.toStringAsFixed(2)} Mx',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Quicksand-Bold',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          20), // Radio para la esquina superior izquierda
                      topRight: Radius.circular(
                          20), // Radio para la esquina superior derecha
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 243, 243, 243),
                            borderRadius:
                                BorderRadius.all((Radius.circular(15))),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: quantity > 1
                                    ? () {
                                        setState(() => quantity--);
                                      }
                                    : null,
                              ),
                              Text(
                                '$quantity',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  setState(() => quantity++);
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(
                                  context); // Cierra el showModalBottomSheet
                              showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // Evita que el diálogo se cierre al tocar fuera
                                builder: (BuildContext context) {
                                  // Cierra el showDialog automáticamente después de 3 segundos
                                  Future.delayed(Duration(milliseconds: 500),
                                      () {
                                    Navigator.of(context).pop(true);
                                  });
                                  return AlertDialog(
                                    backgroundColor:
                                        Color.fromARGB(240, 238, 238, 238),
                                    title: Text(
                                      "Iteam Added",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontFamily: 'Quicksand-Bold',
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            15.0) // Reducido para menos curvatura
                                        ),
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 255, 94, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontFamily: 'Quicksand-Bold',
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                ),
                                Text(
                                  '\$${(restaurantIteam.price * quantity).toStringAsFixed(2)} Mx',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045,
                                    fontFamily: 'Quicksand-Bold',
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
