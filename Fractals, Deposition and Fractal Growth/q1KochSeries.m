clc
clear
%Koch Series
%for fist step(simple line)
r1=[0;0];
r2=[1;0];
x = [r1(1,1),r2(1,1)];
y = [r1(2,1),r2(2,1)];
spk0 = subplot(6,1,1);
h=line(x,y);
set(h, 'Color', 'k');
axis([-1.7,2.7,0,0.3]);
axis off
%ploting next 5 steps
for k=1:5
mmax=4^k; %four operations each one is needed for each step, so it is 4^step
x=zeros(1,mmax);y=zeros(1,mmax);segment=zeros(1,mmax); 
h=3^(-k); 
x(1)=0;y(1)=0; 
angle(1)=0;angle(2)=pi/3;angle(3)=-pi/3;angle(4)=0; %all angles needed(basically just +60 and -60)
for a=1:mmax 
         m=a-1;ang=0; 
         for b=1:k 
                 segment(b)=mod(m,4); %determines which operation is needed
                 m=floor(m/4); 
                 r=segment(b)+1; 
                 ang=ang+angle(r); %determines the proper angle for each operation
         end 
         x(a+1)=x(a)+h*cos(ang); %acts as rotation matrix for updating x-axis and y-axis
         y(a+1)=y(a)+h*sin(ang); %and also transfers points by adding the previous coordinates
end 
spk1 = subplot(6,1,k+1); %subplot for showing all the steps in one figure
plot(spk1,x,y,'k'); 
axis equal
axis off
end