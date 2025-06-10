import 'package:canary_template/data/model/request/buyer/buyer_profile_request_model.dart';

sealed class ProfileBuyerEvent {}

class AddProfileBuyerEvent extends ProfileBuyerEvent {
  final BuyerProfileRequestModel requestModel;

  AddProfileBuyerEvent ({required this.requestModel});
}