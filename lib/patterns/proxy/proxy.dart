import 'bad_example_proxy.dart';

void main() {
  badExampleProxy();
  /*final NetworkImage networkImage = Proxy(
    imageUrl: "http//unsplash/image_1",
  );

  networkImage.displayImage();*/
}

abstract class NetworkImage {
  void displayImage();
}

class ImageLoader implements NetworkImage {
  String _imageUrl;

  ImageLoader({String imageUrl}) {
    this._imageUrl = imageUrl;
    _loadImageFromInternet();
  }

  void _loadImageFromInternet() {
    print('Downloading an image $_imageUrl from the Internet...');
    print("Image downloaded successfully!");
  }

  @override
  void displayImage() {
    print("Image $_imageUrl display on screen");
  }
}

class Proxy implements NetworkImage {
  final String _imageUrl;

  ImageLoader _imageLoader;

  Proxy({String imageUrl}) : _imageUrl = imageUrl;

  @override
  void displayImage() {
    if (_imageLoader == null) {
      _imageLoader = ImageLoader(imageUrl: _imageUrl);
    }
    _imageLoader.displayImage();
  }
}
