function plotData(X,y)

figure; hold on;

pos = find(y==1); %olası örnekler.
neg = find(y==0); %olumsuz örnekler.

plot(X(pos,1), X(pos ,2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(neg,1), X(neg, 2), 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 7);

hold off;

end

 