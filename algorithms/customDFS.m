function customDFS(v,m)
    n_verts = length(v);
    for i = 1:n_verts
        if(sum(m(i,:))>=3)
            fprintf("starting DFS on vertex %d",i)
            my_dfs(v,m,i);
        end
    end
end