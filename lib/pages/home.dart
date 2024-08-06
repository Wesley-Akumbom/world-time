import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = (ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>?)!;
    print(data);

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(
                      context,
                      '/location'
                    );
                  },
                  label: const Text('Edit Location'),
                  icon: const Icon(Icons.edit_location),
              )
            ],
          )
      ),
    );
  }
}
