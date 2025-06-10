import 'package:canary_template/data/model/response/buyer/buyer_profile_response_model.dart';

sealed class ProfileBuyerState {}

final class ProfileBuyerInitial extends ProfileBuyerState {}

final class ProfileBuyerLoading extends ProfileBuyerState {}

final class ProfileBuyerLoaded extends ProfileBuyerState {
  final BuyerProfileResponseModel profile;

  ProfileBuyerLoaded({required this.profile});
}