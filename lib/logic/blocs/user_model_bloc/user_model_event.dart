part of 'user_model_bloc.dart';

abstract class UserMetadataEvent extends Equatable {
  const UserMetadataEvent();

  @override
  List<Object> get props => [];
}

class UserMetadataChangeEvent extends UserMetadataEvent {
  final UserMetadataModel? metadata;

  const UserMetadataChangeEvent({
    this.metadata,
  });
}
