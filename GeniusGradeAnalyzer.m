clc
clear all

#setting some variables
error_count = 0;
days_left = 0;
days_past = 0;
assignments_left = 0;
assignments_past = 0;


disp ("This is the GeniusGradeAnalyzer, which will help you predict and improve your grades using complex statistics. Please enter the following information. If you are not sure, then provide your best guess. ")


###################################################################################
#Data Inputing Section


condition =1;
while(condition==1)
subject_num = input ("\nHow many subjects are you taking this marking period?: ");
if (subject_num == 0)
  disp("This information is unavoidable!")
  condition = 1;
else
  condition =0;
endif
endwhile


 
 
 i = 1;
while (i == 1)

 days_left = input ("How many days are in a marking period: ");  
 
 
if (days_left == 0)
  days_left = 0;
  error_count++;
 endif


 
days_past = input ("How many days have past in the marking period: ");


if (days_past == 0)
 
  days_past = 0;
  error_count++;
endif
 

days_left = days_left - days_past;

assignments_past = input ("How many assignments have you completed?: ");
  
  j = 0;
  while (j == 0)
    
    
    
  j = 1;
  if (assignments_past == 100000)
    disp("You have omitted a significant field. This information is nessacery for proper operation. Please retry." )
    j = 0;
   else
    1;
  endif
endwhile
  
assignments_left = input ("How many assignments do you have left?: ");



if (assignments_left == 0)
  assignments_left = 0;
  error_count++;
else
  1;
endif
 
 
disp("Number of Days Past: "), disp( days_past)
disp("Number of Days Left: "), disp(days_left)
disp("Number of Assignments Done: "), disp(assignments_past)
disp("Number of Assignments Left: "), disp(assignments_left)
char confirmation;
confirmation = input ("Please confirm that the above information is correct 1/0: ") ;


if (confirmation == 1)
  i = 0;
else
  i = 1;
endif
endwhile

if (error_count > 3)
  selection = input ("You have entered a lot of missing fields. This may result in inacurate staistical average. Continue or restart? c/r: ")
  if (selection == "r")
    i = 1;
  elseif (selection == "c")
    i = 0;
endif
endif

condition = input ("Would you like to answer some questions about you to increase the accuracy of the predictions? 1/0: ");

questions_array = ones(1,5);

if (condition == 1)
questions_array(1) = input("Do you study a little every day, and stay on top of assignments. In essense, do you make sure not to procrastinate? 0/1: "); 
questions_array(2) = input("Do you make sure to avoid distractions when studying? 0/1: ");
questions_array(3) = input("Do you enjoy this class? 0/1: ");
questions_array(4) = input("Do you show enthusiam for the subject in class by asking questions? 0/1: ");
questions_array(5) = input("Do you collaborate with classmates to acheive success together? 0/1: ");

endif


#aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
#grades_matrix = [100, 99, 100, 98, 60, 99, 95, 94, 91, 95, 90, 0, 89, 70, 89, 88, 100 ,87, 86, 87, 90, 85, 79, 84, 67, 83, 82, 81, 90, 80];
#grades_matrix = [2, 4, 8, 16, 32, 64, 100];
#aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

grades_matrix = zeros(assignments_past, 1);
x_values = 1:assignments_past;
disp("")
disp("Now enter the grades that you have gotten when prompted, and only enter one grade per prompt. ")

#aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
count =1;
while (assignments_past >= count)
  grades_matrix(count,1) = input("Enter grade: " );
  count++;
endwhile

disp ("The grades are"), disp(grades_matrix)
input('(press enter key to continue)');




###################################################################
#Data Analysis Section

clc
disp("")
disp("Statistical Analysis: ")

x_values_legnth = size (x_values, 2);
#Mean
sum =0;
mean = 0;
for(i = x_values)
sum = sum + grades_matrix(i);
endfor
mean = sum/x_values_legnth;
disp ("Your class average is")
disp (mean)


#Standard Deviation
summation =0;
for (i = x_values)
  summation = summation +(grades_matrix(i)-mean)^2;
