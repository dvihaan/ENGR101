
% This script implements the algorithm for checking if credit card limits
% have been assigned fairly. 

% Most of this script has been written for you. Look for the TODOs (as in,
% these are your list of "steps to do") to find what you need to complete.


clear
close all

format short

%% Step 1: Read in credit card limit data
cc_data = readtable('credit_card_limit_data.xlsx');


%% Step 2: Calculate basic statistics as benchmark values

% calculate mean credit limit for the whole group
overall_mean = mean(cc_data.Credit_Limit);


%% Step 3: Identify Subgroups for Comparison Later On

% identify groups based on residence
residences = categorical(cc_data.Residence);
residence_categories = categories(residences)';


% identify groups based on customer status
customer_status = categorical(cc_data.Customer_Status);
customer_categories = categories(customer_status)';


% identify groups based on salary range
thresholds = [0, 15000, 35000, max(cc_data.Yearly_Salary) + 1];
Salary_Range = discretize(cc_data.Yearly_Salary,thresholds,'categorical', ...
    {'< 15,000', '15,000-35,000', '> 35,000'});
salary_categories = categories(Salary_Range)';

% add salary range to credit card info table
Salary_Range = cellstr(Salary_Range); % convert categorical to cell first
cc_data = [cc_data table(Salary_Range)];


%% Step 4a: Create a table of the means for the subgroups

% This table uses a helper function: 
%    mean_subgroup -- returns a table containing the means for the
%                     specified subgroup category

T_means = [mean_subgroup(cc_data,'Residence')
           mean_subgroup(cc_data,'Customer_Status')
           mean_subgroup(cc_data,'Salary_Range')];


%% Step 4b: Check for “Fairness”

% Reason:     See if one subgroup is favored at the expense of 
%             another subgroup (average value)
% Evaluation: The mean credit limit of all individual subgroups should be 
%             within 5% of the overall mean 

T_means.('Within 5% of Overall Mean?') = abs(T_means.Mean_Credit_Limit - overall_mean) <= 0.05 * overall_mean;



%% Step 5: Summarize fairness check

% The criteria is met if the 'Within 5% of Overall Mean' table variable is
% all 'true' values.
criteriaMet = all(T_means.('Within 5% of Overall Mean?'));



% Display a nice summary to the command window
disp(' ');
disp(' ');
disp(T_means); % show the table of the subgroup mean credit limits
disp(' ');
disp(' ');
disp('Are the mean credit limits of ALL individual subgroups within 5% of the overall mean?');
disp(criteriaMet);
disp('(0 = no, 1 = yes)');
disp(' ');
disp(' ');