function onset=find_onset(tmp, thr, lim)
%FIND_ONSET find audio onset based on standard deviation in the signal
%uses 100 samples window and steps of 100 samples
%tmp is a vector
%thr is the threshold for standard deviation at which you decide there's an onset
%lim is how far into the sample you want to look (in samples), otherwise it
%returns 1
%output onset is the index at which the onset happens
%Rogier Landman 2020

yes=0;st=1;stp=100;
while yes==0 && stp<length(tmp)
    z=std(tmp(st:stp));
    if(z>thr)
        yes=1;
        onset=st;
    end
    st=st+100;
    stp=stp+100;
end
if(onset>lim)
    onset=1;
end
end



