class foo {
  var i : int;
/* def f() { return 10 + i; } */
}

def f(x : foo) {
  return 20 + x.i;
}

var a = foo();
a.i = 1;

writeln(f(a));
/* writeln(a.f()); */
