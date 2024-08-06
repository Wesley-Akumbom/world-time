import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    print('Starting setupWorldTime');
    WorldTime instance = WorldTime(location: 'London', flag: 'germany.png', url:'Europe/London');
    await instance.getTime();
    print('Time received: ${instance.time}');
    setState(() {
      time = instance.time;
    });
    print('State updated with time: $time');
  }

  @override
  void initState() {
    super.initState();
    print('Initializing Loading state');
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    print('Building Loading widget with time: $time');
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Text(time),
        )
    );
  }
}
