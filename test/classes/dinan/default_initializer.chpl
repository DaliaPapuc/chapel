class Matrix {
  type element_t;
  var dom;
  var initVal: element_t;

  var data: [dom] element_t = initVal;
}

var m = new Matrix(real, {1..10, 1..10}, 1.0);

delete m;

