import 'package:breaking_bad_project/constants/colors.dart';
import 'package:breaking_bad_project/data/model/character.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.all(8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: MyColors.myWhite),
      child: GridTile(
        child: Container(
            child: character.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/images/placeHolder.gif',
                    image: character.image,
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Icon(
                      Icons.person_pin_rounded,
                      size: 60,
                    ),
                  )),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            "${character.name}",
            style: TextStyle(
                height: 1.3,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: MyColors.myWhite),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
