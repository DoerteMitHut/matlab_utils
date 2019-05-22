function plotGraph(v,m)
%%plots graphs, duh
clf
hold on
n_verts = length(v)
for i = 1:n_verts
    for j = 1:i
        if(m(i,j))
            plot([v(i).x,v(j).x],[v(i).y,v(j).y],'r-');
        end
    end
end
for vert = v
    if (vert.visited)
        c = 'g';
    else
        c = 'b';
    end
    plot(vert.x,vert.y,'o','MarkerSize',15,'MarkerFaceColor',c,'MarkerEdgeColor','k');
end

hold off
end