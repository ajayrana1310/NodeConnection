public with sharing class CodingChallenge {
    private Map<Integer, List<Integer>> connectionList = new Map<Integer, List<Integer>>();
    private Set<Integer> tobeSearched = new Set<Integer>();
    private Set<Integer> searchedList = new Set<Integer>();
    public void connect(Integer nodeSource, Integer nodeDestination){
        try {
            if(nodeSource >=0 && nodeSource <100 && nodeDestination >=0 && nodeDestination <100){
                if (connectionList.containsKey(nodeSource)) {
                    connectionList.get(nodeSource).add(nodeDestination);
                }
                else {
                    connectionList.put(nodeSource, new List<Integer> {nodeDestination});
                }
    
                // Add connection in reverse direction
                if (connectionList.containsKey(nodeDestination)) {
                    connectionList.get(nodeDestination).add(nodeSource);
                }
                else {
                    connectionList.put(nodeDestination, new List<Integer> {nodeSource});
                }
            }
            else {
                throw new IllegalArgumentException();
            }
        } catch (IllegalArgumentException e) {
            System.debug('Node numbers can only be from 0 to 99');
        }    
    }

    public boolean isConnected(Integer nodeSource, Integer nodeDestination){
        try {
            searchedList.add(nodeSource);
            if (connectionList.containsKey(nodeSource)) {
                // Search destination node from Source Code
                for(Integer i : connectionList.get(nodeSource)){
                    if(nodeDestination == i) {
                        searchedList.clear();
                        tobeSearched.clear();
                        return true;
                    }
                    tobeSearched.add(i); // Add destinations to the list for search later
                }
                // Search destination node from the visited nodes
                if (tobeSearched.size() > 0) {
                    for (Integer j : tobeSearched) {
                        if (!searchedList.contains(j)) {
                            return isConnected(j,nodeDestination);
                        }
                    }
                }
            }
            searchedList.clear();
            tobeSearched.clear();
            return false;
        } catch (Exception e) {
            System.debug('There has been an unexcepted error : ' + e);
            return false;
        }
    }
}