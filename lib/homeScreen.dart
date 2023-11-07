
import 'package:flutter/material.dart';
import 'package:sale_mobile_application/add_cutomers.dart';
import 'package:sale_mobile_application/customer_details.dart';
import 'package:sale_mobile_application/cutomer_webservice.dart';
import 'package:sale_mobile_application/loginScreen.dart';
import 'package:sale_mobile_application/update_customer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
         Text(
          "Customers List",
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
        Spacer(),
        GestureDetector(
          
          onTap: (){
          
          Navigator.push(context, MaterialPageRoute(builder: (context) =>loginScreen(),));
          }, child: Icon(Icons.logout),
          
          )
        
          ],
        ),
        
        
        backgroundColor: Colors.white,
      ),
      body: Column(
         crossAxisAlignment:CrossAxisAlignment.start,
        children: [
       Padding(
        padding: EdgeInsets.only(left:12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green
          ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddCutomers(),));
      }, 
      child: Row(
         mainAxisSize: MainAxisSize.min, 
        children: [
          
         Icon(Icons.add,color: const Color.fromARGB(255, 224, 216, 215),size:35,weight:10,),
        Text("Add Customers",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        
        ],
      )
      ), ),
       
     Expanded(child:  
      FutureBuilder(
        future: fetchCustomers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("Waiting...");
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Text('Error: ${snapshot.error}',style: TextStyle(color: Colors.white),);
          } else {
            final List customer = snapshot.data;

            return ListView.builder(
              itemCount: customer.length,
              itemBuilder: (context, index) {
                final customerItem = customer[index];
                return ListTile(
                  title: Container(
                    
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 2,
                      // ),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(7)
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        Row(
                          
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Padding(padding: EdgeInsets.only(left:8),
                                 child: Text(customerItem.name,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),),),
                             Padding(padding: EdgeInsets.only(left:8),
                             child: Text("ID: ${customerItem.id}",style: TextStyle(color: Colors.white),),)
                              ],
                            ),
                            Spacer(), 
                            GestureDetector(
                              onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => updateCustomers(customer_details: customerItem,),));   
                              },
                              child:Icon(Icons.edit,color: Colors.white,size: 25,), 
                            ),
                            
                            SizedBox(width: 20,),
                            GestureDetector(
                              onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerDetails(customer_details: customerItem,),));        
                             },
                              child:Icon(Icons.visibility,color: Colors.white,size: 25,), 
                            ),
                            
                            SizedBox(width: 10,),

                            GestureDetector(
                              onTap: (){
                                deleteCustomers(customerItem.id);
                             Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));     
                              },
                              child: Icon(Icons.delete,color:  const Color.fromARGB(255, 170, 60, 60),size: 25,),
                            )

                          ],
                        )
                        
                        
                      ]
                  ),
                    )
                   
                  
                );
              },
            );
          }
        },

        
      ),)


 ],
      )


    );
  }
}

