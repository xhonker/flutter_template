class BaseEntity<T> {
  int code;
  T data;
  String message;

  BaseEntity({this.code, this.message, this.data});

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'] as int;
    message = json['message'] as String;

    if (json.containsKey("data")) {
      try {
        data = JsonConvert._getFromJson(T, json['data']);
      } catch (e) {
        print('error $e');
      }
    }
  }
}

class JsonConvert<T> {
  static _getFromJson<T>(Type type, json) {
    switch (type) {
      default:
    }
  }
}
