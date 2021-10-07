import 'address.dart';
import 'name.dart';

class User {
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? iV;

  User(
      {this.address,
        this.id,
        this.email,
        this.username,
        this.password,
        this.name,
        this.phone,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    id = json['id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    phone = json['phone'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['phone'] = this.phone;
    data['__v'] = this.iV;
    return data;
  }
}
