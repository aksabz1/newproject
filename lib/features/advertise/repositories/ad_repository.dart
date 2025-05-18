
import 'package:salons/features/advertise/data/data_source/remote/ad_api_provider.dart';
import 'package:salons/features/advertise/data/models/ads_model.dart';

import '../../../core/error_handling/check_exceptions.dart';
import '../../../core/utils/error_handling/data_state.dart';

class AdRepository{
  AdApiProvider apiProvider;
  AdRepository(this.apiProvider);

  Future<DataState<dynamic>> fetchAds() async {
    try{
      final response = await apiProvider.getAdvertisements();
      return DataSuccess(AdsModel.fromJson(response.data));
    } catch(e){
      return CheckExceptions.getError(e);
    }
  }

}