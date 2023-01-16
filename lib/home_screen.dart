import 'package:flutter/material.dart';
import 'package:my_google_map_app/screens/current_location_screen.dart';
import 'package:my_google_map_app/screens/simple_map_screen.dart';
//import 'package:my_google_map_app/screens/track_path_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map App'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
               return const SimpleMapScreen();
              }));
            }, child: const Text('Simple Map') ),


            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const CurrentLocationScreen();
              }));
            }, child: const Text('User Current Location') ),


            // ElevatedButton(onPressed: (){
            //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            //     return const TrackPathScreen();
            //   }));
            // }, child: const Text('Track Travel Path') )


          ],
        ),
      ),
    );
  }
}
