import 'dart:io';

import '../../patterns/adapter/adapter.dart';
import '../../patterns/bridge/bridge.dart';
import '../../patterns/composite/composite.dart';
import '../../patterns/decorator/decorator.dart';
import '../../patterns/facade/facade.dart';
import '../../patterns/flyweight/flyweight.dart';

class StructuralPattern {
  /**
   * ## [Adapter]
   */
  static void dartAdapter() {
    /**
     * Since both adapter classes are guaranteed to have the same interface as
     * PostsAPI, we can type API variables as IPostsAPI.
     */
    final PostsAPI apiMedium = MediumAdapter();
    final PostsAPI apiHabr = HabrAdapter();

    final List<Post> posts = apiMedium.getPosts() + apiHabr.getPosts();
    for (int i = 0; i < posts.length; i++) {
      print("Title: ${posts[i].title}\nContent: ${posts[i].content}\n");
    }
  }

  /**
   * ## [Bridge]
   */
  static void dartBridge() {
    final flutterWindows = FlutterEngine(flutterSDK: FlutterWindows());
    flutterWindows.runApp();

    final flutterIOS = FlutterEngine(flutterSDK: FlutterIOS());
    flutterIOS.runApp();

    final flutterWEB = FlutterEngine(flutterSDK: FlutterWEB());
    flutterWEB.runApp();
  }

  /**
   * ## [Composite]
   */
  static void dartComposite() {
    /**
     * We create a largeGiftBox and add three items to it. Next, we create
     * smallGiftBox with a single item inside. Then we add the smallGiftBox into
     * the largeGiftBox, so the largeGiftBox now contains three items and
     * smallGiftBox.
     *
     * When we print out the price and weight of the largeGiftBox,
     * the result is an aggregate of all prices and weights contained therein.
     */
    final largeGiftBox = GiftBox()
      ..addItem(Item(price: 33.65, weight: 3.3))
      ..addItem(Item(price: 14.97, weight: 4.5))
      ..addItem(Item(price: 5.95, weight: 2.7));

    final smallGiftBox = GiftBox()..addItem(Item(price: 12.68, weight: 2.7));

    largeGiftBox.addItem(smallGiftBox);

    print("Price: ${largeGiftBox.price}");
    print("Weight: ${largeGiftBox.weight}");
  }

  /**
   * ## [Decorator]
   */
  static void dartDecorator() {
    /**
     * First, we create a square and print the output from its draw() method,
     * which will be the shape's name alone. To create a green square, we
     * construct an instance of GreenShapeDecorator and pass it the square.
     * When we draw the green square, we see that the square has been decorated.
     *
     * One of the strengths of the Decorator pattern is the ability to apply as
     * many decorators as we wish to any object, so we can add some blue to the
     * green square, resulting in a square with both color decorations.
     */
    final square = Square();
    print(square.draw());

    final greenSquare = GreenShapeDecorator(square);
    print(greenSquare.draw());

    final blueGreenSquare = BlueShapeDecorator(greenSquare);
    print(blueGreenSquare.draw());
  }

  /**
   * ## [Facade]
   */
  static void dartFacade() {
    PC pc = PC();
    stdin.readLineSync() == "on" ? pc.turnOn() : pc.turnOff();
  }

  /**
   * ## [Flyweight]
   */
  static void dartFlyweight() {

  }

  /**
   * ## [Proxy]
   */
  static void dartProxy() {}
}
