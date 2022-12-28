import 'package:flutter/material.dart';
import 'package:rickmorty/src/features/character/domain/entities/character_entity.dart';
import 'package:rickmorty/src/features/shared/constants/colors.dart';
import 'package:rickmorty/src/features/shared/widgets/appbar_widget.dart';

import '../widgets/card_description_widget.dart';

class CharacterPageDetail extends StatelessWidget {
  final CharacterEntity character;

  const CharacterPageDetail({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppbarCustomWidget(appTitle: character.name),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.transparent, backGroundColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.2, 0.9],
                ).createShader(bounds),
                blendMode: BlendMode.dstOut,
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(child: CardDescriptionWidget(character: character)),
        ],
      ),
    );
  }
}
