clc; clear all; close all;

subID = {'sub-01';...................};
     
DataDir = ('/../../../');
     
for i = 1:length(subID)
    
    FullPath = [DataDir,subID{i},'_power.txt'];
    
    Matrix = readmatrix(FullPath);
    
    eye(5);        
    
    Matrix2 = Matrix-eye(264);
    
    writematrix(Matrix2, [DataDir,'/Zeroes/',subID{i},'_power_zeroes.txt'],'Delimiter',' ')
    
end


