import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/data/models/locations_model.dart';
import 'package:rick_and_morty/presentation/blocs/locations_bloc/locations_bloc.dart';
import 'package:rick_and_morty/presentation/resources/app_pngs.dart';
import 'package:rick_and_morty/presentation/resources/app_svgs.dart';
import 'package:rick_and_morty/presentation/theme/app_colors.dart';
import 'package:rick_and_morty/presentation/widgets/location_view_widget.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<LocationsBloc>(context).add(GetLocations());
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
                BlocProvider.of<LocationsBloc>(context).add(GetLocations(name: val),);
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
                hintText: 'Найти локацию',
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
            BlocBuilder<LocationsBloc, LocationsState>(
              builder: (context, state) {
                if (state is LocationsSuccess) {
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.model.results?.length ?? 0,
                        itemBuilder: (context, index) => LocationViewWidget(
                              onTap: () {
                              },
                              locations: state.model.results?[index] ??
                                  Locations(),
                            )),
                  );
                }

                if (state is LocationsError) {
                  return Center(
                    child: Column(
                      children: [
                        Image.asset(
                          AppPngs.locationNotFound,
                          width: 250,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Локации с таким названием не найдено',
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