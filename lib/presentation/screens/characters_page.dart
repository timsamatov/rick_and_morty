import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/data/models/character_model.dart';
import 'package:rick_and_morty/presentation/blocs/chars_bloc/chars_bloc.dart';
import 'package:rick_and_morty/presentation/resources/app_pngs.dart';
import 'package:rick_and_morty/presentation/resources/app_svgs.dart';
import 'package:rick_and_morty/presentation/screens/characters_details_page.dart';
import 'package:rick_and_morty/presentation/theme/app_colors.dart';
import 'package:rick_and_morty/presentation/widgets/list_view_widget.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<CharsBloc>(context).add(GetChars());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (val) {
                BlocProvider.of<CharsBloc>(context).add(GetChars(name: val));
              },
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: SvgPicture.asset(AppSvgs.searchSvg),
                  onPressed: () {},
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(AppSvgs.filterSvg),
                  onPressed: () {},
                ),
                hintText: 'Найти персонажа',
                hintStyle: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                  letterSpacing: 0.44,
                ),
                fillColor: AppColors.tfBgColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.tfBgColor),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              controller: controller,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                const Text(
                  'Всего персонажей: 200',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      height: 1.6,
                      letterSpacing: 1.50),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppSvgs.gridSvg),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            BlocBuilder<CharsBloc, CharsState>(
              builder: (context, state) {
                if (state is CharsSuccess) {
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.model.results?.length ?? 0,
                        itemBuilder: (context, index) => ListViewWidget(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CharactersDetailsPage(
                                      data: state.model.results?[index] ??
                                          RickCharacters(),
                                    ),
                                  ),
                                );
                              },
                              characters: state.model.results?[index] ??
                                  RickCharacters(),
                            )),
                  );
                }

                if (state is CharsError) {
                  return Center(
                    child: Column(
                      children: [
                        Image.asset(
                          AppPngs.charsNotFound,
                          width: 250,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Персонаж с таким именем не найден',
                          style: TextStyle(
                            fontFamily: 'Roboto-Regular',
                            fontSize: 16,
                            color: AppColors.textColor,
                            height: 1.28,
                            letterSpacing: 0.15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
