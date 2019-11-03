clc
#Temporary values(delete this section during combination)
 # x_values = [1;2;3;4;5;6;7;8;9;10;11;12;13;14;15];
 # grades_matrix = [100;0;95;96;97;80;100;70;66;50;56;25;15;50;5];
  
  x_values = [1;2;3;4;5];
  grades_matrix = [100;90;80;70;60];
 
#Slopes vector
x_values_legnth = size (x_values, 1);
slopes_vector = zeros(x_values_legnth-1, 1);
yintercept_vector = slopes_vector;

for (i = 1:(x_values_legnth-1))
    j = i+1;
    temp_slope = (grades_matrix(j)-grades_matrix(i))/(x_values(j)-x_values(i));
    slopes_vector(i) = temp_slope;
endfor

best_slope = 0;

#Finding avg slope
for(i = 1:x_values_legnth-1)
best_slope = best_slope + slopes_vector(i);
endfor
best_slope = best_slope/(x_values_legnth-1);


#Finding y-intercept vector
for (i = 1:x_values_legnth-1)
    yintercept_vector(i) = grades_matrix(i)-(slopes_vector(i)*x_values(i));
endfor

#Finding avg y-intercept 
best_yintercept=0;
for(i = 1:(x_values_legnth-1))
best_yintercept = best_yintercept + yintercept_vector(i);
endfor
best_yintercept = best_yintercept/(x_values_legnth-1);

#Plotting the Line of Best Fit

for(i = 1:x_values_legnth+2)
linear_regression_vector(i) = best_yintercept+best_slope*i;
endfor


plot (x_values, grades_matrix, "or", linear_regression_vector)


#Calculating Cost
J_one = 0;
for (i = 1:x_values_legnth)
  J_one = J_one+abs((grades_matrix(i))-(linear_regression_vector(i)));
  
endfor