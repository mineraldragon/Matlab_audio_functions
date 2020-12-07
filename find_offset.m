function offset=find_offset(tmp, thr, lim)
%FIND_OFFSET find audio offset based on standard deviation in the signal
%same as FIND_ONSET but in reverse
%uses 100 samples window and steps of 100 samples
%tmp is a vector
%thr is the threshold for standard deviation at which you decide there's an onset
%lim is how far into the sample you want to look (in samples), otherwise it
%returns 1
%output offset is the index at which the offset happens
%Rogier Landman 2020

tmp=flipud(tmp);
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
offset=length(tmp)-onset;
end

