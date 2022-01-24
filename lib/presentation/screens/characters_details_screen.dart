import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bussiness_logic/cubit/characters_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.GREY,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickName,
          style: const TextStyle(color: MyColors.WHITE),
          // textAlign: TextAlign.center,
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(character.img, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: const TextStyle(
            color: MyColors.WHITE,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextSpan(
          text: value,
          style: const TextStyle(
            color: MyColors.WHITE,
            fontSize: 16,
          ),
        ),
      ]),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      thickness: 2,
      color: MyColors.YELLOW,
    );
  }

  Widget checkIfQuotesAreLoaded(CharactersState state){
    if(state is QuotesLoaded) {
      return displayRandomQuoteOrEmptyspace(state);
    }else {
      return showProgressIndicator(); 
    }
  }

  Widget displayRandomQuoteOrEmptyspace(state){
    var quotes = (state).quote;
    if(quotes.length != 0){
      int randomQuoteIndex = Random().nextInt(quotes.length - 1 );
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: MyColors.YELLOW,
            shadows: [
              Shadow(
                blurRadius: 7,
                color: MyColors.YELLOW,
                offset: Offset(0, 0),
              ),
            ]
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(quotes[randomQuoteIndex].quote),
            ],
          ),
        ),
      );
    }else {
      return Container();
    }
  }

  Widget showProgressIndicator(){
    return const Center(
      child: CircularProgressIndicator(color: MyColors.YELLOW),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // Here you should call the cubit, the cubit was lozy, we're should call it to can use it. 
    BlocProvider.of<CharactersCubit>(context).getQuotes(character.name);
    return Scaffold(
      backgroundColor: MyColors.GREY,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Job : ', character.jobs.join(' / ')),
                      buildDivider(330),
                      characterInfo('Appeared In : ', character.category),
                      buildDivider(270),
                      character.appearanceOfSeasons.isEmpty
                          ? Container()
                          : characterInfo('Seasons : ',
                              character.appearanceOfSeasons.join(' / ')),
                      character.appearanceOfSeasons.isEmpty
                          ? Container()
                          : buildDivider(295),
                      characterInfo('Status : ', character.status),
                      buildDivider(315),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : characterInfo('Better Call Saul Seasons : ',
                              character.betterCallSaulAppearance.join(' / ')),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : buildDivider(165),
                      characterInfo('Actor/Actress : ', character.actorName),
                      buildDivider(247),
                      const SizedBox(height: 20),

                      BlocBuilder<CharactersCubit, CharactersState>(builder: (context, state){
                        return checkIfQuotesAreLoaded(state);
                      })
                    ],
                  ),
                ),
                const SizedBox(height: 500),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
