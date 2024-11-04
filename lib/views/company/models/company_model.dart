class Company {
  String? ceo;
  String? coo;
  String? cto;
  String? ctoPropulsion;
  int? employees;
  int? founded;
  String? founder;
  int? launchSites;
  String? name;
  String? summary;
  int? testSites;
  int? valuation;
  int? vehicles;

  Company(
      {this.ceo,
      this.coo,
      this.cto,
      this.ctoPropulsion,
      this.employees,
      this.founded,
      this.founder,
      this.launchSites,
      this.name,
      this.summary,
      this.testSites,
      this.valuation,
      this.vehicles});

  Company.fromJson(Map<String, dynamic> json) {
    ceo = json['ceo'];
    coo = json['coo'];
    cto = json['cto'];
    ctoPropulsion = json['cto_propulsion'];
    employees = json['employees'];
    founded = json['founded'];
    founder = json['founder'];
    launchSites = json['launch_sites'];
    name = json['name'];
    summary = json['summary'];
    testSites = json['test_sites'];
    valuation = json['valuation'];
    vehicles = json['vehicles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ceo'] = this.ceo;
    data['coo'] = this.coo;
    data['cto'] = this.cto;
    data['cto_propulsion'] = this.ctoPropulsion;
    data['employees'] = this.employees;
    data['founded'] = this.founded;
    data['founder'] = this.founder;
    data['launch_sites'] = this.launchSites;
    data['name'] = this.name;
    data['summary'] = this.summary;
    data['test_sites'] = this.testSites;
    data['valuation'] = this.valuation;
    data['vehicles'] = this.vehicles;
    return data;
  }
}
