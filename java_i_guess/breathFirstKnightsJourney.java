public final class BreadthFirstKnightJourney {
 
    public static long distance(Position start, Position finish, Set<Position> obstacles) {
        Queue<Position> queue = new LinkedList<>(Arrays.asList(start));
        Set<Position> visited = new HashSet<>(Arrays.asList(start));
        long jumps = 0;
        while (!queue.isEmpty()) {
            Queue<Position> frontier = queue;
            queue = new LinkedList<>();
            while (!frontier.isEmpty()) {
                Position current = frontier.remove();
                if (finish.equals(current)) {
                    return jumps;
                }
                Collection<Position> neighbors = new HashSet<>(getNeighbors(current));
                neighbors.removeAll(obstacles);
                neighbors.removeAll(visited);
                queue.addAll(neighbors);
                visited.addAll(neighbors);
            }
            jumps++;
        }
        throw new RuntimeException("Unreachable goal");
    }
 
 
    private static List<Position> getNeighbors(Position parent) {
        /* See above… */
    }
 
    public static class Position {
        private long x;
        private long y;
        /* Constructor, getters, equals, hashCode, etc… */
    } 
}
