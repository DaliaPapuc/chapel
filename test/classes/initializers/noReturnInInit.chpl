/* The Computer Language Benchmarks Game
   http://benchmarksgame.alioth.debian.org/

   contributed by Casey Battaglino, Ben Harshbarger, and Brad Chamberlain
   derived from the GNU C version by Jeremy Zerfas
*/


use DynamicIters;

config const n = 10;         // the maximum tree depth

proc main() {
  const minDepth = 4,                      // the shallowest tree
        maxDepth = max(minDepth + 2, n),   // the deepest normal tree
        strDepth = maxDepth + 1,           // the depth of the "stretch" tree
        depths = minDepth..maxDepth by 2;  // the range of depths to create
  var stats: [depths] (int,int);           // stores statistics for the trees

  //
  // Create the "stretch" tree, checksum it, print its stats, and free it.
  //
  const strTree = new Tree(0, strDepth);
  writeln("stretch tree of depth ", strDepth, "\t check: ", strTree.sum());
  delete strTree;

  //
  // Build the long-lived tree.
  //
  const llTree = new Tree(0, maxDepth);

  //
  // Iterate over the depths in parallel, dynamically assigning them
  // to tasks.  At each depth, create the required trees, compute
  // their sums, and free them.
  //
  forall depth in dynamic(depths, chunkSize=1) {
    const iterations = 2**(maxDepth - depth + minDepth);
    var   sum        = 0;

    for i in 1..iterations {
      const posT = new Tree( i, depth),
            negT = new Tree(-i, depth);

      sum += posT.sum() + negT.sum();

      delete posT;
      delete negT;
    }
    stats[depth] = (2*iterations, sum);
  }

  //
  // Print out the stats for the trees of varying depths.
  //
  for depth in depths do
    writeln(stats[depth](1), "\t trees of depth ", depth, "\t check: ",
            stats[depth](2));

  //
  // Checksum the long-lived tree, print its stats, and free it.
  //
  writeln("long lived tree of depth ", maxDepth, "\t check: ", llTree.sum());
  delete llTree;
}


//
// A simple balanced tree node class
//
class Tree {
  const item: int;
  const left, right: Tree;

  //
  // Two initializers (constructors) for a Tree object
  //
  proc init(item, left: Tree=nil, right: Tree=nil) {
    this.item  = item;
    this.left  = left;
    this.right = right;

    super.init();
  }

  proc init(item, depth) {
    if depth <= 0 then
      return new Tree(item);
    else
      return new Tree(item, new Tree(2*item-1, depth-1),
                            new Tree(2*item,   depth-1));
  }

  //
  // Add up tree node, freeing as we go
  //
  proc sum(): int {
    var sum = item;
    if left {
      sum += left.sum() - right.sum();
      delete left;
      delete right;
    }
    return sum;
  }
}
