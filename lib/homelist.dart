import 'package:flutter/material.dart';
import 'package:pro1/geolok.dart';

class HomeListt extends StatelessWidget {
  const HomeListt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Ваша позиция:',
          ),
          FutureBuilder(
            future: getLocation(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(
                        " lat: ${snapshot.data!.lat.toString()}\n long:${snapshot.data!.long.toString()}"),
                    Text(
                        "\n Ваш адрес:\n ${snapshot.data!.adres.toString()}"),
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}