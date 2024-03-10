import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/data/models/episode_model.dart';
import 'package:rick_and_morty/presentation/blocs/episode/bloc/episode_bloc.dart';
import 'package:rick_and_morty/presentation/resources/app_pngs.dart';
import 'package:rick_and_morty/presentation/resources/app_svgs.dart';
import 'package:rick_and_morty/presentation/widgets/episode_view_widget.dart';

import '../theme/app_colors.dart';

class EpisodePage extends StatefulWidget {
  const EpisodePage({super.key});

  @override
  State<EpisodePage> createState() => _EpisodePageState();

}

class _EpisodePageState extends State<EpisodePage> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
   BlocProvider.of<EpisodeBloc>(context).add(GetEpisodes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (val) {
                BlocProvider.of<EpisodeBloc>(context).add(GetEpisodes(name: val),);
              },
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: SvgPicture.asset(AppSvgs.searchSvg),
                  onPressed: () {},
                ),
                hintText: 'Найти эпизод',
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
              controller: controller,),
             const SizedBox(
              height: 12,
            ),
            BlocBuilder<EpisodeBloc, EpisodeState>(
              builder: (context, state) {
                if (state is EpisodeSuccess) {
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.model.results?.length ?? 0,
                        itemBuilder: (context, index) => EpisodeViewWidget(
                              onTap: () {
                              },
                              episodes: state.model.results?[index] ??
                                  Episodes(),
                            )),
                  );
                }

                if (state is EpisodeError) {
                  return Center(
                    child: Column(
                      children: [
                        Image.asset(
                          AppPngs.episodeNotFound,
                          width: 250,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Эпизода с таким названием нет',
                          style: TextStyle(
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
            ),]
        ),),
    );
  }
}