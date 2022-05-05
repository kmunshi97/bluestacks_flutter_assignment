import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

import 'user_metadata_model.dart';
export 'user_metadata_model.dart';

part 'user_model_event.dart';
part 'user_model_state.dart';

class UserMetadataBloc
    extends HydratedBloc<UserMetadataEvent, UserMetadataState> {
  UserMetadataBloc()
      : super(
          UserMetadataUserDefinedState(
            metadata: UserMetadataModel(),
          ),
        ) {
    //
    on<UserMetadataChangeEvent>(
      (event, emit) => emit(
        UserMetadataUserDefinedState(
          metadata: UserMetadataModel(
            username: event.metadata?.username,
            selectedLanguage: event.metadata?.selectedLanguage ?? 'en',
            isLightTheme: event.metadata?.isLightTheme ?? true,
          ),
        ),
      ),
    );
  }

  @override
  UserMetadataState fromJson(Map<String, dynamic> json) {
    return UserMetadataUserDefinedState(
      metadata: UserMetadataModel.fromMap(json),
    );
  }

  @override
  Map<String, dynamic> toJson(UserMetadataState state) {
    return state.metadata?.toMap() ?? {};
  }
}
