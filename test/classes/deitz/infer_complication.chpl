class C {
  var x;
  var y;
  def foo() {
    return x + y;
  }
}

var c = C(2, 5);
writeln(c.foo());

var d = C("hello", "world");
writeln(d.foo());
