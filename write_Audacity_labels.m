function write_Audacity_labels(dst_file,L,TP)
fileID = fopen(dst_file,'w');
if(nargin==2)
    if(iscell(L))
        for i=1:length(L{1})
            fprintf(fileID,'%f\t%f\t%s\n',L{1}(i), L{2}(i), L{3}{i});
        end
    elseif(size(L,2)==2)
        for i=1:length(L)
            fprintf(fileID,'%f\t%f\n',L(i,1), L(i,2));
        end
    end
end
if(nargin==3)
        for i=1:length(L)
            fprintf(fileID,'%f\t%f\t%s\n',L(i,1), L(i,2), TP{i});
        end
end


fclose(fileID);
end

