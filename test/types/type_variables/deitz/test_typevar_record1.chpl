record foo {
  type t;
  var x : t;
  def print() {
    writeln(x);
  }
}

var f : foo(t=int);

f.x = 2;

f.print();

var g : foo(t=string);

g.x = "hello world";

g.print();
