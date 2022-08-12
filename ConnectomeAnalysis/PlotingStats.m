clc; close all; clear all;

list=dir('/../../../Zeroes/*.txt');

%1~20 HC
%21-73 Patients
names=list(1:73, end);
B=zeros(20,264,264);

for i =1:20 %HC
    
    %figure;
    filename=[list(1).folder,filesep,names(i).name];
    Con=readmatrix(filename);
    B(i,:,:)=Con;
    EdgeBL=nonzeros(Con);
    EdgeMeanBL(i,:)= mean(EdgeBL);

end


F=zeros(53,264,264);

for i =21:73% Patient length(names)
    
    %figure;
    filename=[list(1).folder,filesep,names(i).name];
    Con=readmatrix(filename);
    EdgeF=nonzeros(Con);
    EdgeMeanF(i,:)= mean(EdgeF);
    
    %imagesc(log(Con));
    %figure;
    %histogram(Con);
    F(i,:,:)=Con;
    %waitforbuttonpress;
end
    

% running ttest between Baseline and Follow-Up to compare the strength of
% connectivity between all 84 x 84 nodes /regions/ parcellations

P=zeros(264,264);
T=P;

% Simple t-test 
for i=1:264
    for j=1:264
        [a b c d]=ttest2(B(:,i,j),F(:,i,j));
        P(i,j)=b;
        T(i,j)=d.tstat;
    end
end


% Bonferroni corrected P<0.00001 for multiple comparisons
Plog=-log10(P);
Pth=-log10(0.00001/(264*264/2 -264)); 
[x y]=find(Plog>Pth);
figure; imagesc(Plog,[Pth,13]);


% extract significant regions based on this figure
for l=1:length(x);
    ts(l)=T(x(l),y(l));
    ps(l)=P(x(l),y(l));
    
    BL_mean(l)=mean(B(:,x(l),y(l)));
    BL_std(l)=std(B(:,x(l),y(l)));
    
    FU_mean(l)=mean(F(:,x(l),y(l)));
    FU_std(l)=std(F(:,x(l),y(l)));
end

ts=ts';
ps=ps';
BL_mean=BL_mean';
FU_mean=FU_mean';
BL_std=BL_std';
FU_std=FU_std';
Results=[x,y,ts,ps,-log10(ps),BL_mean,BL_std,FU_mean,FU_std];

ResultsTable = table(Results(:,1), Results(:,2), Results(:,3), Results(:,4), Results(:,5), Results(:,6), Results(:,7), Results(:,8), Results(:,9));
ResultsTable.Properties.VariableNames = {'NodeX', 'NodeY', 'TValue', 'Pvalue', '-log10P', 'mean_HC', 'StdDev_HC', 'mean_Pt', 'StdDev_Pt'};


    

