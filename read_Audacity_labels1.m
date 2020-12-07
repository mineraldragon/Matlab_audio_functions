function L = read_Audacity_labels(filename)
filename
fileID = fopen(filename);
L=textscan(fileID,'%f %f %s','Delimiter', '\t');
fclose(fileID);
end
