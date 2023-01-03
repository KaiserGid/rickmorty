import 'package:flutter/material.dart';
import 'package:rickmorty/src/features/shared/constants/colors.dart';

import '../../domain/entities/character_entity.dart';

class CardItemWidget extends StatelessWidget {
  final CharacterEntity character;

  const CardItemWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: backGroundColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    'assets/images/portal_two.gif',
                  ),

                  // radius: 50,
                ),
                Positioned(
                  top: 17.5,
                  left: 17.5,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    radius: 45,
                    backgroundImage: NetworkImage(
                      character.image,
                    ),

                    // radius: 50,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  character.name,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
