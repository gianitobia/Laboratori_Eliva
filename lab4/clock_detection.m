I=imread('faliora.jpg');
level=graythresh(I);
Ibw=1-im2bw(I,level);

Jbw = imerode(Ibw,ones(3,3));
%Jbw = imdilate(Jbw,ones(3,3));
figure;imshow(Jbw);
[H,T,R] = hough(Jbw);
P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
lines = houghlines(Jbw,T,R,P,'FillGap',20,'MinLength',20);
group_lines=zeros(size(lines));
hold on

for k = 1:length(lines)
     xy = [lines(k).point1; lines(k).point2];
     plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
     len(k)=sqrt(sum((lines(k).point1-lines(k).point2).^2));
     
     thetas(k)=lines(k).theta;
end

[x,i]=sort(thetas);
group_lines(1)=0;
group_lines(end)=1;

for k=2:length(x)-1
    if abs(x(1)-x(k))<10
         group_lines(k)=0;
    elseif abs(x(end)-x(k))<10
         group_lines(k)=1;
    end
end


