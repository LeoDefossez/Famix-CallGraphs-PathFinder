# Famix CallGraphs PathFinder

## Testing Strategy
Test organization follows approach described in testing Famix CallGraphs, a blog post about this is [availaible here](https://modularmoose.org/blog/2025-10-08-testing-your-algo-on-a-java-project/).

## Examples short explanation

### Example 1
This resource provides the minimal linear topology for baseline validation. It establishes a single, unambiguous path from the entry point to the leaf method. Used as a sanity check to ensure the core traversal logic functions correctly on a simple directed acyclic sequence before attempting complex graph structures

### Example 2
This resource exposes a branching call topology to test multi-path detection. It offers two distinct routes from A2.main to B2.method(String): a direct invocation and a transitive call via B2.method(). Used to verify that the FamixCallGraphPathFinder can resolve and return all valid structural paths between two nodes.

### Example 3
This resource demonstrates a discrepancy between the static call graph and the dynamic execution flow caused by a state variable. While the direct path exists topologically, it is semantically invalid at runtime because the variable forces a loop. This tests whether the PathFinder returns the shortest structural path (ignoring data state) or attempts to resolve the valid execution trace.