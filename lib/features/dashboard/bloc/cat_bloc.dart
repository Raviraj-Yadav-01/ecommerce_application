

import 'package:ecommerce_application/core/services/api_services.dart';
import 'package:ecommerce_application/features/dashboard/data/model/cat_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/apps_urls.dart';
import 'cat_event.dart';
import 'cat_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  ApiService apiService;

  CategoryBloc({required this.apiService}) :super(CategoryInitialState()) {

    on<GetCategoryEvent>((event, emit)async{
      emit(CategoryLoadingState());

      try {
        var responseBody = await apiService.getApi(url: AppUrls.cat_url);

        if(responseBody["status"]){
          print(responseBody["data"]);
          List<dynamic> mCatMap = responseBody["data"];
          List<CatModel> mCatModel = [];

          for(Map<String, dynamic> eachMap in mCatMap){
            mCatModel.add(CatModel.fromJson(eachMap));
          }

          emit(CategoryLoadedState(mCat: mCatModel));


        } else {
          emit(CategoryErrorState(errorMsg: responseBody["message"]));
        }

      }catch(e){
        emit(CategoryErrorState(errorMsg: e.toString()));
      }
    });


  }
}
