clear all;
close all;
format long;

double K[11];
double Ns[11];
double Ps;
double result[40];

counter = 11;
m = 100;

for n = 5 : 45
  sum = 0;
  for i=1:counter
    if i==1
      K(i) = m;
    else 
      K(i) = K(i-1) * ( 1 - exp( -K(i-1) / n ) );
    endif
    Ns(i) = K(i) * exp( -K(i) / n );
    sum = sum + Ns(i);
    ++i;
  end
  Ps = sum / m;
  printf("%i, ", n);
  printf("%f \n", Ps);
  result(n - 4) = Ps;
  n = n + 1;
end
hold on;

x = 5 : 45;
y = result(x-4);

plot(x,y,"-*-");

xlabel('N');
ylabel('Access Success Probability');





