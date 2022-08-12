clc; clear all; close all;

NodeFile = readtable('../../../Results.csv');
regions = importdata('../../../Power_Coordinates.csv');

A=NodeFile.NodeX;
B=NodeFile.NodeY;
%[A;B];
C=unique([A;B]);
c=length(C);
Matrix = zeros(c,c);

%logic = NodeFile.MeanP<0.05;

for j=1:length(NodeFile.Tvalue)
    
% index of NodeX

Ix=find(C==NodeFile(j,1).NodeX);
Iy=find(C==NodeFile(j,2).NodeY);
Imin=min(Ix,Iy);
Imax=max(Ix,Iy);

Matrix(Imin,Imax)=table2array(NodeFile(j,7));
    
end

nodes = regions(C(1:end));

imagesc(Matrix);
colormap jet;
colorbar;
caxis([-1 1]);
ylabel('Node number');
xlabel('Node number');
%title([preproc{i},', IDscore=',num2str(identScore(i))],'FontSize', 10);
%saveas(gcf,[outDir,'idMat_',preproc{i}],'jpg');
[C,F1,F2]=unique([A;B]);
freq=accumarray(F2,1);
half_freq = freq/2;
out=[C freq];

    
%dlmwrite('PowerNode.txt',nodes);

dlmwrite('PowerEdge.txt',Matrix);
