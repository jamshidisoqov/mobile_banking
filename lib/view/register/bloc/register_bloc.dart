import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_banking/core/common/connection_util.dart';
import 'package:mobile_banking/core/data/api/auth/auth_api.dart';
import 'package:mobile_banking/core/data/request/auth/register_request.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthApi authApi;

  RegisterBloc(this.authApi) : super(RegisterState()) {
    on<RegisterClick>((event, emit) async {
      try {
        if (await hasConnection()) {
          emit(state.copyWith(stateEnum: RegisterStateEnum.loading));
          var response = await authApi.registerUser(
            RegisterRequest(
              firstName: event.firstName,
              lastName: event.lastName,
              phoneNumber: event.phone,
              password: event.password,
            ),
          );
          response.onSuccess((p0) {
            emit(state.copyWith(stateEnum: RegisterStateEnum.success));
          }).onMessage((p0) {
            emit(state.copyWith(
                stateEnum: RegisterStateEnum.message, message: p0));
          }).onError((p0) {
            emit(state.copyWith(
                stateEnum: RegisterStateEnum.error, error: p0.toString()));
          }).onServerError((p0) {
            emit(state.copyWith(
                stateEnum: RegisterStateEnum.error, error: p0.toString()));
          });
        } else {
          emit(state.copyWith(stateEnum: RegisterStateEnum.noInternet));
        }
      } catch (e) {
        emit(state.copyWith(
            stateEnum: RegisterStateEnum.error, error: e.toString()));
      }
    });
  }
}
