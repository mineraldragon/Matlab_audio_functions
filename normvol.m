function matjeout=normvol(matje,targetloudness)
%NORMVOL normalize audio to a certain loudness
%matje is a vector or matrix with time in rows and channels or trials in columns
%each channel/column is individually brought towards the target value
%returns a matrix of normalized data
%Rogier Landman 2020
if nargin==1
    targetloudness=0.05;
end
    for i=1:size(matje,2)
        wav=matje(:,i);
        v=targetloudness;
        if(v > targetloudness)
            amt=1;
            while( v > targetloudness)
                amt = amt - 0.01;
                wavnew = wav.*amt;
                v = mean(abs(wavnew));
            end
            wav=wavnew;
        elseif(v < targetloudness)
            amt=1;
            while( v < targetloudness)
                amt = amt + 0.01;
                wavnew = wav.*amt;
                v = mean(abs(wavnew));
            end
            wav=wavnew;
        end
        matjeout(:,i)=wav;
    end
end

