class Cons {
  var car;
  var cdr; 
};

def print(c : Cons) {
  if (c != nil) {
     writeln(c.car);
     print(c.cdr);
  }
}

def reverse_internal(c, e) {
  if (c != nil)
    return reverse_internal(c.cdr, Cons(c.car, e));
  else
    return e;
}

def reverse(c : Cons) { return reverse_internal(c, nil); }

var a = Cons(1, Cons(2, Cons(3, nil)));
var b = Cons(1.0, Cons(2.0, Cons(3.0, nil)));

print(reverse(a));
print(reverse(b));
