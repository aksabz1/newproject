
import 'package:salons/features/main/data/data_source/remote/service_types_api_provider.dart';
import 'package:salons/features/main/data/models/service_types_model.dart';

import '../../../core/error_handling/check_exceptions.dart';
import '../../../core/utils/error_handling/data_state.dart';

class ServiceTypesRepository{
  ServiceTypesApiProvider apiProvider;
  ServiceTypesRepository(this.apiProvider);

  Future<DataState<dynamic>> fetchServiceTypes() async {
    try{
      final response = await apiProvider.getServiceTypes();
      print(response.data);
      return DataSuccess(ServiceTypesModel.fromJson(response.data));
    } catch(e){
      return CheckExceptions.getError(e);
    }
  }

}