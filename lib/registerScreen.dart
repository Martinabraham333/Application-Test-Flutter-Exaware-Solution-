import 'package:flutter/material.dart';
import 'package:sale_mobile_application/cutomer_webservice.dart';
import 'package:sale_mobile_application/loginScreen.dart';
import 'package:validators/validators.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registerScreen> {
  TextEditingController FullnameFilter = TextEditingController();
  TextEditingController usernameFilter = TextEditingController();
  TextEditingController emailFilter = TextEditingController();
  TextEditingController passwordFilter = TextEditingController();
  TextEditingController passwordFilter_1 = TextEditingController();
  TextEditingController PhoneFilter = TextEditingController();
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
                      Text("SignUp",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: FullnameFilter,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Full Name',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromARGB(255, 36, 35, 35),
                        ),
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Full Name is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
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
                        controller: emailFilter,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Email',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromARGB(255, 36, 35, 35),
                        ),
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is required';
                          }
                          else if(!isEmail(value)){
                            return 'Email should be valid';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),

                       TextFormField(
                        controller: PhoneFilter,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Phone Number',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromARGB(255, 36, 35, 35),
                        ),
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Phone Number is required';
                          }
                          else if(value.length!=10){
                            return 'Phone Number should be 10 digit';
                          }
                          else if (!isInt(value)) {
                            return 'Phone Number should be a valid integer';
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

                       TextFormField(
                        controller: passwordFilter_1,
                        decoration: const InputDecoration(
                          hintText: 'Confirm Your Password',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromARGB(255, 36, 35, 35),
                        ),
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                        obscureText: true,
                        validator: (value) {
                          print(value == passwordFilter.text);
                          if (value!.isEmpty) {
                            return 'Confirm Your Password';
                          }
                          else if(value != passwordFilter.text){
                            return 'Password did not match';
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

                           registration(context,usernameFilter.text,FullnameFilter.text,emailFilter.text,PhoneFilter.text,passwordFilter.text);
                         
                          
                          
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Registeration Validation Failed"),backgroundColor: Colors.red,)
                          );
                          }

                        }, 
                        style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue
                        ),
                      child: Text("SignUp",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                     SizedBox(height: 20,),
                    
                    ],
                  )), 
               
                
                   TextButton(
                      onPressed: (){
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen(),));
                      }, 
                     child: Text("Already have an account ? Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
              ],
            ),
           )
      )
            
      
      
      
      
    );
  }
}