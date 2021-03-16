
package com;

public class Solution{
    static class Graph {
        int vertex;
        int[][] adj;

        public Graph(int V) {
            this.vertex=V;
            adj=new int[V][V];
        }

        public void AddEdge(int u, int v, int w) {

            adj[u][v]=w;
        }

        public void printgraph() {
            for(int i=0; i<vertex; i++) {
                for(int j=0; j<vertex; j++) {

                    if(adj[i][j]!=0) {
                        System.out.println("Vertex - " + i + " is connected to " + j + " with weight " + adj[i][j]);
                    }

                }

            }

        }

        public void print(int[] arr, int source) {

            for(int k=0; k<arr.length; k++) {
                System.out.println("Source" + " " +  source + " to" + " " + k + " is " + arr[k]);
            }
        }

        int find(boolean[] visit, int[] key) {
            int min=Integer.MAX_VALUE;
            int val=-1;

            for(int i=1; i<vertex; i++) {
                if(!visit[i] && min>=key[i]) {
                    min=key[i];
                    val=i;
                }
            }
            return val;
        }

        public void get(int s) {
            boolean[] visited= new boolean[vertex];
            int[] dist = new int[vertex];

            for(int i=1; i<vertex; i++) {
                dist[i]=Integer.MAX_VALUE;
//                visited[i]=false;
            }

            dist[s]=0;

            for(int i=1; i<vertex; i++) {
                int t = find(visited, dist);
                visited[t] = true;

                for (int l = 1; l <vertex; l++) {
                    if (adj[t][l] > 0) {
                        if (!visited[l] && adj[t][l] != Integer.MAX_VALUE) {
                            int num= adj[t][l] +dist[t];
                            if(num<dist[l]) {
                                dist[l]=num;
                            }

                        }
                    }
                }
            }
            print(dist,s);
        }
    }

    public static void main(String[] args) throws Exception {
        Graph graph = new Graph(5);

        graph.AddEdge(0,2,3);
        graph.AddEdge(1,2,6);
        graph.AddEdge(2,3,5);
        graph.AddEdge(4,2,1);
        graph.AddEdge(3,4,4);

        graph.printgraph();

    }
}
