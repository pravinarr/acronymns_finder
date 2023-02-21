import 'package:acronyms_finder/blocs/search/bloc/search_bloc.dart';
import 'package:acronyms_finder/blocs/search/widgets/search_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Search Page
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc? _searchBloc;
  TextEditingController? _searchController;
  FocusNode? _searchFocus;

  @override
  void initState() {
    _searchBloc = SearchBloc();
    _searchController = TextEditingController();
    _searchFocus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: BlocConsumer(
        bloc: _searchBloc,
        listener: (context, state) {
          if (state is SearchErrorState) {
            showBottomSheet(
                context: context,
                elevation: 10,
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.2,
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              state.message,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Column(
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),
                                    child: const Text(
                                      'DONE',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                const SizedBox(height: 40)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                  backgroundColor: Colors.grey[100],
                  floating: true,
                  forceElevated: false,
                  elevation: 0,
                  collapsedHeight: 120,
                  flexibleSpace: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          key: const Key('search_field'),
                          controller: _searchController,
                          cursorColor: Colors.black,
                          focusNode: _searchFocus,
                          textInputAction: TextInputAction.search,
                          autofocus: true,
                          decoration: InputDecoration(
                              hintText: 'Search for acronyms',
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.close_rounded,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  _searchController!.clear();
                                  _searchFocus!.requestFocus();
                                  _searchBloc!.add(ResetPageEvent());
                                },
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              hintStyle: const TextStyle(fontSize: 20),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1))),
                          onSubmitted: (String str) {
                            _searchBloc!.add(SearchForItemEvent(sf: str));
                          },
                        ),
                      ),
                      if (state is SearchResultsState)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('${state.searchResults.length} results'),
                            ],
                          ),
                        )
                    ],
                  )),
              if (state is SearchInitial || state is SearchErrorState)
                SliverFillRemaining(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Search for an acronym'),
                    ],
                  ),
                )
              else if (state is SearchingState)
                SliverFillRemaining(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ],
                  ),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 16),
                        child: Container(
                          color: index % 2 == 0 ? Colors.white38 : Colors.white,
                          height: 80,
                          child: SearchItems(
                              searchItem: state.searchResults[index]),
                        ),
                      );
                    },
                    childCount:
                        (state as SearchResultsState).searchResults.length,
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
