import 'package:breaking_bad_project/busieness_logic/Cubit/character_cubit.dart';
import 'package:breaking_bad_project/busieness_logic/Cubit/character_states.dart';
import 'package:breaking_bad_project/constants/colors.dart';
import 'package:breaking_bad_project/data/model/character.dart';
import 'package:breaking_bad_project/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedCharacters;
  bool _isSearching = false;
  final _searchedTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: _isSearching
            ? buildSearchField()
            : Text(
                "Characters",
                style: TextStyle(
                    color: MyColors.myGery, fontWeight: FontWeight.bold),
              ),
        actions: _isSearching
            ? [
                IconButton(
                    onPressed: _clearSearch,
                    icon: Icon(
                      Icons.clear,
                      color: MyColors.myGery,
                    ))
              ]
            : [
                IconButton(
                    onPressed: _startSearch,
                    icon: Icon(
                      Icons.search,
                      color: MyColors.myGery,
                    ))
              ],
        leading: _isSearching
            ? BackButton(
                color: MyColors.myGery,
              )
            : Container(),
      ),
      body: buildBlocWidget(),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
      if (state is CharacterLoaded) {
        allCharacters = (state).characters;
        return buildLodedListWidget();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget buildLodedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGery,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            childAspectRatio: 2 / 3),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _searchedTextController.text.isEmpty
            ? allCharacters.length
            : searchedCharacters.length,
        itemBuilder: (ctx, index) {
          return CharacterItem(
            character: _searchedTextController.text.isEmpty
                ? allCharacters[index]
                : searchedCharacters[index],
          );
        });
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myGery,
      ),
    );
  }

  buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'find character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGery, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.myGery, fontSize: 18),
      controller: _searchedTextController,
      onChanged: (searchedCharacter) {
        searchedCharacters = allCharacters
            .where((character) =>
                character.name.toLowerCase().startsWith(searchedCharacter))
            .toList();
        setState(() {});
      },
    );
  }

  void _clearSearch() {
    setState(() {
      _searchedTextController.clear();
    });
    Navigator.of(context).pop;
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }
}
