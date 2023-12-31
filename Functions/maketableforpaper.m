function maketable(A,filename,caption,label,formatstr)
%%
% February 29, 2004, Rosemary Renaut
% This small function can be used to create a file for input to a tex file 
% The file created has name "filename" and is a table of all entries
% in matrix A. It could be necesary to taylor the format of the print out
% Use for example %4.4f for each number in the matrixor %d
% This can also pass the caption for the table and the label for
% the table
% This version is designed for the results in the paper
%
% Inputs
% A : data for the table
% filename : string to name file
% caption : string to add a caption
% label : string to add a label
% formatstr : format for the results
% 
% Outputs: none
%
% Update October 8, 2023. 
% Copyright: Salina Bermudez and Rosemary Renaut
%
%%
[trows,tcols]=size(A);
fid1=fopen(filename,'a');
fprintf(fid1,'%s','\begin{table}[!htb]\begin{center}\begin{tabular}{|c*{');
fprintf(fid1,'%d',tcols+1);
fprintf(fid1,'%s\n','}{|c}|}\hline');
fprintf(fid1,'%s\n',['Noise&&\multicolumn{2}{|c|}{$K$}&\multicolumn{2}{|c|}{$\tau$}&\multicolumn{2}{|c|}{IT}&\multicolumn{2}{|c|}{FE}&\multicolumn{2}{|c|}{$\rho$}\\ \hline']); 
fprintf(fid1,'%s\n',['Type&$\snr$& MRE&GCV&MRE&GCV&' ...
    'MRE&GCV&MRE&GCV&MRE&GCV\\']);
%% Need to format all the groups
for i=1:3
    if i==1 fprintf(fid1,'%s', '\hline\multirow{3}{*}{Gaussian}'); end
    fprintf(fid1,'%s','&$');
    for j=1:3 %the integers
         fprintf(fid1,'%0.4g',A(i,j));
         fprintf(fid1,'%s','$&$');
    end
    for j=4:5
         fprintf(fid1,'%0.2g',A(i,j));
         fprintf(fid1,'%s','$&$');
    end
    for j=6:tcols-1
         fprintf(fid1,formatstr,A(i,j));
         fprintf(fid1,'%s','$&$');
    end
    fprintf(fid1,formatstr,A(i,tcols));
    fprintf(fid1,'%s\n','$\\');
end
fprintf(fid1,'%s','\hline'); 
for i=4:6
     if i==4, fprintf(fid1,'%s', '\multirow{3}{*}{Poisson} ');     end
    fprintf(fid1,'%s','&$');
    for j=1:3 %the integers
         fprintf(fid1,'%0.4g',A(i,j));
         fprintf(fid1,'%s','$&$');
    end
    for j=4:5
                 fprintf(fid1,'%0.2g',A(i,j));
         fprintf(fid1,'%s','$&$');
    end
    for j=6:tcols-1
                 fprintf(fid1,formatstr,A(i,j));
         fprintf(fid1,'%s','$&$');
    end
    fprintf(fid1,formatstr,A(i,tcols));
    fprintf(fid1,'%s\n','$\\');
end
fprintf(fid1,'%s','\hline'); 
for i=7:trows
    if  i==7  
        fprintf(fid1,'%s', '\multirow{3}{*}{S \& P} ');
    end
    fprintf(fid1,'%s','&$');
    for j=1:3 %the integers
         fprintf(fid1,'%0.4g',A(i,j));
         fprintf(fid1,'%s','$&$');
    end
    for j=4:5
                 fprintf(fid1,'%0.2g',A(i,j));
         fprintf(fid1,'%s','$&$');
    end
    for j=6:tcols-1
                 fprintf(fid1,formatstr,A(i,j));
         fprintf(fid1,'%s','$&$');
    end
    fprintf(fid1,formatstr,A(i,tcols));
    fprintf(fid1,'%s\n','$\\');
end
fprintf(fid1,'%s\n','\hline'); 
fprintf(fid1,'%s','\end{tabular}\caption{');
fprintf(fid1,'%s',caption);
fprintf(fid1,'%s\n','}\end{center}\end{table}'); 
end