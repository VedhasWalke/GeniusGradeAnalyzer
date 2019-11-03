clc

#Temporary values(delete this section during combination)
  x_values = [1;2;3;4;5];
  grades_matrix = [100;50;25;10;5];
  yintercept_vector=[110, 110, 110, 110];
  slope_vector = [-25, -12.5, -5, -2.5];


x_values = [1;2;3;4;5];
  grades_matrix = [100;90;80;70;60];


x_values_legnth = size (x_values, 1);

a = yintercept_vector(1);





if(slope_vector(1)>0)
  b = ((grades_matrix(1))/yintercept_vector(1))-1;
  
  
  for (x = 1:x_values_legnth)
exponential_regression_vector(x) = a*(1+b)^x;
endfor
plot(x_values, exponential_regression_vector, "or", x_values, grades_matrix)
  
  
  
else
  b = 1-(grades_matrix(1))/(yintercept_vector(1));
  for (x = 1:x_values_legnth)
exponential_regression_vector(x) = a*(1-b)^x;
endfor
plot(x_values, exponential_regression_vector, "or", x_values, grades_matrix)
endif




#Calculating the Exponential Cost
J_two = 0;
for (i = 1:x_values_legnth)
  J_two = J_two+abs((grades_matrix(i))-(exponential_regression_vector(i)));
  
endfor