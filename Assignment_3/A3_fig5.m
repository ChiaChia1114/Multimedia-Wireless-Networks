clear all;
close all;
format long;

double K[11];
double Ns[11];
double Nc[11];
double result[40];

counter = 11;
m = 100;

for n =5 : 45
  num = 0;
  denum = 0;
  for i = 1 : counter
    if i == 1
      K(i) = m;
    else
      K(i) = K(i-1) * ( 1 - exp( -K(i-1) / n ) );
    endif
    Ns(i) = K(i) * exp( -K(i) / n );
    Nc(i) = n - Ns(i) - n * exp(-K(i) / n);
    num = num + Nc(i);
    denum = denum + n;
    i++;
  end
  Pc = num / denum;
  printf("%i, ", n);
  printf("%f \n", Pc);
  result(n - 4) = Pc;
  n = n + 1;
end

hold on;

x = 5 : 45;
y = result(x-4);

plot(x,y,"-*-");
ylim([0 1]);
xlabel('N');
ylabel('Collision Probability');
legend('Derived Performance Metric, Eq.(10)');
