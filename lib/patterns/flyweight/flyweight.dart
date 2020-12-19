/**
 *
 * ## The essence of the pattern.
 *
 * * Flyweight is a structural design pattern that lets you fit more objects
 *   into the available amount of RAM by sharing common parts of state between
 *   multiple objects instead of keeping all of the data in each object.
 *
 *
 * ## Applicability.
 *
 * * Use the Flyweight pattern only when your program must support a huge number
 *   of objects which barely fit into available RAM.
 *
 *   The benefit of applying the pattern depends heavily on how and where
 *   it’s used. It’s most useful when:
 *
 *   - an application needs to spawn a huge number of similar objects
 *
 *   - this drains all available RAM on a target device
 *
 *   - the objects contain duplicate states which can be extracted and shared
 *   between multiple objects
 *
 *
 *
 * ## Implementation steps:
 *
 * (1)
 */
