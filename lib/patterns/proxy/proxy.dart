void main() => _dartProxy();

void _dartProxy() {
  var proxy = Proxy("http//unsplash/image_1");
  proxy.loadImageFromInternet();
  print("\r\nNow if we call someMethod again...\r\n");
  proxy.loadImageFromInternet();
  print("\r\nWe reuse the instance we made above!");
}

abstract class CachedNetworkImage {
  void loadImageFromInternet();
}

class Proxy implements CachedNetworkImage {
  String _imageUrl;

  ImageLoader _imageLoader;

  Proxy(this._imageUrl);

  @override
  void loadImageFromInternet() {
    _subject().loadImageFromInternet();
  }

  ImageLoader _subject() {
    if (_imageLoader != null) return _imageLoader;

    print("Creating an instance of ImageLoader for the Proxy...");
    _imageLoader = ImageLoader(imageUrl: _imageUrl);
    return _imageLoader;
  }
}

class ImageLoader implements CachedNetworkImage {
  String imageUrl;

  ImageLoader({this.imageUrl});

  @override
  void loadImageFromInternet() {
    print("Load image of $imageUrl (ImageLoader) from Internet");
  }
}
