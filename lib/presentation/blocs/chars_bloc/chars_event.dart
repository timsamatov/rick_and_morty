part of 'chars_bloc.dart';

@immutable
sealed class CharsEvent {}

class GetChars extends CharsEvent{
  final String? name;
  GetChars({this.name});
}
