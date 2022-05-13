class Error {
  Error({
    required this.code,
    required this.messages,
  });

  int code;
  String messages;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"] ?? 0,
        messages: (json["messages"] ?? json["message"]).toString(),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "messages": messages,
      };

  @override
  String toString() {
    return "code: $code, messages: $messages";
  }
}
