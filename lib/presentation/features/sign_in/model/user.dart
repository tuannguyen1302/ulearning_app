class UserLoginReq  {
  UserLoginReq(
      {this.type,
      this.name,
      this.email,
      this.phone,
      this.description,
      this.avatar,
      this.openID,
      this.online,});
  int? type;

  String? name;

  String? email;

  String? phone;

  String? description;

  String? avatar;

  String? openID;

  int? online;
  Map<String, dynamic> toJson() => {
    'type': type,
    'name': name,
    'email': email,
    'phone': phone,
    'description': description,
    'avatar': avatar,
    'openID': openID,
    'online': online,
  };




}
