import 'package:bloc/bloc.dart';
import 'package:canary_template/data/repository/auth_repository.dart';
import 'package:canary_template/presentation/auth/bloc/register/register_event.dart';
import 'package:canary_template/presentation/auth/bloc/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;
  RegisterBloc({required this.authRepository}) : super(RegisterInitial()) {
    on<RegisterRequested>(_onRegisterRequested);
  }
}
