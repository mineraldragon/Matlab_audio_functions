function matjeout=fadeout(matje,duration,Fs)
%FADEout fade out audio 
%matje is a vector or matrix with time in rows and channels or trials in columns
%duration is the duration of the fade in seconds
%Fs is sample rate
%Rogier Landman 2020
if(size(matje,2) > size(matje,1))
    matje=matje';
end
fade_arr=linspace(1,0,(duration*Fs));
matjeout=matje;
    for i=1:size(matje,2)
        wav=matje(:,i);
        wav(end-length(fade_arr)+1:end)=wav(end-length(fade_arr)+1:end).*fade_arr';
        matjeout(:,i)=wav;
    end
end