endfor
grades_matrix_legnth = size(grades_matrix, 1);
standard_deviation = sqrt(summation/(grades_matrix_legnth-1));
disp("The Standard Deviation is"), disp(standard_deviation), disp("This tells how constant your grades have been")

input('(press enter key to continue)');

clc
disp("\nTechnical Analysis: ")
#################################################################

#Slopes vector
x_values_legnth = size (x_values, 2);
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

for(i = 1:x_values_legnth+assignments_left)
linear_regression_vector(i) = best_yintercept+best_slope*i;
endfor


figure(1);
  plot (x_values, grades_matrix, "or", linear_regression_vector)


#Calculating Cost
J_one = 0;
for (i = 1:x_values_legnth)
  J_one = J_one+abs((grades_matrix(i))-(linear_regression_vector(i)));
  
endfor


##################################################################################

x_values_legnth = size (x_values, 2);

a = yintercept_vector(1);




#growth
if(slopes_vector(1)>0)
  select2 = 1;
  b = ((grades_matrix(1))/yintercept_vector(1))-1;

  for (x = 1:x_values_legnth)
exponential_regression_vector(x) = a*(1+b)^x;
endfor
figure(2);
  plot(x_values, exponential_regression_vector, "or", x_values, grades_matrix)
  
  
#decay
else
  select2 = 0;
  b = 1-(grades_matrix(1))/(yintercept_vector(1));
  for (x = 1:x_values_legnth)
exponential_regression_vector(x) = a*(1-b)^x;
endfor
figure(3);
  plot(x_values, exponential_regression_vector, "og", x_values, grades_matrix)
endif




#Calculating the Exponential Cost
J_two = 0;
for (i = 1:x_values_legnth)
  J_two = J_two+abs((grades_matrix(i))-(exponential_regression_vector(i)));
  
endfor


####################################################################################
#Comparison
if (J_one >= J_two)
  disp("We will use the exponential model, because it fits the data relatively well.")
  disp(exponential_regression_vector)
  select = 0;
figure(4);
#this is the start
  plot(x_values, exponential_regression_vector)
else
  disp("We will use the linear model, because it fits the data relatively well.")
  select = 1; 
  disp(linear_regression_vector)  
  figure(5);
  plot(linear_regression_vector)
endif

input('(press enter key to continue)');

clc


disp("The following are your predicted grades after the remaining asignments are submitted")
#linear regression prediction
if select == 1

for(i= 1:assignments_left)
  prediction = best_slope*(i+assignments_past)+best_yintercept
endfor




#exponential growth regression prediction  
elseif (select == 0 && select2 == 1)
  for(i = 1:assignments_left)
  prediction = a*(1+b)^(i+assignments_past);
  disp("prediction")
  endfor
  
  
  #exponential decay regression prediction  
else
  for(i = 1:assignments_left)
  prediction = a*(1-b)^(i+assignments_past);
  disp("prediction")
  endfor
endif


clc
disp("\nArbitrage Analysis: ")
if (best_slope <0)
  disp("\nYou are on a negative trend. Fix your behaviors using the suggestions below.")
elseif(best_slope > 0)
 disp("\nYou are on a positive trend! Keep up the good work, and your grades will gradually improve. If you are extra ambitous, use the following suggestions to speed up your progress.")
else
 disp("\nYou have a constant rate of change in regards to your grade. You can improve by using the following suggestions.")
endif

input('(press enter key to continue)');

#########
if (questions_array(1)==0)
  disp("\nTry distributing school work over time instead of procrastinating and cramming.")
endif

if (questions_array(2)==0)
  disp("\nReduce distractions that are available to you during study. This includes social media and tv.")
endif

if (questions_array(3)==0)
  disp("\nMost classes become more enjoyable when you actually understand the concepts. Try to truly comprehend the lessons of your course.")
endif

if (questions_array(4)==0)
  disp("\nMake a goal to ask at least 4 questions every class.")
endif

if (questions_array(5)==0)
  disp("\nYour classmates offer a different perspective on the same problem. This may happen to be a better method of solving the problem.")
endif 