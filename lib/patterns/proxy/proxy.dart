/**
 *
 * ## The essence of the pattern.
 *
 * * Proxy is a structural design pattern that lets you provide a substitute or
 *   placeholder for another object. A proxy controls access to the original
 *   object, allowing you to perform something either before or after the request
 *   gets through to the original object.
 *
 *
 * ## Analogy from life.
 *
 * * A credit card is a proxy for a bank account, which is a proxy for a bundle
 *   of cash. Both implement the same interface: they can be used for making
 *   a payment. A consumer feels great because there’s no need to carry loads of
 *   cash around. A shop owner is also happy since the income from a transaction
 *   gets added electronically to the shop’s bank account without the risk of
 *   losing the deposit or getting robbed on the way to the bank.
 *
 *
 * ## Applicability.
 *
 * * Lazy initialization (virtual proxy). This is when you have a heavyweight
 *   service object that wastes system resources by being always up, even though
 *   you only need it from time to time.
 *
 *   Instead of creating the object when the app launches, you can delay the
 *   object’s initialization to a time when it’s really needed.
 *
 * * Access control (protection proxy). This is when you want only specific
 *   clients to be able to use the service object; for instance, when your
 *   objects are crucial parts of an operating system and clients are various
 *   launched applications (including malicious ones).
 *
 *   The proxy can pass the request to the service object only if the client’s
 *   credentials match some criteria.
 *
 * * Local execution of a remote service (remote proxy). This is when the service
 *   object is located on a remote server.
 *
 *   In this case, the proxy passes the client request over the network,
 *   handling all of the nasty details of working with the network.
 *
 *
 * ## Implementation steps:
 *
 * (1) If there’s no pre-existing service interface, create one to make proxy
 *     and service objects interchangeable. Extracting the interface from the
 *     service class isn’t always possible, because you’d need to change all of
 *     the service’s clients to use that interface. Plan B is to make the proxy
 *     a subclass of the service class, and this way it’ll inherit the interface
 *     of the service.
 */
abstract class CachedNetworkImage {
  void loadImageFromInternet();
}

/**
 * (2) Create the proxy class. It should have a field for storing a reference
 *     to the service. Usually, proxies create and manage the whole life cycle
 *     of their services. On rare occasions, a service is passed to the proxy
 *     via a constructor by the client.
 */
class Proxy implements CachedNetworkImage {
  String _imageUrl;

  /**
   * Reference to the service object
   */
  ImageLoader _imageLoader;

  Proxy(this._imageUrl);

  @override
  void loadImageFromInternet() {
    _subject().loadImageFromInternet();
  }

  /**
   * (3) Implement the proxy methods according to their purposes. In
   *     most cases, after doing some work, the proxy should delegate the
   *     work to the service object.
   */
  ImageLoader _subject() {
    if (_imageLoader != null) return _imageLoader;
    /**
     * We create a service object, the principle is similar to creating an
     * object using the Singleton pattern
     */
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
