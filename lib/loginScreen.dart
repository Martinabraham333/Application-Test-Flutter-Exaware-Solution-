import 'package:flutter/material.dart';
import 'package:sale_mobile_application/cutomer_webservice.dart';

import 'package:sale_mobile_application/registerScreen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  
  TextEditingController usernameFilter = TextEditingController();
  
  TextEditingController passwordFilter = TextEditingController();
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:SingleChildScrollView(
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                Form(
                  key: _formKey,
                  child: Column(
                    
                    children: [
                      Text("SignIn",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                       TextFormField(
                        controller: usernameFilter,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Username',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromARGB(255, 36, 35, 35),
                        ),
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username is required';
                          }
                          return null;
                        },
                      ),

                       SizedBox(height: 10,),

                       TextFormField(
                        controller: passwordFilter,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Password',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromARGB(255, 36, 35, 35),
                        ),
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          }
                          else if(value.length<6){
                            return 'Password should contains minimum 6 characters';
                          }
                          return null;
                        },
                      ),
                     
                      SizedBox(height: 10,),
 
                      ElevatedButton(
                        
                        onPressed: (){
                          var a=_formKey.currentState!.validate();
                          print("aaaa:$a");

                          if (_formKey.currentState!.validate()){
                            
                            login(context, usernameFilter.text, passwordFilter.text);
                          
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login Failed"),backgroundColor: Colors.red,)
                          );
                          }

                        }, 
                        style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue
                        ),
                      child: Text("SignIn",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                     SizedBox(height: 20,),
                     TextButton(
                      onPressed: (){
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context) => registerScreen(),));
                      }, 
                     child: Text("If you don't have an account ? SignUp",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                    ],
                  ))
              ],
            ),
           )
      )
            
      
      
      
      
    );
  }
}