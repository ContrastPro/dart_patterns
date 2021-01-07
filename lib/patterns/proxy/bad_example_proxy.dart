void bad_example_proxy() {
  final NetworkImage networkImage = ImageLoader(
    imageUrl: "http//unsplash/image_1",
  );

  //networkImage.displayImage();
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
