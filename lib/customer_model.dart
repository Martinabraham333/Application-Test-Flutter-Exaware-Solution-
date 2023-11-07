

class Customers{
  final String id;
  final String name;
  final String address;
  final String phone_number;
  final String email;
  final String country;

  Customers({
    required this.id,
    required this.name,
    required this.address,
    required this.phone_number,
    required this.email,
    required this.country,
   
  });

  factory Customers.fromJson(Map<String,dynamic> json){

    return Customers(
      id: json['id'].toString(),
      name: json['name'],
      address:json['address'] ,
      phone_number:json['phone_number'] ,
      email:json['email'] ,
      country:json['country'] ,
      );
  }
}