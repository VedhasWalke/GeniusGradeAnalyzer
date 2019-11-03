# Temporary Variable
select = 1;
#
clc


disp("The following is your predicted grade after all assignments are submitted")
#linear regression prediction
if select = 1

for(i= 1:assignments_left)
  prediction = best_slope*(i+assignments_done)+best_yintercept
endfor




#exponential growth regression prediction  
elseif select = 0 && select2 = 1
  for(i = 1:assignments_left)
  prediction = a*(1+b)^x_values(i+assignments_done)

  
  #exponential decay regression prediction  
elseif select = 0 && select2 = 0
  for(i = 1:assignments_left)
  prediction = a*(1-b)^x_values(i+assignments_done)