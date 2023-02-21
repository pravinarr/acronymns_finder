part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchingState extends SearchState {}

class SearchResultsState extends SearchState {
  final List<AcronymSearch> result;

  List<LF> get searchResults {
    List<LF> list = [];
    for (AcronymSearch item in result) {
      list.addAll(item.lfs);
    }
    return list;
  }

  SearchResultsState({required this.result});
}

class SearchErrorState extends SearchState {
  final String message;

  SearchErrorState({required this.message});
}
