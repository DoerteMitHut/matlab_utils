%==========================================================================
        %|>> Testdaten zum plotten. Durch eigenen Kram ersetzen <<|%
%=========================================================================
x = -1:0.1:1;
y1 = polyval([1,0,0],x);
y2 = polyval([0,1,0],x);
%==========================================================================    
%=========================================================================

% Beschriftung der X-Achsen
x_label = "Hier X-Label einfügen";
% Beschriftung der Y-Achsen
y_label = "Hier Y-Label einfügen";

%Eine leere Figure erzeugen und eine Referenz darauf in f speichern
f = figure; 

% ein neues Achsensystem erzeugen, das die Figure f als Parent bekommt und
% die untere X- und linke Y-Achse enthält
ax1 = axes('Parent',f,'XAxisLocation','bottom','YAxisLocation','left','XColor','k','YColor','k');

% ein zweites Achsensystem erstellen, das denselben Parent bekommt, die
% anderen beiden Achsen enthält und als Position die Position des ersten
% Systems übernimmt. Außerdem ist dieses Achsensystem auf 'Color'='none'
% gestellt um zu verhindern, dass die darunterliegende Achse verdeckt wird.
ax2 = axes('Parent',f,'Position',get(ax1,'Position'),'Color','none','XAxisLocation','top','YAxisLocation','right','XColor','k','YColor','k');
%=========================================================================
                    %|>> HIER WIRD GEPLOTTET <<|%
%=========================================================================

% benutze line anstelle von plot um zu plotten. anstelle einer LineSpec
% müssen linienfarbe und -stil einzeln spezifiziert werden. 
line(x,y1,'Parent',ax2,'Color','k','LineStyle','--','Marker','none');
line(x,y2,'Parent',ax2,'Color','k','LineStyle','-','Marker','none');
%=========================================================================
%=========================================================================

%linkaxes verlinkt die X- und Y-Achsen beider Achsensysteme so, dass beide
%simultan verschoben werden, wenn du den Sichtbereich anpasst.
linkaxes([ax1,ax2],'xy');

% unteres X-Label
xlabel(ax1,x_label)
% oberes X-label
xlabel(ax2,x_label)

% linkes Y-Label
ylabel(ax1,y_label)
% rechtes Y-Label
ylabel(ax2,y_label)

% optional für bessere Ablesbarkeit:
grid on %or off