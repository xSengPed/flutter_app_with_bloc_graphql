class Spaceship {
  int? abs;
  bool? active;
  dynamic attemptedLandings;
  dynamic courseDeg;
  String? homePort;
  String? id;
  String? image;
  int? imo;
  int? mmsi;
  dynamic model;
  String? name;
  List<String>? roles;
  dynamic speedKn;
  String? status;
  dynamic successfulLandings;
  String? type;
  dynamic url;
  dynamic weightKg;
  dynamic weightLbs;
  int? yearBuilt;

  Spaceship(
      {this.abs,
      this.active,
      this.attemptedLandings,
      this.courseDeg,
      this.homePort,
      this.id,
      this.image,
      this.imo,
      this.mmsi,
      this.model,
      this.name,
      this.roles,
      this.speedKn,
      this.status,
      this.successfulLandings,
      this.type,
      this.url,
      this.weightKg,
      this.weightLbs,
      this.yearBuilt});

  Spaceship.fromJson(Map<String, dynamic> json) {
    abs = json['abs'];
    active = json['active'];
    attemptedLandings = json['attempted_landings'];
    courseDeg = json['course_deg'];
    homePort = json['home_port'];
    id = json['id'];
    image = json['image'];
    imo = json['imo'];
    mmsi = json['mmsi'];
    model = json['model'];
    name = json['name'];
    roles = json['roles'].cast<String>();
    speedKn = json['speed_kn'];
    status = json['status'];
    successfulLandings = json['successful_landings'];
    type = json['type'];
    url = json['url'];
    weightKg = json['weight_kg'];
    weightLbs = json['weight_lbs'];
    yearBuilt = json['year_built'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abs'] = this.abs;
    data['active'] = this.active;
    data['attempted_landings'] = this.attemptedLandings;
    data['course_deg'] = this.courseDeg;
    data['home_port'] = this.homePort;
    data['id'] = this.id;
    data['image'] = this.image;
    data['imo'] = this.imo;
    data['mmsi'] = this.mmsi;
    data['model'] = this.model;
    data['name'] = this.name;
    data['roles'] = this.roles;
    data['speed_kn'] = this.speedKn;
    data['status'] = this.status;
    data['successful_landings'] = this.successfulLandings;
    data['type'] = this.type;
    data['url'] = this.url;
    data['weight_kg'] = this.weightKg;
    data['weight_lbs'] = this.weightLbs;
    data['year_built'] = this.yearBuilt;
    return data;
  }
}
