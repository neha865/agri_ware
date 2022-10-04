import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _username = TextEditingController();

  SignUp({super.key});

  Future<void> signup() async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text, password: _password.text,);

    }
    catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        alignment: Alignment.center,
        margin : EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child : TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "Enter username:",
                  hintText: "Username",
                ),
                controller:_username ,
              ),
            ),
            const SizedBox(height: 10,),
            Container(

              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: "Enter Your Email:",
                  hintText: "Your Email",
                ),
                controller: _email,

              ),
            ),
            const SizedBox(height: 10,),
            Container(

              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: "Enter Password:",
                  hintText: "Password",
                ),
                controller: _password,
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 70,
              width: 400,

              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color : Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                child : const Text("Sign Up",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),),
                onPressed: (){
                  signup();
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
