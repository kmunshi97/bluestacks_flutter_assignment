import 'dart:convert';

class UserMetadataModel {
  final String? username;
  final String selectedLanguage;
  final bool isLightTheme;

  UserMetadataModel({
    this.username,
    this.selectedLanguage = "en",
    this.isLightTheme = true,
  });

  factory UserMetadataModel.fromMap(Map<String, dynamic> map) {
    return UserMetadataModel(
      username: map['username'],
      selectedLanguage: map['selectedLanguage'],
      isLightTheme: map['isLightTheme'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'selectedLanguage': selectedLanguage,
      'isLightTheme': isLightTheme,
    };
  }

  String toJson() => json.encode(toMap());

  factory UserMetadataModel.fromJson(String source) =>
      UserMetadataModel.fromMap(
        json.decode(source),
      );
}
