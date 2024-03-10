import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/repositories/chars_repo.dart';
import 'package:rick_and_morty/data/repositories/dio_settings.dart';
import 'package:rick_and_morty/data/repositories/episode_repo.dart';
import 'package:rick_and_morty/data/repositories/location_repo.dart';
import 'package:rick_and_morty/presentation/blocs/chars_bloc/chars_bloc.dart';
import 'package:rick_and_morty/presentation/blocs/episode/bloc/episode_bloc.dart';
import 'package:rick_and_morty/presentation/blocs/locations_bloc/locations_bloc.dart';
import 'package:rick_and_morty/presentation/screens/splash_screen.dart';
import 'package:rick_and_morty/presentation/screens/theme_provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Builder(builder: (context) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => DioSettings(),
            ),
            RepositoryProvider(
              create: (context) => CharsRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
            ),
            RepositoryProvider(
              create: (context) => LocationRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
            ),
            RepositoryProvider(
              create: (context) => EpisodeRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CharsBloc(repository: RepositoryProvider.of<CharsRepo>(context)),
              ),
              BlocProvider(
                create: (context) => LocationsBloc(repository: RepositoryProvider.of<LocationRepo>(context),),),
              BlocProvider(
                create: (context) => EpisodeBloc(repository: RepositoryProvider.of<EpisodeRepo>(context)))
            ],
            child: MaterialApp(
              theme: context.watch<ThemeProvider>().theme,
              debugShowCheckedModeBanner: false,
              home: const SplashScreen()
            ),
          ),
        );
      }),
    );
  }
}
