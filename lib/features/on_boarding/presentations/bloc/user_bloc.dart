import 'package:ecommerce_application/core/constants/apps_urls.dart';
import 'package:ecommerce_application/features/on_boarding/presentations/bloc/user_event.dart';
import 'package:ecommerce_application/features/on_boarding/presentations/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/services/api_services.dart';

class UserBloc extends Bloc<UserEvent, UserState>{

  ApiService apiService;

  UserBloc({required this.apiService}) : super(UserInitialState()) {

    ///UserRegister Event
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

          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isRegistered', true);

          /// Auto login — registration ke turant baadkoi
          /*add(UserAuthenticateEvent(
            email: event.email,
            pass: event.pass,
          ));*/

        }else{
          emit(UserFailureState(
            errorMsg: responseBody != null ? (responseBody["message"] ?? "Signup failed") : "Server return null",
          ));
        }
      }catch(e){
       emit(UserFailureState(errorMsg: e.toString()));
      }


    });


    ///UserAuthentication Event
    on<UserAuthenticateEvent>((event, emit) async {
      emit(UserLoadingState());
      ///Exception Handling
      try{
        print("Login attempt: ${event.email}");

        var responseBody = await apiService.postApi( url: AppUrls.login_url,
            mBody: {
              "email": event.email,
              "password":event.pass
            });

        print("Login response: $responseBody");

        if(responseBody != null && responseBody["status"] == true){
          emit(UserSuccessState());
          message: responseBody["message"] ?? "Login successful";
        }else{
          emit(UserFailureState(
            errorMsg: responseBody != null ? (responseBody["message"] ?? "LogIn failed") : "Server return null",
          ));
        }
      }catch(e){
        emit(UserFailureState(errorMsg: e.toString()));
      }


    });




  }
}