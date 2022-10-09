import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../home/models/campaign_model.dart';

part 'proof_state.dart';

class ProofCubit extends Cubit<ProofState> {
  ProofCubit() : super(ProofInitial());
}
