function bBank = CreateFilters(freqArray, order, fS)
freqArrayNorm = freqArray/(fS/2);
for k=1:length(freqArray)
    if k==1
        mLow = [1, 1, 0, 0];
        freqLow = [0, freqArrayNorm(1), 2*freqArrayNorm(1), 1];
        bLow = fir2(order, freqLow, mLow);
    elseif k==length(freqArray)
        mHigh = [0, 0, 1, 1];
        freqHigh = [0, freqArrayNorm(end)/2, freqArrayNorm(end),1];
        bBank(k,:) = fir2(order, freqHigh, mHigh);
    else
        mBand = [0, 0, 1, 0, 0];
        freqBand = [0, freqArrayNorm(k-1), freqArrayNorm(k),freqArrayNorm(k+1), 1];
        bBank(k,:) = fir2(order, freqBand, mBand);
    end 
    
end