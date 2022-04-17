
import 'package:fire_backend/Database/database.dart';
import 'package:fire_backend/singup.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';


class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  State<SingIn> createState() => _SingInState();
}





class _SingInState extends State<SingIn> {

  final email = TextEditingController();
  final password = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar: AppBar(title: Text("SingIn Page"),
               automaticallyImplyLeading: false,
               centerTitle: true,
             ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  labelText: "Email",
                border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius:BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                validator:(val){
                  if(val!.isEmpty){
                    return "Enter Email ";
                  }
                  else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius:BorderRadius.all(Radius.circular(20)),
                    ),
                ),
                validator: (val){
                  if(val!.isEmpty){
                    return "Enter Password";
                  }
                  else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 10,),

              ElevatedButton(onPressed: (){
                if(_formkey.currentState!.validate());
                final inputemail = email.text;
                final inputpass = password.text;

                var input = DataHelper();
                input.singIN(inputemail, inputpass, context);
              },
                child: Text("Login"),
              ),




              SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () {
                  var inputgoogle = DataHelper();
                  inputgoogle.signInWithGoogle(context);
                },
              ),

              SizedBox(height: 10,),

              TextButton(onPressed: (){},
                child: Text("Reset Password"),
              ),

              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SingUp()));

              },
                child: Text("Create an account.Sing Up"),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
