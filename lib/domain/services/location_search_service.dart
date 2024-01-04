import 'package:logistics_now/core/utils/api/api_call_helper.dart';
import 'package:logistics_now/data/location_value.dart';

class LocationSearchService {
  final _apiCallHelper = ApiCallHelper();

  Future<LocationValue> fetchLocationData(String searchedText) async {
    final String baseUrl =
        'https://lorriservice.azurefd.net//api/autocomplete?suggest=$searchedText&limit=20&searchFields=new_locations';
    final response = await _apiCallHelper.get(baseUrl);

    if (response.isNotEmpty) {
      return LocationValue.fromJson(response);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
