
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:schbang_chat_app/views/chatrooms.dart';

import 'helper/authenticate.dart';
import 'helper/helperfunctions.dart';

Future<void> main() async {
  // Initialize Firebase before runApp
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAb3wGjMm6tHE9KIlkWC9ZnNHRpzsq__fY",
        appId: "1:1083345121212:android:44801a15108d7a80ab85b9",
        messagingSenderId: "1083345121212",
        projectId: "schbangchatapp-8e15f")
  );



 /* String? token = await HelperFunctions.getUserFcmTokenPreference();
  print("FCMTOKEN $token");
  if(token!.isEmpty){
    String? newToken = await FirebaseMessaging.instance.getToken();
    HelperFunctions.saveUserFcmTokenPreference(newToken!);
    print("FCMTOKEN $newToken");
  }*/


  FirebaseMessaging.onMessage.listen((event) {
    print("A new FCM message arrived!");
    print("TITLE ${event.notification!.title}");
    print("BODY ${event.notification!.body}");

  });



  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late bool userIsLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff145C9E),
        scaffoldBackgroundColor: const Color(0xff1F1F1F),
        hintColor: const Color(0xff007EF4),
        fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: userIsLoggedIn != null ?  userIsLoggedIn ? ChatRoom() : Authenticate()
          : Center(
            child: Authenticate(),
          ),
    );
  }
}
