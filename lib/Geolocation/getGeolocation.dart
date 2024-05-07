import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<String> getLocation(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  // Comprueba si el servicio de ubicación está habilitado
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return 'Location services are disabled.';
  }

  // Comprueba los permisos de ubicación
  permission = await Geolocator.checkPermission();

  // Si el permiso es denegado, muestra un diálogo y vuelve a solicitar
  if (permission == LocationPermission.denied) {
    await _showPermissionDialog(context,
        'Location permissions are denied. Please allow location access to continue.');

    // Vuelve a solicitar el permiso después de que el usuario cierre el diálogo
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return 'Location permissions are denied';
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return 'Location permissions are permanently denied, we cannot request permissions.';
  }

  // Si el permiso es concedido, obtén la ubicación
  Position position = await Geolocator.getCurrentPosition();

  // Obtén información detallada a partir de las coordenadas
  List<Placemark> placemarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );

  Placemark placemark = placemarks.first;

  return '${placemark.locality}, ${placemark.administrativeArea}';
}

Future<void> _showPermissionDialog(BuildContext context, String message) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Permission Needed'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
