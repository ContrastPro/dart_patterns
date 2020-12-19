import 'dart:convert';

/**
 *
 * ## The essence of the pattern.
 *
 * * An [Adapter] is a structural design pattern that allows objects with
 *   incompatible interfaces to work together.
 *
 *   This is a special object that converts the interface of one object so that
 *   another object can understand it. An adapter wraps one of the objects to
 *   hide the complexity of conversion happening behind the scenes. The wrapped
 *   object isn’t even aware of the adapter.
 *
 *
 * ## Analogy from life.
 *
 * * When you travel from the US to Europe for the first time, you may get a
 *   surprise when trying to charge your laptop. The power plug and sockets
 *   standards are different in different countries. That’s why your US plug
 *   won’t fit a German socket. The problem can be solved by using a power plug
 *   adapter that has the American-style socket and the European-style plug.
 *
 *
 * ## Applicability.
 *
 * * Use the Adapter class when you want to use some existing class, but its
 *   interface isn’t compatible with the rest of your code.
 *
 *   The Adapter pattern lets you create a middle-layer class that serves as a
 *   translator between your code and a legacy class, a 3rd-party class or any
 *   other class with a weird interface.
 *
 *
 * ## Implementation steps:
 *
 * (1) Make sure that you have at least two classes with incompatible
 *     interfaces
 *
 * (1.1) A useful service class, which you can’t change
 *       (often 3rd-party, legacy or with lots of existing dependencies).
 */
class MediumAPI {
  String getMediumPosts() {
    /**
     * Note that each API has a different method for acquiring posts, and though
     * they both return content in JSON format, the property names differ.
     */
    return '[{"headline": "Medium headline", "text": "Text 1..."}]';
  }
}

/**
 * (1.2) One or several client classes that would benefit from using the service
 *       class.
 */
class HabrAPI {
  String getHabrPosts() {
    /**
     * Note that each API has a different method for acquiring posts, and though
     * they both return content in JSON format, the property names differ.
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
abstract class PostsAPI {
  List<Post> getPosts();
}

/**
 * (3) Create an adapter class by implementing this interface.
 */
class MediumAdapter implements PostsAPI {
  /**
   * (4) Add a field to the adapter class to store a reference to the service
   *     object. The common practice is to initialize this field via the
   *     constructor, but sometimes it’s more convenient to pass it to the
   *     adapter when calling its methods.
   */
  final api = MediumAPI();

  /**
   * (5) One by one, implement all methods of the client interface in the
   *     adapter class. The adapter should delegate most of the real work to the
   *     service object, handling only the interface or data format conversion.
   */
  @override
  List<Post> getPosts() {
    final rawPosts = jsonDecode(api.getMediumPosts()) as List;

    return rawPosts
        .map((post) => Post(post['headline'], post['text']))
        .toList();
  }
}

class HabrAdapter implements PostsAPI {
  final api = HabrAPI();

  @override
  List<Post> getPosts() {
    final rawPosts = jsonDecode(api.getHabrPosts()) as List;

    return rawPosts.map((post) => Post(post['header'], post['body'])).toList();
  }
}
