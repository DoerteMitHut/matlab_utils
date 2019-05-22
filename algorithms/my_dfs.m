function [m,v] = my_dfs(v,m,i)
    v(i).visited = true;
    plotGraph(v,m);
    waitforbuttonpress;
    for j = 1:length(v)
        if(m(i,j))
            if(~v(j).visited)
                v(j).pred = i;
                [m,v] = my_dfs(v,m,j);
            end
        end
    end
end