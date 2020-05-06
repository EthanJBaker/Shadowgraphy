%Depth of focus was measured through experiment. Object diameters are written on the circular resolution target
diameters = [0.0625, 0.125, 0.25, 0.5, 1]; %mm
depths = [ 70, 80, 80, 90, 80]; %in/1000
figure; plot(diameters, depths); %plot the graph, title it and label the axes
title('Depth of Focus v. Object Diameter');
ylim([0 100]); xlim([0 1]);
xlabel('Object Diameter (mm)');
ylabel('Depth of Focus (in/1000)');
