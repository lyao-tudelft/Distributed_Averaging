error = load('ranPathAve_39x19_w1to5_err.mat');

figure
% plot(error.err);
loglog(error.err);
title('Randomized Path Averaging on Grid Graph ( 39x19 )');
xlabel('Number of Rounds');
ylabel('Error');
grid on;
axis([0,10^5,-inf,inf]);