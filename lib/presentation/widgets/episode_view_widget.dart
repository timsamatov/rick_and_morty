import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/episode_model.dart';
import 'package:rick_and_morty/presentation/theme/app_colors.dart';

class EpisodeViewWidget extends StatelessWidget {
  const EpisodeViewWidget({
    super.key,
    required this.episodes,
    required this.onTap});

  final Episodes episodes;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  episodes.episode ?? '',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.blue,
                    letterSpacing: 1.5,
                    height: 1.37,
                  ),
                ),
                
                Text(
                  episodes.name ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}