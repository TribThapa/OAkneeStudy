clc; close all; clear all;

list=dir('/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/8_NiLearn/ConnectivityMatrix_GraphLasso_NodesEdges/Zeroes/*.txt');
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

%OutDir = ('/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/8_NiLearn/ConnectivityMatrix_GraphLasso_NodesEdges/');

%writetable(ResultsTable, [OutDir, 'Results_TT.csv'], 'Delimiter', ' ', 'WriteVariableNames', true);   
    

% %% test 
% % the values of K: indicate the significant Nodes found between HC and
% % Baselin using NBS analysis:
% 
% k=[3; 26; 27; 36; 38; 39; 40; 43; 46; 52; 72; 75; 81; 84];
% 
% p=zeros(14,14);
% t=p;
% 
% for i=1:length(k)
%     for j=1:length(k)
%         [a b c d]=ttest2(B(:,k(i),k(j)),F(:,k(i),k(j)));
%         p(i,j)=b;
%         t(i,j)=d.tstat;
%         BL(i,j)=mean(B(:,k(i),k(j)));
%         FU(i,j)=mean(F(:,k(i),k(j)));
%         BLs(i,j)=std(B(:,k(i),k(j)));
%         FUs(i,j)=std(F(:,k(i),k(j)));
%     end
% end
% 
% %% load HC
% 
% list=dir('/fs02/kg98/Suzan/BEAT/NiftiDir/TP01/NBS/Connectome/HC*.txt');
% names=list(1:39, end);
% HC=zeros(39,84,84);
% 
% for i =1: length(names)
%     
%     %figure;
%     filename=[list(1).folder,filesep,names(i).name];
%     Con=readmatrix(filename);
%     HC(i,:,:)=Con;
% 
% end
% 
% for l=1:length(x);
% 
%     HCss(l)=mean(HC(:,x(l),y(l)));
%     HCssst(l)=std(HC(:,x(l),y(l)));
%     
% end
% HCss=HCss';
% HCssst=HCssst';
% 
% %% Individual regions.
% 
% x0=54;
% y0=83;
% SB=size(B);
% SF=size(F);
% SHC=size(HC);
% Bv=B(:,x0,y0);
% Fv=F(:,x0,y0);
% HCv=HC(:,x0,y0);
% %% Computing the mean value (connectome) for 13 significant edges between HC and Baseline
% 
% % List of significant 13 pair of Edges are as below:
% 
% % [3,84], [26, 36], [26, 84], [27,84], [38, 84], [39,84], [40, 84], [43,
% % 75], [43, 84], [46,75], [46,81], [52, 75], [72, 75]
% 
% N1=3; N2=26; N3=27; N4=36; N5=38; N6=39; N7=40; N8=43; N9=46; N10=52;
% N11=72; N12=75; N13=81; N14=84;
% 
% list=dir('/fs02/kg98/Suzan/BEAT/NiftiDir/TP02/Connectome/HC/*.csv');
% names=list(1:39, end);
% HC=zeros(39,84,84);
% 
% for i =1: length(names)
%     
%     filename=[list(1).folder,filesep,names(i).name];
%     Con=readmatrix(filename);
%     HC(i,:,:)=Con;
%     
%     HC_Edge1(i,:)= HC(i,N1,N14);
%     HC_Edge2(i,:)= HC(i,N2,N4);
%     HC_Edge3(i,:)= HC(i,N2,N14);
%     HC_Edge4(i,:)= HC(i,N3,N14);
%     HC_Edge5(i,:)= HC(i,N5,N14);
%     HC_Edge6(i,:)= HC(i,N6,N14);
%     HC_Edge7(i,:)= HC(i,N7,N14);
%     HC_Edge8(i,:)= HC(i,N8,N12);
%     HC_Edge9(i,:)= HC(i,N8,N14);
%     HC_Edge10(i,:)= HC(i,N9,N12);
%     HC_Edge11(i,:)= HC(i,N9,N13);
%     HC_Edge12(i,:)= HC(i,N10,N12);
%     HC_Edge13(i,:)= HC(i,N11,N12);
%     
% end
% 
% HC_ROI_Edges=zeros(39,13);
% HC_ROI_Edges= [HC_Edge1, HC_Edge2, HC_Edge3, HC_Edge4, HC_Edge5, HC_Edge6, HC_Edge7,HC_Edge8, HC_Edge9, HC_Edge10, HC_Edge11, HC_Edge12, HC_Edge13];
% 
% % take the mean, std, and median of all Subjects per ROI (significant edge)
% meanHC= mean(HC_ROI_Edges);
% stdHC= std(HC_ROI_Edges);
% medianHC= median(HC_ROI_Edges);
% 
% list=dir('/fs02/kg98/Suzan/BEAT/NiftiDir/TP02/Connectome/BL/*.csv');
% names=list(1:47, end);
% BL=zeros(47,84,84);
% 
% for i =1: length(names)
%     
%     filename=[list(1).folder,filesep,names(i).name];
%     Con=readmatrix(filename);
%     BL(i,:,:)=Con;
%     
%     BL_Edge1(i,:)= BL(i,N1,N14);
%     BL_Edge2(i,:)= BL(i,N2,N4);
%     BL_Edge3(i,:)= BL(i,N2,N14);
%     BL_Edge4(i,:)= BL(i,N3,N14);
%     BL_Edge5(i,:)= BL(i,N5,N14);
%     BL_Edge6(i,:)= BL(i,N6,N14);
%     BL_Edge7(i,:)= BL(i,N7,N14);
%     BL_Edge8(i,:)= BL(i,N8,N12);
%     BL_Edge9(i,:)= BL(i,N8,N14);
%     BL_Edge10(i,:)= BL(i,N9,N12);
%     BL_Edge11(i,:)= BL(i,N9,N13);
%     BL_Edge12(i,:)= BL(i,N10,N12);
%     BL_Edge13(i,:)= BL(i,N11,N12);
%     
% end
% 
% BL_ROI_Edges=zeros(47,13);
% BL_ROI_Edges= [BL_Edge1, BL_Edge2, BL_Edge3, BL_Edge4, BL_Edge5, BL_Edge6, BL_Edge7,BL_Edge8, BL_Edge9, BL_Edge10, BL_Edge11, BL_Edge12, BL_Edge13];
% 
% % take the mean, std, and median of all Subjects per ROI (significant edge)
% 
% meanBL= mean(BL_ROI_Edges);
% stdBL= std(BL_ROI_Edges);
% medianBL= median(BL_ROI_Edges);
% 
%  
% list=dir('/fs02/kg98/Suzan/BEAT/NiftiDir/TP02/Connectome/*.csv');
% names=list(1:33, end);
% FU=zeros(33,84,84);
% 
% for i =1: length(names)
%     
%     filename=[list(1).folder,filesep,names(i).name];
%     Con=readmatrix(filename);
%     FU(i,:,:)=Con;
%     
%     FU_Edge1(i,:)= FU(i,N1,N14);
%     FU_Edge2(i,:)= FU(i,N2,N4);
%     FU_Edge3(i,:)= FU(i,N2,N14);
%     FU_Edge4(i,:)= FU(i,N3,N14);
%     FU_Edge5(i,:)= FU(i,N5,N14);
%     FU_Edge6(i,:)= FU(i,N6,N14);
%     FU_Edge7(i,:)= FU(i,N7,N14);
%     FU_Edge8(i,:)= FU(i,N8,N12);
%     FU_Edge9(i,:)= FU(i,N8,N14);
%     FU_Edge10(i,:)= FU(i,N9,N12);
%     FU_Edge11(i,:)= FU(i,N9,N13);
%     FU_Edge12(i,:)= FU(i,N10,N12);
%     FU_Edge13(i,:)= FU(i,N11,N12);
%     
% end
% 
% FU_ROI_Edges=zeros(33,13);
% FU_ROI_Edges= [FU_Edge1, FU_Edge2, FU_Edge3, FU_Edge4, FU_Edge5, FU_Edge6, FU_Edge7,FU_Edge8, FU_Edge9, FU_Edge10, FU_Edge11, FU_Edge12, FU_Edge13];
% 
% 
% %% Paired Differences between FU-Bl for each Subject
% 
% % Written by Suzan on 13/03/2022
% 
% % Splitting the intervention Groups (Cardio and Strength) within the Diff
% % outcomes
% 
% % Group1 = Cardio
% % Group2 = Strength
% 
% % Group 1 list based on Subjects_ID , like Sub001
% 
% % G1 = [1, 2, 3, 4, 5, 11, 14, 22, 26, 27, 35, 39, 40, 43, 47];
% 
% % G2 = [7, 8, 10, 12, 13, 15, 18, 19, 20, 28, 29, 34, 36, 37, 38, 42, 48, 49];
% 
% list=dir('/fs02/kg98/Suzan/BEAT/NiftiDir/TP02/1Stats_Paired/HC/*.csv');
% names=list(1:39, end);
% HC=zeros(39,84,84);
% 
% for i =1: length(names)
%     
%     filename=[list(1).folder,filesep,names(i).name];
%     Con=readmatrix(filename);
%     HC(i,:,:)=Con;
% 
% end
% 
% % Loading Baseline BEAT connectome matrices:
% 
% list=dir('/fs02/kg98/Suzan/BEAT/NiftiDir/TP02/1Stats_Paired/BL/Group1/*.csv');
% names=list(1:15, end);
% BG1=zeros(15,84,84);
% 
% for i =1: length(names)
%     
%     filename=[list(1).folder,filesep,names(i).name];
%     Con=readmatrix(filename);
%     BG1(i,:,:)=Con;
%     
% end
% 
% list=dir('/fs02/kg98/Suzan/BEAT/NiftiDir/TP02/1Stats_Paired/BL/Group2/*.csv');
% names=list(1:18, end);
% BG2=zeros(18,84,84);
% 
% for i =1: length(names)
%     
%     filename=[list(1).folder,filesep,names(i).name];
%     Con=readmatrix(filename);
%     BG2(i,:,:)=Con;
%     
% end
% 
% % Loading Follow-Up BEAT connectome matrices:
% 
% list=dir('/fs02/kg98/Suzan/BEAT/NiftiDir/TP02/1Stats_Paired/FU/Group1/*.csv');
% names=list(1:15, end);
% FG1=zeros(15,84,84);
% 
% for i =1: length(names)
%     
%     filename=[list(1).folder,filesep,names(i).name];
%     Con=readmatrix(filename);
%     FG1(i,:,:)=Con;
%     
% end
% 
% list=dir('/fs02/kg98/Suzan/BEAT/NiftiDir/TP02/1Stats_Paired/FU/Group2/*.csv');
% names=list(1:18, end);
% FG2=zeros(18,84,84);
% 
% for i =1: length(names)
%     
%     filename=[list(1).folder,filesep,names(i).name];
%     Con=readmatrix(filename);
%     FG2(i,:,:)=Con;
%     
% end
% 
% % Taking the Longitudinal Connectivity Differences (FU_Bl) for both Groups per subject
% % Longitudinal effect of Group1 
% 
% for sub = 1: 15
%     
%     Long_G1(sub,:,:)= FG1(sub,:,:)-BG1(sub,:,:);
%     
% end
% 
% for sub = 1: 18
%     
%     Long_G2(sub,:,:)= FG2(sub,:,:)-BG2(sub,:,:);
%     
% end
% 
% % running ttest2 between Baseline and Follow-Up to compare the strength of
% % connectivity between all 84 x 84 nodes /regions/ parcellations
% 
% Pval= zeros(84,84);
% T= Pval;
% 
% for i=1:84
%     for j=1:84
%         
%         [a b c d]=ttest2(Long_G1(:,i,j),Long_G2(:,i,j));
%         Pval(i,j)=b;
%         T(i,j)=d.tstat;
%     end
% end
% 
% % figure; 
% % imagesc(-log10(Pval),[1.3, 3]);
% 
% Plog=-log10(Pval);
% 
% [X Y]= find(Plog> 2); 
% 
% % also try Plog for Thresholds = 1.3, 2, 2.3
% 
% % S is a matrix with all significant pairs of connections that have Plog >
% % defined Threshold including duplicated pairs, dup example (29,82 and 82,29)
% 
% S=zeros(length(X),2);
% S(:,1)= X(1:length(X));
% S(:,2)= Y(1:length(Y));
% 
% % Finding the index/ location of duplicate pairs
% 
% IndexDup = zeros(1,length(X));
% 
% for i= 1:length(X)
%     for j= (i+1):length(X)
%         
%         if (S(i,1)==S(j,2) && S(i,2)==S(j,1));
%             IndexDup(i)= j;
%            
%             
%         end
%     end
% end
% 
% IndexRep= unique(IndexDup);
% IndexRep= IndexRep';
% Duplicates= IndexRep(IndexRep~=0);
% 
% % Removing the duplicates from matrix S
% 
% for i= 1:length(Duplicates)
%     S(Duplicates(i),:)= 0;
% end
% 
% % Saving the significant pairs as matrix XY (now have excluded duplicates)
% 
% XY= S;
% XY(S(:,1)==0,:)=[];
% 
% % Extracting the ttest2 parameters for only Significant Pairs of
% % Nodes/Parcellations
% 
% for L=1:length(XY)
%     
%     ts(L)= T(XY(L,1),XY(L,2));
%     ps(L)= Pval(XY(L,1),XY(L,2));
%     
%     Long_G1_mean(L)= mean(Long_G1(:, XY(L,1),XY(L,2)));
%     Long_G1_std(L)= std(Long_G1(:, XY(L,1), XY(L,2)));
%     
%     Long_G2_mean(L)= mean(Long_G2(:,XY(L,1),XY(L,2)));
%     Long_G2_std(L)= std(Long_G2(:, XY(L,1),XY(L,2)));
%     
%     HC_mean(L)= mean(HC(:,XY(L,1),XY(L,2)));
%     HC_std(L)= std(HC(:,XY(L,1),XY(L,2)));
%     
% end
% 
% % Transposing the results and save them as a Table
% 
% ts=ts';
% ps=ps';
% Long_G1_mean= Long_G1_mean';
% Long_G2_mean= Long_G2_mean';
% Long_G1_std= Long_G1_std';
% Long_G2_std= Long_G2_std';
% HC_mean= HC_mean';
% HC_std= HC_std';
% 
% TableResult= table(XY, ps, ts, Long_G1_mean, Long_G1_std, Long_G2_mean, Long_G2_std, HC_mean, HC_std);
% 
% % Results=zeros(length(XY),10);
% % Results(:,1:2)=XY;
% % Results(:,3)=ps;
% % Results(:,4)=ts;
% % Results(:,5)=Long_G1_mean;
% % Results(:,6)=Long_G1_std;
% % Results(:,7)=Long_G2_mean;
% % Results(:,8)=Long_G2_std;
% % Results(:,9)=HC_mean;
% % Results(:,10)=HC_std;
% 
% 
% % duplicate = ismember(XY(:,1), XY(:,2));
% % pairs = XY(duplicate,:);
% % diff= abs(pairs(:,1)-pairs(:,2));
