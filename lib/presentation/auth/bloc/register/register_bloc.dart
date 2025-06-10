import 'package:bloc/bloc.dart';
import 'package:canary_template/data/repository/auth_repository.dart';
import 'package:canary_template/presentation/auth/bloc/register/register_event.dart';
import 'package:canary_template/presentation/auth/bloc/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;
  RegisterBloc({required this.authRepository}) : super(RegisterInitial()) {
    on<RegisterRequested>(_onRegisterRequested);
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());

    final result = await authRepository.register(event.requestModel);

    result.fold(
      (l) => emit(RegisterFailure(error: l)),
      (r) => emit(RegisterSuccess(responseModel: r)),
  );
}
}