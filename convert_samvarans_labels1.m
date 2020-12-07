
%read csv
clear
%w='C:\Users\Rogier\Documents\Python_Scripts\acdc-master\acdc-master\2019_01_17-01_R1\results\20190614_123655_sep21_2018_16ch_test_with_jackets-cut\sep21_2018_16ch_test_with_jackets-cut.csv';
%w= 'Z:\Marmoset audio raw data\20191108\';
w='/Users/rogierlandman/from_Samsung/Python/2019_01_17-01_R4good/kerasenv/R4good_nontsik_amelia1/results/20201022_092914_01-200925_1019/';
w='/Users/rogierlandman/Downloads/';
w='/Users/rogierlandman/from_Samsung/Python/2019_01_17-01_R4good/kerasenv/R4good_nontsik/results/20201128_135925_01-200828_1215/';
w='/Users/rogierlandman/from_Samsung/Python/2019_01_17-01_R4good/kerasenv/R4good_nontsik/results/20201129_230416_20200922-001/';
w='/Users/rogierlandman/from_Samsung/Python/2019_01_17-01_R4good/kerasenv/R4good_nontsik/results/20201129_194220_20200918-011/';
w='/Users/rogierlandman/from_Samsung/Python/2019_01_17-01_R4good/kerasenv/R4good_nontsik/results/20201205_180236_Crush_Separation/';
w='/Users/rogierlandman/from_Samsung/Python/2019_01_17-01_R4good/kerasenv/R4good_nontsik/results/20201205_184345_Nick_Separation/';
w='/Users/rogierlandman/from_Samsung/Python/2019_01_17-01_R4good/kerasenv/R4good_nontsik/results/20201205_221459_Nick_Separation/';
w='/Users/rogierlandman/from_Samsung/Python/2019_01_17-01_R4good/kerasenv/R4good_nontsik_lacreuse/results/20201206_214714_Nick_Separation/';
w='/Users/rogierlandman/from_Samsung/Python/2019_01_17-01_R4good/kerasenv/R4good_nontsik_lacreuse/results/20201207_091443_Crush_Separation_seg/';
w='/Users/rogierlandman/from_Samsung/Python/2019_01_17-01_R4good/kerasenv/R4good_nontsik_lacreuse/results/20201207_094230_Crush_Separation_seg/';
w='/Users/rogierlandman/from_Samsung/Python/2019_01_17-01_R4good/kerasenv/R4good_nontsik_lacreuse/results/20201207_101012_Crush_Separation_seg_filt/';
% w='C:\Users\Rogier\Documents\Python_Scripts\acdc-master\acdc-master\2019_01_17-01_R1-Eliades\';
% w='C:\Users\Rogier\Documents\Python_Scripts\acdc-master\acdc-master\2019_01_17-01_R5\';
% w='C:\Users\Rogier\Documents\Python_Scripts\acdc-master\acdc-master\2019_01_17-01_R1\results\20190718_220635_Cage_1_1
files = dir([w,'*.csv']);

for lst=1:length(files)
    w1=[files(lst).folder,filesep,files(lst).name];
    T = readtable(w1);
    [folder1, file1]=fileparts(w1);
    fileID = fopen([folder1,filesep, files(lst).name(1:end-4), '_Labels.txt'],'w');
    for i=1:size(T,1)
        fprintf(fileID,'%f\t%f\t%s\n',table2array(T(i,2)), table2array(T(i,3)), char(table2array(T(i,1)))   );
    end
    fclose(fileID);
end
fprintf('saved %s\n',[folder1,filesep, files(lst).name(1:end-4), '_Labels.txt']);

% w1='/Users/rogierlandman/Downloads/01-200925_1019_seg.csv';
%     T = readtable(w1);
%     [folder1, file1]=fileparts(w1);
%     fileID = fopen([folder1,filesep, files(lst).name(1:end-4), '_Labels.txt'],'w');
%     for i=1:size(T,1)
%         fprintf(fileID,'%f\t%f\t%s\n',table2array(T(i,2)), table2array(T(i,3)), char(table2array(T(i,1)))   );
%     end
%     fclose(fileID);
