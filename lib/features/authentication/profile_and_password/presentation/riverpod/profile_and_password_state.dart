part of './profile_and_password_provider.dart';


class ProfileAndPasswordState{
  ProfileAndPasswordState({
    required this.isDisable,
});


  final bool isDisable;

  ProfileAndPasswordState copyWith({
    bool? isDisable,

}){
    return ProfileAndPasswordState(
      isDisable: isDisable ?? this.isDisable,
    );
  }


}