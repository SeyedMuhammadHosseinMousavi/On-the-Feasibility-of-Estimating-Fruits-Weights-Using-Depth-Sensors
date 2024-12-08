clear;

a=[59,58,55,100,65,75,70,72,73,89,91,99,68,53,101,103,55,55.8,63,67,61,75.8,74.3,70,...
    71.9,71.2,73.8,85.9,81.1,87.5,90.3,90,65.5,78.6,79.8,74.6,75.5,74.8,78,76,76.9,73.2,...
    81.3,85.6,89.7,84.7,86.9,68.7,65.9,65.2];

sizea=size (a); sizea=sizea(1,2);

for i=1:sizea
if rand <0.5
b(i)=a(i)+rand+(1 + (9)*rand);
else
b(i)=a(i)-rand-(1 + (9)*rand);
end;
end;

for j=1:50
numbera(j)=j;
end;

scatter(numbera,a,20,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[1 0 0],...
              'LineWidth',1.5)
hold on;
scatter(numbera,b,20,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 0 1],...
              'LineWidth',1.5)