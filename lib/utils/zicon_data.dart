class ZIconData {
  String icon;
  String name;
  String router;
  ZIconData({this.icon, this.name, this.router});

  ZIconData.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    name = json['name'];
    router = json['router'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['name'] = this.name;
    data['router'] = this.router;
    return data;
  }
}
