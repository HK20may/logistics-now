class LocationValue {
  List<Value>? value;

  LocationValue({this.value});

  LocationValue.fromJson(Map<String, dynamic> json) {
    if (json['value'] != null) {
      value = <Value>[];
      json['value'].forEach((v) {
        value!.add(Value.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (value != null) {
      data['value'] = value!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Value {
  Location? location;
  String? locationName;
  List<double>? coordinates;
  int? sortKey;

  Value({this.location, this.locationName, this.coordinates, this.sortKey});

  Value.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    locationName = json['location_name'];
    coordinates = json['coordinates'].cast<double>();
    sortKey = json['sort_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['location_name'] = locationName;
    data['coordinates'] = coordinates;
    data['sort_key'] = sortKey;
    return data;
  }
}

class Location {
  String? suggestion;
  String? district;
  double? lat;
  String? location;
  double? lon;
  String? state;
  String? label;
  int? score;
  num? pincode;

  Location(
      {this.suggestion,
      this.district,
      this.lat,
      this.location,
      this.lon,
      this.state,
      this.label,
      this.score,
      this.pincode});

  Location.fromJson(Map<String, dynamic> json) {
    suggestion = json['suggestion'];
    district = json['district'];
    lat = json['lat'];
    location = json['location'];
    lon = json['lon'];
    state = json['state'];
    label = json['label'];
    score = json['score'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['suggestion'] = suggestion;
    data['district'] = district;
    data['lat'] = lat;
    data['location'] = location;
    data['lon'] = lon;
    data['state'] = state;
    data['label'] = label;
    data['score'] = score;
    data['pincode'] = pincode;
    return data;
  }
}
