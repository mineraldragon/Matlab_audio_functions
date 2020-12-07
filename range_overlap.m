function resmat = range_overlap(arr1,arr2)

%rogierlandman 2020

resmat = zeros(size(arr1,1), size(arr2,1));

for i=1:size(arr1,1)
    startpoint1 = arr1(i,1);
    endpoint1 = arr1(i,2);
    dur1 = endpoint1 - startpoint1;
    for j=1:size(arr2,1)
        startpoint2 = arr2(j,1);
        endpoint2 = arr2(j,2);
        dur2 = endpoint2 - startpoint2;
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
            dur3 = endofoverlap - startofoverlap;
            if(dur3>dur1)
                overlap=1;
            else
                overlap=dur3/dur1;
            end
        end
        resmat(i,j) = overlap;
    end
end

