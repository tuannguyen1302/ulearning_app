class UserEntity {

  UserEntity(
      {this.type,
        this.name,
      this.email,
      this.description,
      this.phone,
      this.avatar,
      this.openId,
      this.online,});
  int? type;
  String? name ;
  String? email;
  String? description;
  String? phone;
  String? avatar;
  String? openId;
  int? online;
  Map<String, dynamic> toJson() => {
        'type': type,
        'name': name,
        'email': email,
        'description': description,
        'phone': phone,
        'avatar': avatar,
        'open_id': openId,
        'online': online,
  };
}
