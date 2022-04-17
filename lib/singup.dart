
import 'package:fire_backend/Database/database.dart';
import 'package:fire_backend/singin.dart';
import 'package:flutter/material.dart';
class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {

  final email= TextEditingController();
  final pass = TextEditingController();

  final _formkey = GlobalKey <FormState> ();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SingUp Page"),
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
                controller: pass,
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius:BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                validator: (val){
                  if(val!.length==6){
                    return "Enter Password mini 6 ";
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
                final inputpass = pass.text;

                var input = DataHelper();
                input.singUP(inputemail, inputpass, context);
              },
                child: Text("Sing Up"),
              ),

              SizedBox(height: 10,),


              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SingIn()));
              },
                child: Text("already create account.Sing In"),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
