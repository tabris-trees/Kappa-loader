n = 5000000;
count = 0;
x = zeros(1,n);
xsam = rand_kappa(5, 2, n);
mean_x = mean(xsam);
% x = rand_kappa(1,2,n);
for i = 1:length(xsam)
    if xsam(i) > -20 && xsam(i) < 20
        count = count+1;
        x(count) = xsam(i);
    end
end
x(x==0)=[];
figure(2);
clf;
histogram(x,40);
hold on;

v = linspace(-20,20,10000);
k = 2;
theta = 5;
f = (pi*k*theta^2)^(-1/2).*(gamma(k)/gamma(k-1/2)).*(1+v.^2./(k*theta^2)).^(-(k));
scale = n;
fp = scale*f;
plot(v,fp,'r','LineWidth',2);
title('Kappa distribution');
print(gcf,'4.jpg','-r600','-djpeg');
% figure(3);
% plot(v,f,'r','LineWidth',2);


%%
count2 = 0;
x2 = zeros(1,n);
xsam2 = normrnd(0,theta,1,n);
mean_x_2 = mean(xsam2);
for ii = 1:length(xsam2)
    if xsam2(ii) > -20 && xsam2(ii) < 20
        count2 = count2+1;
        x2(count2) = xsam2(ii);
    end
end
x2(x==0)=[];
figure(10);
clf;
histogram(x2,40);
hold on;

v2 = linspace(-20,20,10000);
f2 = (1/(2*pi*theta^2))^(1/2).*exp(-v2.^2./(2*theta^2));
scale = n;
fp2 = scale*f2;
plot(v2,fp2,'r','LineWidth',2);
title('Maxwellian distribution');
print(gcf,'3.jpg','-r600','-djpeg');

figure(11);
gcf;
plot(v2,fp2,v,fp);
legend('Maxwellian','Kappa');
