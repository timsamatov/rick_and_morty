import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/presentation/resources/app_svgs.dart';
import 'package:rick_and_morty/presentation/screens/characters_page.dart';
import 'package:rick_and_morty/presentation/screens/episode_page.dart';
import 'package:rick_and_morty/presentation/screens/location_page.dart';
import 'package:rick_and_morty/presentation/screens/settings_page.dart';
import 'package:rick_and_morty/presentation/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;
  List<Widget> screens = [
    CharactersPage(),
    LocationPage(),
    EpisodePage(),
    SettingsPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.darkBgColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.green,
        currentIndex: currentIndex,
        onTap: (val){
          currentIndex = val;
          setState(() {
            
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.charsSvg,
            colorFilter: ColorFilter.mode(AppColors.textColor, BlendMode.srcIn),),
            label: 'Персонажи'
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.locationSvg),
            label: 'Локации',
            
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.episodeSvg),
            label: 'Эпизоды'
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.settingsSvg),
            label: 'Настройки'
          ),
          
        ],
      ),
    );
  }
}
