import 'dart:async';
import 'dart:io';

import 'package:acronyms_finder/models/acronym_serach.dart';
import 'package:acronyms_finder/services/errors/api_error.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/lf.dart';
import '../../../services/search.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchService _searchAcronym = SearchService();

  SearchBloc() : super(SearchInitial()) {
    on<SearchForItemEvent>((event, emit) {
      emit(SearchingState());
      _searchAcronym.searchResults(event.sf).then((value) {
        add(SearchResultsEvent(result: value));
      }).catchError((error, stacktrace) {
        //if cloud logging available we can log errors here
        if (error is TimeoutException) {
          add(SearchErrorEvent(
              message: 'Server taking too long to response. Try again later.'));
        } else if (error is SocketException) {
          add(SearchErrorEvent(message: 'Check your Internet Connection.'));
        } else if (error is ApiException) {
          add(SearchErrorEvent(message: 'Problem with the Search. Try again.'));
        } else {
          add(SearchErrorEvent(
              message: 'Something went wrong. Try again later.'));
        }
      });
    });
    on<SearchResultsEvent>(
        (event, emit) => emit(SearchResultsState(result: event.result)));
    on<ResetPageEvent>((event, emit) => emit(SearchInitial()));
    on<SearchErrorEvent>(
        (event, emit) => emit(SearchErrorState(message: event.message)));
  }
}
