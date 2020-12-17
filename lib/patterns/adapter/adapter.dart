import 'dart:convert';

/**
 *
 * ## The essence of the pattern.
 *
 * * An [Adapter] is a structural design pattern that allows objects with incompatible
 *   interfaces to work together.
 *   The intermediary class acts as a bridge between your
 *   client code and another class. You could also think of the [Adapter] class as a wrapper
 *   around an object of another class.
 *
 *
 * ## Analogy from life.
 *
 * * When you fly abroad for the first time, you may be in for a surprise when you try
 *   to charge your laptop. Outlet standards differ from country to country.
 *   Your European charger will be useless in the US without a dedicated adapter that
 *   allows you to plug into a different outlet.
 *
 *
 * ## Applicability.
 *
 * * When you want to use a third party class, but its interface doesn't match the rest
 *   of the application code.
 *   The [Adapter] allows you to create a shim object that will turn your application calls
 *   into a format that a third-party class can understand.
 *
 *
 * ## Implementation steps:
 *
 * (1) Make sure you have two classes with incompatible interfaces
 *
 * (1.1) A useful service is a utility class that you cannot modify
 *       (it is either third-party or other code depends on it);
 */
class MediumAPI {
  String getMediumPosts() {
    /**
     * Note that each API has a different method for acquiring posts, and though they both
     * return content in JSON format, the property names differ.
     */
    return '[{"headline": "Medium headline", "text": "Text 1..."}]';
  }
}

/**
 * (1.2) One or more clients - existing application classes that are incompatible
 *       with the service due to an inconvenient or mismatched interface.
 */
class HabrAPI {
  String getHabrPosts() {
    /**
     * Note that each API has a different method for acquiring posts, and though they both
     * return content in JSON format, the property names differ.
     */
    return '[{"header": "Habr header", "body": "Body 1..."}]';
  }
}

class Post {
  final String title;
  final String content;

  const Post(this.title, this.content);
}

/**
 * (2) Describe a client interface through which application classes can use the
 *     service class.
 */
abstract class IPostsAPI {
  List<Post> getPosts();
}

/**
 * (3) Create an adapter class by implementing this interface.
 */
class MediumAdapter implements IPostsAPI {
  /**
   * (4) Place a field in the adapter that will hold the link to the service object.
   *     Typically, this field is populated with an object passed to the adapter constructor.
   *     For simple adaptation, this object can be passed through the parameters of the adapter
   *     methods.
   */
  final api = MediumAPI();

  /**
   * (5) Implement all client interface methods in the adapter. The adapter must
   *     delegate the main work to the service.
   */
  @override
  List<Post> getPosts() {
    final rawPosts = jsonDecode(api.getMediumPosts()) as List;

    return rawPosts
        .map((post) => Post(post['headline'], post['text']))
        .toList();
  }
}

class HabrAdapter implements IPostsAPI {
  final api = HabrAPI();

  @override
  List<Post> getPosts() {
    final rawPosts = jsonDecode(api.getHabrPosts()) as List;

    return rawPosts.map((post) => Post(post['header'], post['body'])).toList();
  }
}
