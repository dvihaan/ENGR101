cereal_data = readmatrix('cereals.csv');
[fractionOver, manufacturer_code] = AnalyzeSugar(cereal_data, 10);
display(fractionOver)
display(manufacturer_code)