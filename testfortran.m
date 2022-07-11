clc;
data = importdata("velocity.txt");
%% Likehua version
n = 500000;
c = data(:,1).^2+data(:,2).^2+data(:,3).^2;

% figure(1);
% clf;
% scatter3(data(:,1),data(:,2),data(:,3),1,c);
% colorbar;

figure(3);
clf;
subplot(1,2,1);
count = 0;
x = zeros(1,n);
xsam = data(:,1);
mean_x = mean(xsam);
for i = 1:length(xsam)
    if xsam(i) > -5 && xsam(i) < 5
        count = count+1;
        x(count) = xsam(i);
    end
end
x(x==0)=[];
histogram(x,40);
histogram(x,40);


%% student t distribution version
rn = rand_kappa3(1,2,n,3);
c2 = rn(1,:).^2+rn(2,:).^2+rn(3,:).^2;

% figure(2);
% clf;
% scatter3(rn(1,:),rn(2,:),rn(3,:),1,c2);
% colorbar;
% caxis([0 65]);

figure(3);
subplot(1,2,2);
count = 0;
x = zeros(1,n);
xsam = rn(1,:);
for i = 1:length(xsam)
    if xsam(i) > -5 && xsam(i) < 5
        count = count+1;
        x(count) = xsam(i);
    end
end
x(x==0)=[];
histogram(x,40);