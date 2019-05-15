clear all
close all
clc
r=6015.8*10;
e=2.58;
rsoi=616277.3;
mu=324900;
theta=0:pi/100:2*pi;
a1=r*cos(theta);
b1=r*sin(theta);
a2=rsoi*cos(theta);
b2=rsoi*sin(theta);
rp=r+30000;
p=rp*(1+e);
ni1=-105:1:-80;
ni2=-80:10:-50;
ni3=-50:5:5;
ni4=5:5:50;
ni5=50:10:80;
ni6=80:1:105;
ni= [ni1,ni2,ni3,ni4,ni5,ni6];
ni=ni*pi/180;
for i=1:length(ni)
    z=1+e*cos(ni(i));
r1=p/z;
x(i)=r1*cos(ni(i));
y(i)=r1*sin(ni(i));
p1=6315.8*(1+e);
epsilon=(mu/(2*p1))*(e^2-1);
r2=p1./z;
g(i)=mu./r2;
v(i)=sqrt(2*(epsilon+g(i)));
end  
plot(a1,b1,'r-',a2,b2,'b-',x,y,'g-','linewidth',2);
axis equal
hold on
plot1= scatter(x(1),y(1),100,'k','.');
for i=2:length(v)
    plot1.XData = x(i);
    plot1.YData = y(i);
    pause (v(i)/300)
end
