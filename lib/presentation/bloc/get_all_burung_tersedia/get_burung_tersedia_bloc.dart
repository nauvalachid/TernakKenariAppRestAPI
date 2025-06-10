import 'package:bloc/bloc.dart';
import 'package:canary_template/data/repository/get_all_burung_tersedia_repository.dart';
import 'package:canary_template/presentation/bloc/get_all_burung_tersedia/get_burung_tersedia_event.dart';
import 'package:canary_template/presentation/bloc/get_all_burung_tersedia/get_burung_tersedia_state.dart';
import 'package:meta/meta.dart';

class GetBurungTersediaBloc 
    extends Bloc<GetBurungTersediaEvent, GetBurungTersediaState> {
  final GetAllBurungTersediaRepository getAllBurungTersediaRepository;

  GetBurungTersediaBloc(this.getAllBurungTersediaRepository) : super(GetBurungTersediaInitial()) {
    on<GetAllBurungTersediaEvent>(_getAllBurungTersedia); 
    }
  }
}
