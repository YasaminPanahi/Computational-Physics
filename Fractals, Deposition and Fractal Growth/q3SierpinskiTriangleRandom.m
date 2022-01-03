%Sierpinski Triangle with Random Algorithm
clf
hold on
N=50000;
x=zeros(1,N);y=x;
for a=2:N
c=randi([1 3]);    
switch c
    case 1    
        x(a)=0.5*x(a-1);
        y(a)=0.5*y(a-1);
    case 2
        x(a)=0.5*x(a-1)+0.25;
        y(a)=0.5*y(a-1)+sqrt(3)/4;
    case 3
        x(a)=0.5*x(a-1)+0.5;
        y(a)=0.5*y(a-1);
    end
end
plot(x,y,'.')
axis equal
axis off
%title('Sierpinski Triangle ')
legend(sprintf('N=%d ',N))