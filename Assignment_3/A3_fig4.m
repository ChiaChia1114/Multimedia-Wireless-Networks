clear all;
close all;
format long;

double K[11];
double Ns[11]
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
      K(i) = K(i-1) * ( 1 - exp( -1.0 * K(i-1) / n ) );
    endif
    Ns(i) = K(i) * exp( -1.0 * K(i) / n );
    num = num + i * Ns(i);
    denum = denum + Ns(i);
    ++i;
  end
  Ta = num / denum;
  printf("%i, ", n);
  printf("%f \n", Ta);
  result(n-4) = Ta;
  n = n + 1;
end

hold on;

x = 5 : 45;
y = result(x-4);

plot(x,y,"-*-");
ylim([0 10]);

xlabel('N');
ylabel('Mean Access Delay (unit:Access Cycle)');

legend('Derived Performance Metric, Eq.(9)');


