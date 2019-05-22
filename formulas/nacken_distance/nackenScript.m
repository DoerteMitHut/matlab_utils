clear
clc
clf

l1 = rand(30,4);
l2 = [0,0,1,0.5];

t = colormap;

n = nacken(l1,l2,20*(pi/180),0.5,0.1,true);

plot([l2(1),l2(3)],[l2(2),l2(4)],'k-.')
hold on

for i = 1:length(n)
plot([l1(i,1),l1(i,3)],[l1(i,2),l1(i,4)],'Color',t(n(i)+1,:))
end
hold off