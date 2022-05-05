part of 'user_model_bloc.dart';

abstract class UserMetadataState extends Equatable {
  final UserMetadataModel? metadata;

  const UserMetadataState({
    this.metadata,
  });

  @override
  List<Object> get props => [metadata!];
}

class UserMetadataUserDefinedState extends UserMetadataState {
  final UserMetadataModel? metadata;

  const UserMetadataUserDefinedState({
    this.metadata,
  });
}
