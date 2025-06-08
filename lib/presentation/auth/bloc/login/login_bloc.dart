import 'package:bloc/bloc.dart';
import 'package:canary_template/data/repository/auth_repository.dart';
import 'package:canary_template/presentation/auth/bloc/login/login_event.dart';
import 'package:canary_template/presentation/auth/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }
}
