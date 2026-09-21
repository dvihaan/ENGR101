%% TEST 1: A general case 
% The expected result is 17.
roofHeight = 11;
pallets = [3, 2, 5;
           4, 1, 3;
           1, 4, 5];
palletHeight = 2;
 
result = additionalPallets(roofHeight, pallets, palletHeight);
expected_result = 17;

% Display a nice summary of this test case in the Command Window
disp("Test 1:");
disp("Result from calling additionalPallets is:");
disp(result);
disp("Expected result is:");
disp(expected_result);
disp("-------------------"); % prints a line to help separate the test cases.
                             % this isn't necessary, just helpful for
                             % humans when we're reading the output!
                             
                             