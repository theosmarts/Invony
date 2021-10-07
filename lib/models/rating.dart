class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'] == null ? 0.0 : json['rate'].toDouble();
    count = json['count'];
  }
}