function resmat = range_overlap(arr1,arr2)

%arr1 and arr2 are M by N matrices where each row is a range 
%column 1 is the start of the range
%column2 is the end of the range

%output resmat is a matrix with dimensions [size(arr1,1)] x [size(arr2,1)]
%where each element gives the fraction overlap for a combination of ranges
%that is, the fraction of arr1 that is being overlapped by arr2

%example
%arr1=[1 5; 10 15; 20 25; 50 100];
%arr2=[6 9; 10 17; 24 70];

%first row of arr1: no overlap with any range of arr2
%second row of arr1 is 100% overlapped by second row of arr2
%third row of arr1 is 20% overlapped by third row of arr2 
%fourth row of arr1 is 40% overlapped by third row of arr2

%output:
% resmat =
% 
%          0         0         0
%          0    1.0000         0
%          0         0    0.2000
%          0         0    0.4000

%rogierlandman 2020

resmat = zeros(size(arr1,1), size(arr2,1));

for i=1:size(arr1,1)
    startpoint1 = arr1(i,1);
    endpoint1 = arr1(i,2);
    dur1 = endpoint1 - startpoint1;
    for j=1:size(arr2,1)
        startpoint2 = arr2(j,1);
        endpoint2 = arr2(j,2);
        overlap = 1;
        if (endpoint1 < startpoint2)
            %no overlap
            overlap=0;
        end
        if (endpoint2 < startpoint1)
            %no overlap
            overlap=0;
        end
        if(overlap)
            %start of overlap is max of startpoint1 and startpoint2
            startofoverlap = max([startpoint1,startpoint2]);
            endofoverlap = min([endpoint1,endpoint2]);
            %how much of arr1 is captured?
            dur2 = endofoverlap - startofoverlap;
            if(dur2>dur1)
                overlap=1;
            else
                overlap=dur2/dur1;
            end
        end
        resmat(i,j) = overlap;
    end
end

