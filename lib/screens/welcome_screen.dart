import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/body_welcome.dart';
import '../provider/user_provider.dart';
// import '../components/body_welcome.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool imageLoaded=false;
  @override
  Widget build(BuildContext context) {
    FirebaseStorage storage = FirebaseStorage.instance;
    void getLogoUrl() async {
      var snapshot =storage.ref().child('images/logo');
      var imageUrl = await (snapshot).getDownloadURL();
      // print(imageUrl.toString());
      Provider.of<UserProvider>(context,listen:false).logoUrl= imageUrl.toString();
      // print(Provider.of<UserProvider>(context,listen:false).logoUrl);
      if (Provider.of<UserProvider>(context,listen:false).logoUrl!="")
        setState(() {
          imageLoaded=true;
        
        });
    }
    if (!imageLoaded)
      getLogoUrl();
    
    return Scaffold(
      body: imageLoaded?Body():Container(
        child:Center(child: CircularProgressIndicator())
      ),
    );
  }
}