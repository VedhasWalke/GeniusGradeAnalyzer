#setting some variables
error_count = 0;
days_left = 0;
days_past = 0;
assignments_left = 0;
assignments_past = 0;


disp ("This is the GeniusGradeAnalyzer, which will help you predict and improve your grades using complex statistics. Please enter the following information, if you have it. If not, then just enter 0. ")


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

if (condition == 1)
questions_array(1) = input("Do you study a little every day, and stay on top of assignments. In essense, do you make sure not to procrastinate? 0/1: "); 
questions_array(2) = input("Do you have available distractions when studying? 0/1: ");
questions_array(3) = input("Do you enjoy this class? 0/1: ");
questions_array(4) = input("Do you show enthusiam for the subject in class by asking questions? 0/1: ");
questions_array(5) = input("Do you collaborate with classmates to acheive success together? 0/1: ");

endif








grades_matrix = zeros(assignments_past, 1);
x_values = 1:assignments_past;
disp("")
disp("Now enter the grades that you have gotten when prompted, and only enter one grade per prompt. ")

count =1;
while (assignments_past >= count)
  grades_matrix(count,1) = input("Enter grade: " );
  count++;
endwhile

disp(grades_matrix)
plot (x_values, grades_matrix)



###################################################################
#Data Analysis Section


disp("")
disp("Statistical Analysis: ")

#Mean
sum =0;
mean = 0;
for(i = x_values)
sum = sum + grades_matrix(i);
endfor
mean = sum/x_values_legnth;
disp ("The mean is "), disp (mean)


#Standard Deviation
#summation =0;
#for (i = x_values)
#summation = summation +(grades_matrix(i)-mean)^2
#endfor

#for (1:summation)

disp("Technical Analysis: ")

##Linear regression, formula 1
x_values_legnth = size (x_values, 2);
slopes_vector = zeros(x_values-1, 1);
yintercept_vector = zeros(x_values-1, 1);

#Finding slope vector
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
best_slope2 = best_slope/(x_values_legnth);

#Finding y-intercept vector
for (i = 1:(x_values_legnth-1))
    j = i+1;
    temp_yintercept = grades_matrix(i)-(slopes_vector(i)*(i));
     yintercept_vector(i) = temp_yintercept;
endfor
best_yintercept=0;
#Finding avg y-intercept
for(i = 1:(x_values_legnth-1))
best_yintercept = best_yintercept + yintercept_vector(i);
endfor
best_slope = best_slope/(x_values_legnth-1);

disp(best_slope), disp (best_yintercept)

for(i = 1:x_values_legnth)
linear_regression_vector = best_yintercept+best_slope*i;

endfor

#Cost function for linear regression formula 1
J_one = 0;
for (i = 1:x_values_legnth)
  J_one = J_one+((grades_matrix(i))-(linear_regression_vector));

endfor



##Exponential Regression, Formula 2

x_values_legnth = size (x_values, 2);
slopes_vector = zeros(x_values-1, 1);
yintercept_vector = zeros(x_values-1, 1);

if grades_matrix(1)!=0
a = grades_matrix(1);
elseif grades_matrix(1) !=0 
a = grades_matrix(2);
else 
a = grades_matrix(3);
endif

if (a>0)
  b = sqrt(grades_matrix(1)/a)-1;
  
else
  b = 1-sqrt(grades_matrix(1)/a);
endif

for (x = 1:x_values_legnth)
exponential_regression_vector(x) = a*x^b;
endfor
  
#Cost function for linear regression formula 2
J_two = 0;
for (i = 1:x_values_legnth)
cost = grades_matrix(i) - exponential_regression_vector(i);
J_two = J_two + cost;

endfor


#Comparison
if (J_one >= J_two)
  disp("We will use the exponential model, because it fits the data relatively well.")
  disp(exponential_regression_vector)
  plot(x_values, exponential_regression_vector)
else
  disp("We will use the linear model, because it fits the data relatively well.")
  plot(x_values, linear_regression_vector)
endif

disp("\nArbitrage Analysis: ")
if (a <0)
  disp("\nYou are on a negative trend. Fix your behaviors using the suggestions below.")
elseif
 disp("\nYou are on a positive trend! Keep up the good work, and your grades will gradually improve. If you are extra ambitous, use the following suggestions to speed up your progress.")
else
 disp("\nYou have a constant rate of change in regards to your grade. You can improve by using the following suggestions.")
endif

if (questions_array(1)==0)
  disp("Try distributing school work over time instead of procrastinating and cramming.")
endif

if (questions_array(2)==0)
  disp("Reduce distractions that are available to you during study. This includes social media and tv.")
endif

if (questions_array(3)==0)
  disp("Most classes become more enjoyable when you actually understand the concepts. Try to truly comprehend the lessons of your course.")
endif

if (questions_array(4)==0)
  disp("Make a goal to ask at least 4 questions every class.")
endif

if (questions_array(5)==0)
  disp("Your classmates offer a different perspective on the same problem. This may happen to be a better method of solving the problem.")
endif 







