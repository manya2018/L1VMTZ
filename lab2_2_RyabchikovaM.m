%% Read and listen
[bass,fs]=audioread("bass.mp3");
[drums]=audioread("drums.mp3");
[guitars]=audioread("guitars.mp3");
[synths]=audioread("synths.mp3");
Lbass=length(bass)/fs;
Ldrums=length(drums)/fs;
Lguitars=length(guitars)/fs;
Lsynths=length(synths)/fs;
n=length(bass);

 %% Melody Matrix
melodyMatrix=[ bass drums guitars synths];
tmpVector=ones(4,1);
melody=melodyMatrix*tmpVector;
sound(melody,fs);


 %% Minus one
 minusguitar=melody-guitars;
sound (minusguitar,fs);

%% Signal distortion
t.array = (0:(n-1))/fs;
T = n/2;
volumeMod = sin(2*pi*(t.array/T));
volumeMod=volumeMod' ;
moledyV=volumeMod.*melody;
volumeMoD=2*volumeMod.^2 - 1;
moledyVV=volumeMoD.*melody;
sound(moledyVV,fs);
%% Shorten melody
X = melodyMatrix';
tmp = X(1:1:length(X(:))/2);
halfMelodyMatrix = reshape(tmp, 4,length(tmp)/4);
halfMelody = sum(halfMelodyMatrix);
sound(halfMelody,fs)

%% Shorten melody two
N=size(melodyMatrix,1);
halfMelodyMatrixtwo=melodyMatrix(1:N/2,:);
halfMelodytwo=sum(halfMelodyMatrixtwo,2);
sound(halfMelodytwo,fs);





%% 2-channel sound
melodyp=(melody > 0);
melodyn=(melody <= 0);
lmelodyp=length(melodyp);
lmelodyn=length(melodyn);
fsp=lmelodyp/Lbass;
fsn=lmelodyn/Lbass;


ch1 = melody.*(melody > 0.5);
ch2 = melody.*(melody <= 0.5);


twomelody=[ch1,ch2];

 %% flip

 melodyflip=flip(melody);
 sound(melodyflip,fs);
 %% 
 FS=30100;


 sound(melody,FS);


%%
