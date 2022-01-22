class Character {
  late int charId;
  late String name;
  late String birthday;
  late List<dynamic> jobs;
  late String img;
  late String status;
  late String nickName;
  late List<dynamic> appearanceOfSeasons;
  late String actorName;
  late String category;
  late List<dynamic> betterCallSaulAppearance;

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    jobs = json['occupation'];
    img = json['img'];
    status = json['status'];
    nickName = json['nickname'];
    appearanceOfSeasons = json['appearance'];
    actorName = json['portrayed'];
    category = json['category'];
    betterCallSaulAppearance = json['better_call_saul_appearance'];
  }
}