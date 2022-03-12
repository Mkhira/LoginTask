







import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logintask/animation/loader.dart';

import '../view/home/home_page.dart';

class GoogleSignService {
  GoogleSignService(){
    Firebase.initializeApp();
  }

  Future<bool> signInWithGoogle(BuildContext context)async{


    GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount?  googleUser = await googleSignIn.signIn();
    Loader.showLoader(context);

    if(googleUser == null) {
      Loader.hideLoader(context);

      return false;
    }

    final GoogleSignInAuthentication googleAuthentication =  await googleUser.authentication;


    final OAuthCredential credential = await GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken:  googleAuthentication.idToken
    );

    UserCredential  userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    if(userCredential != null ){


      // Get user data
    Loader.hideLoader(context);
    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage(token: userCredential.user!.uid)));






    }

    return true;

  }

  void signOut()async{
    await GoogleSignIn().signOut();
  }
}