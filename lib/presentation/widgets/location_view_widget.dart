import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/locations_model.dart';
import 'package:rick_and_morty/presentation/theme/app_colors.dart';

class LocationViewWidget extends StatelessWidget {
  const LocationViewWidget({
    super.key,
    required this.locations,
    required this.onTap});

  final Locations locations;
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
                  locations.type ?? '',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.textColor,
                    letterSpacing: 1.5,
                    height: 1.37,
                  ),
                ),
                
                Text(
                  locations.name ?? '',
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