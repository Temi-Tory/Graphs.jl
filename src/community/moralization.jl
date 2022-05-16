"""
  For a given directed graph G, return the moralized graph  
 
  A moral graph is an undirected graph H = (V, E) generated from a
    directed Graph G. 
  In H, all egdes lose their directions and additional edges are added between any two nodes that share a common child.

  see: https://en.wikipedia.org/wiki/Moral_graph

"""
function moral_graph(G::AbstractGraph)
    H = Graph(G)    #Convert directed Graphs to undirected 
    for node in 1:nv(G)
        predecessors_combinations = subsets(inneighbors(G,node), Val{2}())
        for preds in predecessors_combinations
            add_edge!(H,preds) #Add edge between any two parents that have a common child
        end
    end
    return H    
end
