rn = rand_kappa3(1,2,500000,3);
c = rn(1,:).^2+rn(2,:).^2+rn(3,:).^2;

figure(1);
clf;
scatter3(rn(1,:),rn(2,:),rn(3,:),1,c);
colorbar;