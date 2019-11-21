%******************************
%% Writing to a file 
%******************************

filename = 'file.txt'; 
filID = fopen(filename, 'wt');
variablex = 1:10; 
fprintf(filID, '%s\n', filename); 
for x = 1:length(variablex)
    fprintf(filID, '%.2d\t %.1d\n',  x, variablex(x)); 
end 

fclose(filID); 