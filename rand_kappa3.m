function X = rand_kappa3(vth, kappa, n, dim, v0)
% Generate the random number which follow the 3-D Kappa distribution
% The kappa velocity loader
% inputs are the initial thermal velocity (vth), the kappa indicie (kp),
% the dimension(n) of the velocity data
% the dimension(dim) of your velocity space
% and the mean velocity(v0) vector

mu = v0;
nu = (2*kappa) - 1; % the freedom degree of student t distribution

sigma = sqrt(kappa/(2*kappa-1))*vth; % scaling parameter

Z = zeros(dim,n);
X = zeros(dim,n);
Chi_square = chi2rnd(nu,1,n); % generate the Chi-squared distribution random number

for i = 1:dim
    Z(i,:) = normrnd(mu(i),1,1,n); % three-dimensional standard normal distribution 
    % to be constructed, but the "vth" maybe some problem?
    X(i,:) = mu(i) + sigma*sqrt((nu./Chi_square)).*Z(i,:); % compute the 
    % student t distribution(Kappa distribution) with Chi-squared
    % distribution and standard normal distribution
end
end

