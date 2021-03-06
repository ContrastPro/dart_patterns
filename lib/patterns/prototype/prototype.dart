void main() {
  final Circle originalCircle = Circle(radius: 11, color: "Black");
  final Circle cloneCircle = originalCircle.clone();
  final Circle someOtherCircle = Circle(radius: 55, color: "White");

  print(
    "Original circle is: ${originalCircle.cloneStatus},"
    "\nColor: ${originalCircle.color}"
    "\nRadius: ${originalCircle.radius}\n",
  );
  print(
    "Clone circle is: ${cloneCircle.cloneStatus},"
    "\nColor: ${cloneCircle.color}"
    "\nRadius: ${cloneCircle.radius}\n",
  );
  print(
    "Some other circle is: ${someOtherCircle.cloneStatus},"
    "\nColor: ${someOtherCircle.color}"
    "\nRadius: ${someOtherCircle.radius}\n",
  );
}

abstract class Prototype {
  String color;

  Prototype clone();
}

class Circle implements Prototype {
  @override
  String color;

  double radius;
  bool isClone = false;

  Circle({this.radius, this.color});

  Circle.createClone(Circle circle) {
    radius = circle.radius;
    color = circle.color;
    isClone = true;
  }

  String get cloneStatus => isClone ? "a clone shape" : "an original shape";

  @override
  Circle clone() => Circle.createClone(this);
}
