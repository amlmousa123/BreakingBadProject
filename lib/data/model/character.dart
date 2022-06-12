class Character {
  late int id ;
  late String name;
  late String nickname ;
  late String statusIfDeadOrAlive ;
  late String image;
  late List<dynamic> occupation;
  late List<dynamic> appearance ;
  late String actorName;
  late String categoryForTwoSeries;
  late List<dynamic> betterCallSaulAppearance;

  Character.fromJson(Map<String,dynamic>json){
    id =json["char_id"];
    name =json["name"];
    nickname =json["nickname"];
    statusIfDeadOrAlive =json["status"];
    image =json["img"];
    appearance =json["appearance"];
    actorName =json["portrayed"];
    categoryForTwoSeries =json["category"];
    betterCallSaulAppearance =json["better_call_saul_appearance"];
  }

}