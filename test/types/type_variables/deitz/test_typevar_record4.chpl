class node {
  type t;
  var element : t;
  var next : node(t);
}

record foo {
  type t;
  var length : int;
  var first : node(t);
  var last : node(t);

  def append(e : t) {
   var new : node(t) = node(t);
    new.element = e;
    if length > 0 {
      last.next = new;
      last = new;
    } else {
      first = new;
      last = new;
    }
    length += 1;
    return this;
  }

  def prepend(e : t) {
    var new : node(t) = node(t);
    new.element = e;
    if length > 0 {
      new.next = first;
      first = new;
    } else {
      first = new;
      last = new;
    }
    length += 1;
    return this;
  }
}

def fwrite(fp : file, f : foo) {
  fwrite(fp, "(/");
  var tmp = f.first;
  while tmp != nil {
    fwrite(fp, tmp.element);
    tmp = tmp.next;
    if (tmp != nil) {
      fwrite(fp, ", ");
    }
  }
  fwrite(fp, "/)");
}

var f : foo(int);

f.append(1);
f.append(2);
f.prepend(3);
f.prepend(4);

writeln(f);
