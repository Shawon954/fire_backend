import 'package:after_layout/after_layout.dart';
import 'package:fire_backend/singin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/widgets.dart';


// vaiya amar code run kore code kono problem nai . but run dewar somoy red color er likha golo ase.okk

//20-25 min lagbe..ok vaiyaar ..pore run diye ki hoy dekhen.. ok vaiya ..apatoto tahole kete disisok
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {

    super.initState();

    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((massege) {
      if(massege.notification! == null){
        print(massege.notification!.title);
        print(massege.notification!.body);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((massege) {
      if(massege.notification! == null){

        print(massege.notification!.title);
        print(massege.notification!.body);
      }

    });

    FirebaseMessaging.instance.getInitialMessage().then((massege){
      if(massege == null){
        print(massege!.notification!.title);
        print(massege.notification!.body);

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SingIn(),
    );
  }

}
