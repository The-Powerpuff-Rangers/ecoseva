import 'dart:convert';

class AccessToken {
  final String accessToken;
  final String refreshToken;
  AccessToken({
    required this.accessToken,
    required this.refreshToken,
  });

  AccessToken copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return AccessToken(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access': accessToken,
      'refresh': refreshToken,
    };
  }

  factory AccessToken.fromMap(Map<String, dynamic> map) {
    return AccessToken(
      accessToken: map['access'] ?? '',
      refreshToken: map['refresh'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AccessToken.fromJson(String source) => AccessToken.fromMap(json.decode(source));

  @override
  String toString() => 'AccessTokens(accessToken: $accessToken, refreshToken: $refreshToken)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AccessToken && other.accessToken == accessToken && other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode;
}
