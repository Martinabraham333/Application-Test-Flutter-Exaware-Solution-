import 'package:flutter/material.dart';
import 'package:sale_mobile_application/cutomer_webservice.dart';
import 'package:sale_mobile_application/homeScreen.dart';
import 'package:validators/validators.dart';

class AddCutomers extends StatefulWidget {
  const AddCutomers({super.key});

  @override
  State<AddCutomers> createState() => _AddCutomersState();
}

class _AddCutomersState extends State<AddCutomers> {
  TextEditingController nameFilter=TextEditingController();
  TextEditingController addressFilter=TextEditingController();
  TextEditingController phone_numberFilter=TextEditingController();
  TextEditingController emailFilter=TextEditingController();
  TextEditingController countryFilter=TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     backgroundColor: Colors.white,
     appBar: AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
     ),
     body: Center(
        child:SingleChildScrollView(
            child: Container(
              
            width: 300,
          child:  Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                Form(
                  key: _formKey,
                  child: Column(
                    
                    children: [
                      Text("Add Customers",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: nameFilter,
                        decoration:  InputDecoration(
                          hintText: 'Full Name',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromARGB(255, 73, 60, 210),
                          border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30.0)
                          ),
                        ),
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Customer Name is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                       TextFormField(
                        controller: addressFilter,
                        decoration:  InputDecoration(
                          hintText: 'Address',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromARGB(255, 73, 60, 210),
                          border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30.0)
                          ),
                        ),
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Address is required';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10,),

                      TextFormField(
                        controller: phone_numberFilter,
                        decoration:  InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor:Color.fromARGB(255, 73, 60, 210),
                          border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30.0)
                          ),
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
                        controller: emailFilter,
                        decoration:  InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromARGB(255, 73, 60, 210),
                          border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30.0)
                          ),
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
                        controller: countryFilter,
                        decoration:  InputDecoration(
                          hintText: 'Country',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromARGB(255, 73, 60, 210),
                          border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30.0)
                          ),
                          
                        ),
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                        
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Country is required';
                          }
                          
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),

                      
                      Container(
                        width: 300,
                   child:   ElevatedButton(
                        
                        onPressed: (){
                          var a=_formKey.currentState!.validate();
                          print("aaaa:$a");

                          if (_formKey.currentState!.validate()){
                            insertCustomers(nameFilter.text,addressFilter.text,phone_numberFilter.text,emailFilter.text,countryFilter.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Customer added Successfully"),backgroundColor: Colors.green,)
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          },));
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Procees Failed"),backgroundColor: Colors.red,)
                          );
                          }

                        }, 
                        style:ElevatedButton.styleFrom(
                          
                          backgroundColor: Colors.blue
                        ),
                      child: Text("Insert",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),),
                     SizedBox(height: 20,),
                    
                    ],
                  )), 
               
                ],
            ),
            )
           )
      )
     );
   

  }
}