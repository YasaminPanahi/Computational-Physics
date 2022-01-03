function GamaOfLife

clear
close all
clc

% grid size
x = 6;
y = 6;

% initial table (make initial table determining live cells at t=0
Table = zeros(x,y);
idx1 = 9; Table(idx1) = 1; idx2 = 14; Table(idx2) = 1; idx3 = 23; Table(idx3) = 1;
idx4 = 20; Table(idx4) = 1; idx5 = 27; Table(idx5) = 1;idx6 = 16; Table(idx6) = 1;
idx7 = 28; Table(idx7) = 1;
ShowTable(Table);

% rules
while (1)
    % next generation
    TableNew = FindNeighbour_apdate(Table);
    % update
    Table = TableNew;
    % display
    ShowTable(Table);
end

end

function TNew = FindNeighbour_apdate(Table)
% periodic boundary pondition
t_NEXT = zeros(size(Table)+2);
t_NEXT(2:end-1, 2:end-1) = Table;
t_NEXT(1, 2:end-1) = Table(end, :);
t_NEXT(end, 2:end-1) = Table(1, :);
t_NEXT(2:end-1, 1) = Table(:, end);
t_NEXT(2:end-1, end) = Table(:, 1);
% four corners
t_NEXT(1, 1) = Table(end, end);
t_NEXT(1, end) = Table(end, 1);
t_NEXT(end, 1) = Table(1, end);
t_NEXT(end, end) = Table(1, 1);
[x,y] = size(Table);
TNew = zeros(size(Table));

% update loop
n = 0;
for j = 2:y+1
    for i = 2:x+1
        n = n + 1;
        count = sum(sum(t_NEXT(i-1:i+1, j-1:j+1))) - Table(n);
        
        % rule 1: any live cell with fewer than two live neighbours dies.
        if (Table(n) == 1) && (count < 2)
            TNew(n) = 0;
        end
        
        % rule 2: any live cell with two or three live neighbours remains alive to the next generation.
        if (Table(n) == 1) && ((count == 2) || (count == 3));
            TNew(n) = 1;
        end
        
        % rule 3: any live cell with more than three live neighbours dies.
        if (Table(n) == 1) && (count > 3);
            TNew(n) = 0;
        end
        % rule 4: any dead cell with exactly three live neighbours becomes a live cell.
        if (Table(n) == 0) && (count == 3);
            TNew(n) = 1;
        end
    end
end

end

function ShowTable(Table)
%displays game of life table at each generation update 
imagesc(Table); caxis([0 1]);
t=title('Loaf','Color','black');
t.FontSize = 12;
t.FontAngle = 'italic';
colormap(flipud(gray)); axis off; axis equal;
pause(3); drawnow
end



