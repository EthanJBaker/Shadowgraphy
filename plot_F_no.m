%Values for F# and distance are taken from the Questar QM1 manufacturer's
%website. 
distances = [56, 70, 102, 140]; %cm
F_no = [8.7, 10, 12.9, 16.8];
hold on 
plot(distances, F_no);
title('F Number vs. Object Distance');
xlabel('Object Distance (cm)');
ylabel('F Number');
