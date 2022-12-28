import 'package:flutter/material.dart';

import '../../domain/entities/character_entity.dart';

class CardDescriptionWidget extends StatelessWidget {
  const CardDescriptionWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(character.name.toUpperCase(), style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Gender: ${character.gender}', style: Theme.of(context).textTheme.titleMedium),
              Text('Origin: ${character.origin}', style: Theme.of(context).textTheme.titleMedium),
              Text('Species: ${character.species}', style: Theme.of(context).textTheme.titleMedium),
              Text('Location: ${character.location}', style: Theme.of(context).textTheme.titleMedium),
              Text('Status: ${character.status}', style: Theme.of(context).textTheme.titleMedium),
            ],
          )
        ],
      ),
    );
  }
}
