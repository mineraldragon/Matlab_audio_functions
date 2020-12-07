function datamat = chop_audio(data,segL)
%Chop audio into parts of equal length
%segL is length in samples
%Rogier Landman 2020
outofdata=0;start=1;stop=segL;
datamat=[];step=1;
    while outofdata==0
        segment=data(start:stop);
        datamat(:,step)=segment;
        start=start+segL;
        stop=stop+segL;
        step=step+1;
        if(stop>length(data))
            outofdata=1;
        end
    end
end


