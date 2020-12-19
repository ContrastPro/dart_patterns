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
 * (1)
 */
abstract class Subject {
  void someMethod();
}

class ExpensiveClass implements Subject {
  String name;

  ExpensiveClass(this.name);

  void someMethod() {
    print("someMethod of $name (an ExpensiveClass) is being called");
  }
}

class Proxy implements Subject {
  String _name;
  ExpensiveClass _sub;

  Proxy(this._name);

  void someMethod() {
    print("someMethod of $_name (a Proxy) is being called");
    _subject().someMethod();
  }

  ExpensiveClass _subject() {
    if (_sub != null) return _sub;
    print("Creating an instance of ExpensiveClass for the proxy...");
    _sub = ExpensiveClass(_name);
    return _sub;
  }
}