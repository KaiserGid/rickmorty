import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickmorty/src/app_module.dart';
import 'package:rickmorty/src/core/features/characteres/models/character_entity.dart';
import 'package:rickmorty/src/core/shared/constants/colors.dart';
import 'package:rickmorty/src/core/shared/widgets/appbar_widget.dart';
import 'package:rickmorty/src/core/shared/widgets/logo_progress_indicator_widget.dart';
import 'package:rickmorty/src/features/character/presenter/controllers/character_page_controller.dart';
import 'package:rickmorty/src/features/character/presenter/pages/character_page_detail.dart';
import 'package:rickmorty/src/features/character/presenter/store/character_store.dart';
import 'package:rickmorty/src/features/character/states/character_states.dart';

import '../widgets/card_item_widget.dart';

class CharacterPage extends StatefulWidget {
  final CharacterStore characterController;

  const CharacterPage({
    Key? key,
    required this.characterController,
  }) : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  CharacterStore get controller => widget.characterController;
  final CharacterPageController characterPageController = CharacterPageController();
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    getIt<CharacterStore>().addListener(() {});
    characterPageController.init();
    _scrollController = ScrollController();
    _scrollController.addListener(infinitScroll);
  }

  infinitScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      controller.getCaracteres();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppbarCustomWidget(appTitle: 'Characteres'),
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: backGroundColor,
        body: Stack(
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                var value = controller.state;
                if (value is LoadingCharacterState) {
                  return const LogoProgressIndicator();
                } else if (value is IdleCharacterState) {
                  return ListView.builder(
                      controller: _scrollController,
                      itemCount: controller.characteres.length,
                      itemBuilder: (context, index) {
                        Character character = controller.characteres[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => CharacterPageDetail(character: character),
                              )),
                          child: CardItemWidget(character: character),
                        );
                      });
                } else {
                  return const Center(child: Text('Houve um erro'));
                }
              },
            ),
          ],
        ));
  }
}
