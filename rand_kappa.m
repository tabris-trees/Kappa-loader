function randnumber = rand_kappa(vth, kappa, n)
% Generate the random number which follow the Kappa distribution
% The kappa velocity loader
% inputs are the initial thermal velocity (vth) and the kappa indicie (kp) 
% and the dimension(n) of the velocity data.

mu = 0;
nu = (2*kappa) - 1;

a1 = rand(1,n);
a2 = rand(1,n);
% a1 = 1e-10;

% sigma = sqrt((kappa - 1.5)/(kappa - 0.5)) * vth;
sigma = sqrt((kappa)/(2*kappa - 1)) * vth;
y = sqrt(nu .* (a1.^(-2/nu)-1)).*cos(2*pi.*a2);
randnumber = mu + sigma.*y;

% figure(8);
% scatter(a1,a2,5,randnumber);
% colorbar();

end