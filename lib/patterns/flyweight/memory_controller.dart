class MemoryController {
  int _memory = 0;

  void addToMemory(int memory) {
    _memory += memory;
    print("$_memory MB of memory occupied");
  }
}
