class ImageConstants {
  const ImageConstants._init();

  static ImageConstants? _instance;

  static ImageConstants get instance {
    return _instance ??= const ImageConstants._init();
  }

  String get logo => toPng('logo');

  String toPng(String name) => "assets/images/$name";
}
