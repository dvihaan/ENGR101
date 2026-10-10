function [mean_values] = mean_subgroup(data,group)

    func = @(x) round(mean(x),2);
    mean_values = varfun(func,data(:,{group,'Credit_Limit'}),'GroupingVariables',group);
    
    % change variable names
    mean_values.Properties.VariableNames(1) = {'Subgroup'};
    mean_values.Properties.VariableNames(end) = {'Mean_Credit_Limit'};

    % add a variable for the category that this is
    mean_values.Category = repmat({group},size(mean_values,1),1);
    
    % rearrange the table so the category comes first
    mean_values = [mean_values(:,end) mean_values(:,1:end-1)];
    
end

