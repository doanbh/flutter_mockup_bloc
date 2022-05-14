enum LoadingLayout { rive, image, lottie }

class LoadingConfig {
  LoadingLayout layout = LoadingLayout.lottie;
  String? type;
  num? size;
  String? path;

  LoadingConfig({
    this.layout = LoadingLayout.lottie,
    this.type,
    this.size,
    this.path,
  });

  LoadingConfig.fromJson(dynamic json) {
    layout = LoadingLayout.values.firstWhere(
      (element) => element.toString().split('.').last == json['layout'],
      orElse: () => LoadingLayout.lottie,
    );
    type = json['type'];
    size = json['size'];
    path = json['path'];
  }

  Map toJson() {
    var map = <String, dynamic>{};
    map['layout'] = layout.toString().split('.').last;
    map['type'] = type;
    map['size'] = size;
    map['path'] = path;
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
