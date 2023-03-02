import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_banking/core/common/connection_util.dart';
import 'package:mobile_banking/core/data/api/auth/auth_api.dart';
import 'package:mobile_banking/core/data/request/auth/login_request.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthApi authApi;

  LoginBloc(this.authApi) : super(LoginState()) {
    on<LoginClick>(
      (event, emit) async {
        try {
          if (await hasConnection()) {
            emit(state.copyWith(stateEnum: LoginStateEnum.loading));
            var response = await authApi.loginUser(
              LoginRequest(
                phoneNumber: event.phone,
                password: event.password,
              ),
            );
            response.onSuccess((p0) {
              emit(state.copyWith(stateEnum: LoginStateEnum.success));
            }).onMessage((p0) {
              emit(state.copyWith(
                  stateEnum: LoginStateEnum.message, message: p0));
            }).onError((p0) {
              emit(state.copyWith(
                  stateEnum: LoginStateEnum.error, error: p0.toString()));
            }).onServerError((p0) {
              emit(state.copyWith(
                  stateEnum: LoginStateEnum.error, error: p0.toString()));
            });
          } else {
            emit(state.copyWith(stateEnum: LoginStateEnum.noInternet));
          }
        } catch (e) {
          emit(state.copyWith(
              stateEnum: LoginStateEnum.error, error: e.toString()));
        }
      },
    );
  }
}
