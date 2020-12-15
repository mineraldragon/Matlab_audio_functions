function onset=find_onset1(tmp, thr, lim)
%FIND_ONSET find audio onset based on standard deviation in the signal
%uses 100 samples window and steps of 100 samples
%tmp is a vector
%thr is the threshold for standard deviation at which you decide there's an onset
%lim is how far into the sample you want to look (in samples), otherwise it
%returns 1
%output onset is the index at which the onset happens
%Rogier Landman 2020

window_length=100;
step_size=1;
cnt=1;
for st=1:step_size:length(tmp)-window_length
    stp=st+window_length;
    z(cnt,1)=std(tmp(st:stp));
    z(cnt,2)=st;
    cnt=cnt+1;
end
zz=diff(z(:,1));
z(:,1)=[0;zz];
[val idx]=max(z(:,1));
onset=z(idx,2);


