

import 'package:fire_backend/homepage.dart';
import 'package:fire_backend/singin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DataHelper{

  Future singUP(email,password,context)async{

    try {
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password,);

      var authCredential = credential.user;
      if(authCredential!.uid.isNotEmpty){

        return Navigator.push(context, MaterialPageRoute(builder: (context)=>SingIn()));
      }else{
        return "sing in failed";
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future singIN(email,password,context)async{

    try {
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password,);

      var authCredential = credential.user;
      if(authCredential!.uid.isNotEmpty){


        return Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }else{
        return "sing in failed";
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signInWithGoogle(context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
        UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

        var authcredintial = userCredential.user;
        if(authcredintial!.uid.isNotEmpty){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        }
        else{
          return "Login Filade";
        }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future  _SingOut(c) async{
    await FirebaseAuth.instance.signOut();

    return SingIn();

  }
}

