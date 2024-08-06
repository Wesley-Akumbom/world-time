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
    data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>? ?? {};
    print(data);

    //set background
    String bgImage = data['isDayTime'] == true ? 'day.png' : 'night.png';
    Color bgcolor = data['isDayTime'] == true? Colors.blue : Colors.indigo[700]!;

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
            )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: (){
                        Navigator.pushNamed(
                          context,
                          '/location'
                        );
                      },
                      label: Text(
                          'Edit Location',
                          style: TextStyle(
                            color: Colors.grey[300]
                          ),
                      ),
                      icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[300],
                      ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          data['location'],
                          style: const TextStyle(
                            fontSize: 28,
                            letterSpacing: 2,
                            color: Colors.white
                          ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: const TextStyle(
                      fontSize: 66,
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
