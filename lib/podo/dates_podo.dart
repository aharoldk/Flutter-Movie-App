class DatesP {
  String  maximum;
  String minimum;

  DatesP({
    this.maximum,
    this.minimum,
  });

  factory DatesP.fromJson(Map<String, dynamic> parsedJson) {
    return DatesP(
      maximum: parsedJson['maximum'],
      minimum: parsedJson['minimum'],
    );
  }
}