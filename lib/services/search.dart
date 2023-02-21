import 'package:acronyms_finder/models/acronym_serach.dart';
import 'package:acronyms_finder/services/errors/api_error.dart';
import 'package:http/http.dart' as http;

class SearchService {
  static final SearchService _singletonObject = SearchService._internal();
  factory SearchService() {
    return _singletonObject;
  }

  SearchService._internal();

  Future<List<AcronymSearch>> searchResults(String? sf) async {
    Map<String, String> queryParams = {};
    if (sf != null && sf.isNotEmpty) {
      queryParams['sf'] = sf;
    }
    Uri url = Uri.http(
        "nactem.ac.uk", "/software/acromine/dictionary.py", queryParams);
    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        return response.body;
      }
      throw ApiException(response);
    }).then((response) {
      return response;
    }).then((value) => parseSearchResults(value));
  }
}
