import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/character_model.dart';
import 'package:rick_and_morty/presentation/theme/app_colors.dart';

class CharactersDetailsPage extends StatelessWidget {
  CharactersDetailsPage({super.key, required this.data});

  final RickCharacters data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      data.image ?? '',
                      width: double.infinity,
                      height: 218,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      height: 218,
                      decoration: BoxDecoration(
                          color: const Color(0xff0B1E2D).withOpacity(0.65)),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
                Text(
                  data.name ?? '',
                  style: const TextStyle(
                    fontFamily: 'Roboto-Regular',
                    fontSize: 34,
                    color: Colors.white,
                    letterSpacing: 0.25,
                    height: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  data.status ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.green,
                    letterSpacing: 0.25,
                    height: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  data.created ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    letterSpacing: 0.25,
                    height: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                
              ],
            ),
            Positioned(
              top: 140,
              left: MediaQuery.of(context).size.width / 2 - 73,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: AppColors.darkBgColor,
                child: CircleAvatar(
                  radius: 73,
                  backgroundImage: NetworkImage(data.image ?? ''),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
