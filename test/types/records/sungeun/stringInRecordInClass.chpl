record myR {
  var s: string;
}

class myC {
  var r = new myR();
}

proc main {
  var c = new myC();
  var s = "hi";
  writeln(c);
  c.r.s = s;
  writeln(c);
}
