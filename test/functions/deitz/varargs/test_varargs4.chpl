param n : int = 2;

def foo(ys : string ...n) {
  for i in 1..n do
    writeln(ys(i));
}

foo("hello", "world!");
