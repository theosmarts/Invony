class Geolocation {
  String? lat;
  String? long;

  Geolocation({required this.lat, required this.long});

  Geolocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}