def foo(i : int) {
  writeln("foo of ", i);
  def bar(i : int) {
    writeln("bar of ", i);
    car(i);
  }
  def car(i : int) {
    writeln("car of ", i);
  }
  bar(i);
}

foo(5);
