import 'package:canary_template/data/model/response/burung_semua_tersedia_model.dart';

sealed class GetBurungTersediaState {}

final class GetBurungTersediaInitial extends GetBurungTersediaState {}

final class GetBurungTersediaLoading extends GetBurungTersediaState {}

final class GetBurungTersediaLoaded extends GetBurungTersediaState {
  final BurungSemuaTersediaModel burungTersedia;
  GetBurungTersediaLoaded({required this.burungTersedia});
}