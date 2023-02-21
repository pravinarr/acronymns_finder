part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchForItemEvent extends SearchEvent {
  final String? sf;

  SearchForItemEvent({this.sf});
}

class SearchResultsEvent extends SearchEvent {
  final List<AcronymSearch> result;

  SearchResultsEvent({required this.result});
}

class ResetPageEvent extends SearchEvent {}

class SearchErrorEvent extends SearchEvent {
  final String message;

  SearchErrorEvent({required this.message});
}
