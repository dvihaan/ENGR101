coffeeShopData = readtable('coffeeshop.txt');

%Display (as a sub-table) only the Transaction IDs in your table.
disp(coffeeShopData(:, "TransactionID"));

%View the rows (as a sub-table) of sales where the customer tipped. 
tippedSales = coffeeShopData(coffeeShopData.Tipped > 0, :);
disp(tippedSales);

%Show the rows (as a sub-table) where a customer spent less than $2.95.
cheapSales = coffeeShopData(coffeeShopData.Price < 2.95, :);
disp(cheapSales);