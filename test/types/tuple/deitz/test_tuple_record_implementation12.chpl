record mytuple {
  var field1 : int;
  var field2 : float;
  def foo(param i : int) var where i == 1 {
    return field1;
  }
  def foo(param i : int) var where i == 2 {
    return field2;
  }
}

var t = mytuple(12, 14.0);

writeln(t);

writeln(t.foo(1));
writeln(t.foo(2));
