part of 'locations_bloc.dart';

@immutable
sealed class LocationsState {}

final class LocationsInitial extends LocationsState {}

final class LocationsError extends LocationsState {}

final class LocationsLoading extends LocationsState {}

final class LocationsSuccess extends LocationsState {
  final LocationsModel model;
  LocationsSuccess({required this.model});
}

