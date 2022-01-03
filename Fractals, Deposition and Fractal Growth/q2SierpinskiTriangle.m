clc
clear
%sierpinskitriangle
step=8;
sierpinskitriangle(step);
function sierpinskitriangle(step)

    %Parameters
    L = 10; side = L;
    step = step - 1;
    %Initialization
    sop_x = [0, L/2, L];
    sop_y = [0, sqrt(3*(L^2)/4), 0];
    fill(sop_x, sop_y, 'k'); hold on; axis square; ylim([0,10]);
    title(['Sierpinski Triangle']);
    clear('sop_x','sop_y');
    if(step > -1)
        side = side/2;
        step0_x = [side/2,side,3*side/2];
        step0_y = [sqrt(3*(side^2)/4), 0, sqrt(3*(side^2)/4)];
        fill(step0_x, step0_y, 'w'); hold on;
        % Initialization of cells that will contain the triangles coordinates
        coor{1,1} = step0_x; 
        coor{2,1} = step0_y; 
        % Next iterations
        for i = 1:1:step
            temp = {};
            side = side/2;
            for n = 1:1:size(coor,2)
                h = sqrt(3*(side^2)/4);
                % Relative right triangle
                x_r = [coor{1,n}(2)+side/2 coor{1,n}(2)+side coor{1,n}(2)+3*side/2];
                y_r = [coor{2,n}(2)+h coor{2,n}(2) coor{2,n}(2)+h];
                fill(x_r, y_r, 'w'); hold on;
                % Relative above triangle
                x_u = [coor{1,n}(1)+side/2 coor{1,n}(1)+side coor{1,n}(1)+3*side/2];
                y_u = [coor{2,n}(1)+h coor{2,n}(1) coor{2,n}(1)+h];
                fill(x_u, y_u, 'w'); hold on;
                % Relative left triangle
                x_l = [coor{1,n}(2)-3*side/2 coor{1,n}(2)-side coor{1,n}(2)-side/2];
                y_l = [coor{2,n}(2)+h coor{2,n}(2) coor{2,n}(2)+h];
                fill(x_l, y_l, 'w'); hold on;
                % New triangles coordinates storage
                l = size(temp,2);
                temp{1,l+1} = x_r; temp{2,l+1} = y_r;
                temp{1,l+2} = x_u; temp{2,l+2} = y_u;
                temp{1,l+3} = x_l; temp{2,l+3} = y_l;
            end
            % Cleaning up temporal cells
            coor = temp;
            clear('temp');
        end
        hold off; 
    end
    axis equal
    axis off;
end