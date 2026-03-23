
import 'package:ecommerce_application/core/constants/apps_urls.dart';
import 'package:ecommerce_application/features/on_boarding/presentations/bloc/user_event.dart';
import 'package:ecommerce_application/features/on_boarding/presentations/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/api_services.dart';

class UserBloc extends Bloc<UserEvent, UserState>{

  ApiService apiService;

  UserBloc({required this.apiService}) : super(UserInitialState()) {

    on<UserRegisterEvent>((event, emit) async {

     emit(UserLoadingState());

     ///Exception Handling
      try{
        var responseBody = await apiService.postApi( url: AppUrls.registration_url,
            mBody: {
                      "name":event.name,
                      "mobile_number":event.mobNo,
                      "email": event.email,
                      "password":event.pass
            });


        if(responseBody != null && responseBody["status"] == true){
          emit(UserSuccessState());
        }else{
          emit(UserFailureState(
            errorMsg: responseBody != null ? (responseBody["message"] ?? "Signup failed") : "Server return null",
          ));
        }
      }catch(e){
       emit(UserFailureState(errorMsg: e.toString()));
      }


    });


  }


}