class array1d {
  type t;
  var x1 : t;
  var x2 : t;
  var x3 : t;
  def this(i : int) : t {
    var result : t;
    select i {
      when 1 do result = x1;
      when 2 do result = x2;
      when 3 do result = x3;
      otherwise writeln("[Out of bounds read]");
    }
    write("[Read on ", i, " returns ", result, "]");
    return result;
  }
  def =this(i : int, val : t) : t {
    select i {
      when 1 do x1 = val;
      when 2 do x2 = val;
      when 3 do x3 = val;
      otherwise writeln("[Out of bounds write]");
    }
    writeln("[Write on ", i, " sets ", val, "]");
    return val;
  }
}

var a : array1d(int) = array1d(int);

a(1) = 3;
a(2) = 2;
a(3) = 1;
writeln(a(1), a(2), a(3));
