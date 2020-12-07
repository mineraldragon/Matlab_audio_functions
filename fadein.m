function matjeout=fadein(matje,duration,Fs)
%FADEIN fade in audio 
%matje is a vector or matrix with time in rows and channels or trials in columns
%duration is the duration of the fade in seconds
%Fs is sample rate
%Rogier Landman 2020
if(size(matje,2) > size(matje,1))
    matje=matje';
end
fade_arr=linspace(0,1,(duration*Fs));
matjeout=matje;
    for i=1:size(matje,2)
        wav=matje(:,i);
        wav(1:length(fade_arr))=wav(1:length(fade_arr)).*fade_arr';
        matjeout(:,i)=wav;
    end
end





