import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/character_model.dart';
import 'package:rick_and_morty/presentation/theme/app_colors.dart';

class ListViewWidget extends StatelessWidget {
   ListViewWidget({
    super.key,
    required this.characters,
    required this.onTap
  });

  final RickCharacters characters;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(
              radius: 37,
              backgroundImage: NetworkImage(
                characters.image ?? '',
              ),
            ),
            const SizedBox(
              width: 18,
            ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  characters.status ?? '',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.green,
                    letterSpacing: 1.5,
                    height: 1.37,
                  ),
                ),
                
                Text(
                  characters.name ?? '',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${characters.species},${characters.gender}',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.5,
                    letterSpacing: 0.5,
                    color: AppColors.textColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
