class C {
  param p : int;
  var x : float;
}

class D : C {
  var y : int;
}

var d = D(p=2);

writeln(d);

def foo(c : C) {
  for param i in 1..c.p do
    writeln(i);
}

foo(d);
