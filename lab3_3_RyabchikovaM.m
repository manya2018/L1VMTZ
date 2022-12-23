%% Filters design

freqArray = [31, 62, 125, 250, 500, 1000, 2000, 4000, 8000,16000];
order = 1024; % должен быть четным
fS = 44100;
bBank=CreateFilters(freqArray,order,fS);


%% Filtering of signals
signal=audioread("song1.mp3");
gain=ones(10,1);
initB = zeros(1, order);
type='filter';
tic
signalOuT=FilteringBanks(signal,bBank,type,gain,initB);
toc
type= 'fftfilter';
 tic
signalOuT=FilteringBanks(signal,bBank,type,gain); 
toc

type= 'convFilter';
tic
signalOuT=FilteringBanks(signal,bBank,type,gain);
toc
%% Stream sound
deviceWriter = audioDeviceWriter('SampleRate', fS);
fileReader = dsp.AudioFileReader('song1.mp3');
gain = [10 10 10 0.1*ones(1, 7)]';
type='filter';
%gain = rand(size(freqArray))';
 while ~isDone(fileReader)
     audioData = fileReader();
     [audioData, initB]=FilteringBanks(audioData,bBank,type,gain,initB);
     deviceWriter(audioData)
 end



%%



    