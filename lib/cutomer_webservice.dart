
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sale_mobile_application/customer_model.dart';
import 'package:sale_mobile_application/homeScreen.dart';
import 'package:sale_mobile_application/loginScreen.dart';


Future registration(BuildContext context,username,full_name,email,phone,password) async {
  
  final data={
      'username':username,
      'full_name':full_name,
      'email':email,
      'phone':phone,
      'password':password
    };

  final response= await http.post(
    Uri.parse('http://192.168.43.155:9000/signup'),
    body: jsonEncode(data),
     headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
  
    print('Registration  successfully');

    ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Registeration Successfull"),backgroundColor: Colors.green,)
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return loginScreen();},));
        } 
         else {
                ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Email or Username Already Used"),backgroundColor: Colors.red,)
                          );

    print('Failed to post data: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
  final responseBody = jsonDecode(response.body);
  print("response body: ${responseBody['error']}");
 
}

Future<void> login(BuildContext context, String username, String password) async {
  final data = {
    'username': username,
    'password': password,
  };

  final response = await http.post(
    Uri.parse('http://192.168.43.155:9000/signin'), // Correct endpoint for sign-in
    body: jsonEncode(data),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    print('Login successfully');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Login Successful"), backgroundColor: Colors.green),
    );

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen();
    }));
  } else if (response.statusCode == 401) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Incorrect username or password"), backgroundColor: Colors.red),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Failed to log in"), backgroundColor: Colors.red),
    );

    print('Failed to post data: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}






Future fetchCustomers() async{

final response=await http.get(Uri.parse('http://192.168.43.155:9000/customers'));
print("response:$response");
if(response.statusCode==200){
  final List<dynamic> data=json.decode(response.body);
  print("list_data:$data");
  final List<Customers> customers=data.map((item) =>
   Customers.fromJson(item)).toList();
   print("customer instance$customers");
   return customers;
} else {
    throw Exception('Failed to load customers');
  }
}

Future insertCustomers(name,address,phone,email,country) async {
  final data={
      'name':name,
      'address':address,
      'phone_number':phone,
      'email':email,
      'country':country
    };

  final response= await http.post(
    Uri.parse('http://192.168.43.155:9000/customers'),
    body: jsonEncode(data),
     headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
   
    print('Data posted successfully');
  } else {

    print('Failed to post data: ${response.statusCode}');
    
  }

}


  Future updateCustomer(name,address,phone,email,country,id)async{
    final data={
        'name':name,
      'address':address,
      'phone_number':phone,
      'email':email,
      'country':country,
      'id':id
    };
    final response= await http.patch(
      Uri.parse('http://192.168.43.155:9000/customers'),
      headers: {'Content-Type': 'application/json'},
      body:jsonEncode(data)
    
    );

    if (response.statusCode == 200) {
   
    print('Data updated successfully');
  } else {

    print('Failed to updated data: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
  }

  Future deleteCustomers(id) async{
 
 final response=await http.delete(Uri.parse('http://192.168.43.155:9000/customers/$id'),);
 if (response.statusCode == 200) {
   
    print('Data Deleted successfully');
  } else {

    print('Failed to Deleted data: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
    
}