clc
clear all

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
 
 i = 1;
while (i != 0)
  
 days_left = input ("How many days are in a marking period: ");
 days_past = input ("How many days have past in the marking period: ");
 days_left = days_left - days_past;
 assignments_past = input ("How many assignments have you completed?: ");
 assignments_left = input ("How many assignments do you have left?: ");
 
disp("\n")
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




condition = input ("Would you like to answer some questions about you to increase the accuracy of the predictions? 1/0: ");

questions_array = ones(1,5);

if (condition == 1)
questions_array(1) = input("Do you study a little every day, and stay on top of assignments. In essense, do you make sure not to procrastinate? 0/1: "); 
questions_array(2) = input("Do you have available distractions when studying? 0/1: ");
questions_array(3) = input("Do you enjoy this class? 0/1: ");
questions_array(4) = input("Do you show enthusiam for the subject in class by asking questions? 0/1: ");
questions_array(5) = input("Do you collaborate with classmates to acheive success together? 0/1: ");

endif











#grades matrix inputting
grades_matrix = zeros(assignments_past, 1);
x_values = 1:assignments_past;
disp("")
disp("Now enter the grades that you have gotten when prompted, and only enter one grade per prompt. ")

count =1;
while (assignments_past >= count)
  grades_matrix(count,1) = input("Enter grade: " );
  count++;
endwhile

disp ("The grades are "), disp(grades_matrix)
disp ("There are "), disp(x_values), disp("x_values")



###################################################################
#Data Analysis Section


disp("")
disp("Statistical Analysis: ")

x_values_legnth = size (x_values,2);
#Mean
sum =0;
mean = 0;
for(i = x_values)
sum = sum + grades_matrix(i);
endfor
mean = sum/x_values_legnth;
disp ("The mean is ")
disp (mean)


#Standard Deviation
#summation =0;
#for (i = x_values)
#  summation = summation +(grades_matrix(i)-mean)^2
#endfor

#for (1:summation)

disp("\nTechnical Analysis: ")


#Linear Regression Model
  


















#{


#Comparison
if (J_one >= J_two)
  disp("We will use the exponential model, because it fits the data relatively well.")
  exponential_regression_vector
  plot(x_values, exponential_regression_vector)

else
  b =("We will use the linear model, because it fits the data relatively well.")
  plot(x_values, linear_regression_vector)
endif

disp("\nArbitrage Analysis: ")
if (a <0)
  disp("\nYou are on a negative trend. Fix your behaviors using the suggestions below.")
elseif(a > 0)
 disp("\nYou are on a positive trend! Keep up the good work, and your grades will gradually improve. If you are extra ambitous, use the following suggestions to speed up your progress.")
else
 disp("\nYou have a constant rate of change in regards to your grade. You can improve by using the following suggestions.")
endif

#########
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



#}