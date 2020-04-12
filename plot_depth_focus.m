%Depth of focus and distances were measured through experiment.
distances = [0.0625, 0.125, 0.25, 0.5, 1];
depths = [ 70, 80, 80, 90, 80];
figure; 
plot(distances, depths);
title('Depth of Focus v. Object Diameter');
ylim([0 100]); xlim([0 1]);
xlabel('Object Diameter (mm)');
ylabel('Depth of Focus (in/1000)');
