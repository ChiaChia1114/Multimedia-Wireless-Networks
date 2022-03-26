clear all;
close all;
format long;

double Ns1[11];
double Nc1[11];
double Ns2[11];
double Nc2[11];

n1 = 3;
n2 = 14;
counter = 11;

for i=1 : counter
  m = n1 * i;
  Ns1(i) = (m * exp(-1 * i)) / n1;
  Nc1(i) = (n1 - m * exp(-1 * m / n1) - n1 * exp(-1 * m / n1)) / n1;
  
  m = n2 * i;
  Ns2(i) = (m * exp(-1 * i)) / n2;
  Nc2(i) = (n2 - m * exp(-1 * m / n2) - n2 * exp(-1 * m / n2)) / n2;
  
  printf("%i, ", i);
  printf("%f, ", Ns1(i));
  printf("%f \n", Nc1(i));
  
  printf("%i, ", i);
  printf("%f, ", Ns2(i));
  printf("%f \n", Nc2(i));
  
  ++i;
end

hold on;

x1 = 1 : 10;
y1 = Ns1(x1);
y2 = Nc1(x1);
y3 = Ns2(x1);
y4 = Nc2(x1);

plot(x1,y1,"-*-",x1,y2,"-o-");
plot(x1,y3,"--");
plot(x1,y4,':');

xlabel('M/N');
ylabel('RAOs/N');

legend('N=3 NC,1/N Analytical Model',...
       'N=3 NS,1/N Analytical Model',...
       'N=14 NC,1/N Analytical Model',...
       'N=14 NS,1/N Analytical Model');





