import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    print('Starting setupWorldTime');
    WorldTime instance = WorldTime(location: 'London', flag: 'germany.png', url:'Europe/London');
    await instance.getTime();
    if (mounted){
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time
      }
    );
  }
    }

  @override
  void initState() {
    super.initState();
    print('Initializing Loading state');
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 90.0
        )
      ),
    );
  }
}
