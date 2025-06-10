import 'package:bloc/bloc.dart';
import 'package:canary_template/data/repository/profile_buyer_repository.dart';
import 'package:canary_template/presentation/buyer/profile/bloc/profile_buyer_event.dart';
import 'package:canary_template/presentation/buyer/profile/bloc/profile_buyer_state.dart';
import 'package:meta/meta.dart';

class ProfileBuyerBloc extends Bloc<ProfileBuyerEvent, ProfileBuyerState> {
  final ProfileBuyerRepository profileBuyerRepository;
  ProfileBuyerBloc({required this.profileBuyerRepository}) : super(ProfileBuyerInitial()){
    on<AddProfileBuyerEvent>(_addProfileBuyer);
    on<GetProfileBuyerEvent>(_getProfileBUyer);
  }

  Future<void> _addProfileBuyer(
    AddProfileBuyerEvent event,
    Emitter<ProfileBuyerState> emit,
  ) async {
    emit(ProfileBuyerLoading());
    final result = await profileBuyerRepository.addProfileBuyer(
      event.requestModel,
    );
    result.fold((error) => emit(ProfileBuyerAddError(message: error)), (
      profile,
    ) {
      emit(ProfileBuyerAdded(profile: profile));
    });
  }
}
