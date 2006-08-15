class C { }

class D1 : C {
  var x : int;
}

class D2 : C {
  var x : float;
}

var c1 : C = D1();
var c2 : C = D2();

writeln(c1);
writeln(c2);

def foo(c : C) {
  writeln(c.x);
}

foo(c1);
foo(c2);
