%veri setini tükleyelim.
data = load('C:\Users\ASUS\Desktop\DataSetOdv\dataset.txt');
X = data(:, [1,2]);    
%örnek puanı.
y = data(:, 3);      
%örnek sıfır  veya bir.

plotData(X,y);

xlabel('Soru skoru 1');
ylabel('Soru skoru 2');

legend('Kabul', 'Ret');

[m, n]= size(X);
X = [ones(m, 1) X];    
%x'e müdahale terimi ekler.

%uydurma parametrelerini başlatmak için.
initial_theta = zeros(n +1, 1);

%maliyet ve gradyan hesaplamak için.
[cost, grad] = costFuction(initial_theta, X, y);

fprintf('İlk tetadaki maliyet (sıfırlar): %f\n', cost);
disp('İlk tetadaki gradyan (sıfırlar)):'); disp(grad);

%fminunc için seçeneği ayarlamak için.
options = options(@fminunc, 'Algorithm', 'Quasi-Newton', 'GradOnj', 'on', 'MaxIter', 400);

%optimal teta'yı elde etmek için fminunc çalıştırmak için.
[theta,cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

plotDecisionBoundary(theta, X, y);
hold on;
xlabel('Soru skoru 1');
ylabel('Soru skoru 2');
legend('Kabul','Ret');
hold off;

%45 ve 85 puan alan bir öğrencinin olasılığını tahmin etmek için.
prob = sigmoid([1 45 85] * theta);
fprintf('45 ve 85 puanları olan bir öğrenci için kabul olasılığını tahmin ediyoruz %f\n\n', prob);

%eğitim setimizde hesaplamak için.
p = predict(theta, X);
fprintf('Eğitim Doğruluğu: %f\n', mean(double(p == y)) * 100);
