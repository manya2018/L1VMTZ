%%Creating ptchers
fs=2000;
pitchDur=1;
timeArray =0:1/fs: pitchDur;
pitchA=sin(2*pi*freqPitch(2)*timeArray);
pitchB=sin(2*pi*freqPitch(1)*timeArray);
pitchC=sin(2*pi*freqPitch(7)*timeArray);
pitchD=sin(2*pi*freqPitch(6)*timeArray);
pitchE=sin(2*pi*freqPitch(5)*timeArray);
pitchF=sin(2*pi*freqPitch(4)*timeArray);
pitchG=sin(2*pi*freqPitch(3)*timeArray); 
%% Read the file wiht pitchers

fid = fopen('songs.txt');
song = fscanf(fid, '%s');
fclose(fid);
whos song;
%% Create the song and the file.wav
singsong = [pitchF pitchC pitchF...
    pitchC pitchF pitchE pitchE pitchE...
    pitchC pitchE pitchC pitchE pitchF...
    pitchF pitchF pitchC pitchF pitchC pitchF...
    pitchE pitchE pitchE pitchC pitchE pitchC pitchF];
sound(singsong);
filename ='firstSong.wav'
audiowrite(filename,singsong,fs)
audioWavInfo=audioinfo('firstSong.wav')
wavFileName = audioWavInfo.Filename
wavFileCompMet = audioWavInfo.CompressionMethod
wavFileNumCh = audioWavInfo.NumChannels
wavFileRate = audioWavInfo.SampleRate
wavFileSamples = audioWavInfo.TotalSamples
wavFileDur = audioWavInfo.Duration
 %% Listen the mp3 file
audio=audioread("song1.mp3");
sound(audio);
F=audioinfo("song1.mp3");
auFileName = F.Filename;
auFileCompMet = F.CompressionMethod;
auFileNumCh = F.NumChannels;
auFileRate = F.SampleRate;
auFileSamples = F.TotalSamples;
auFileDur = F.Duration;

save ('data.mat',"auFileDur","auFileRate","auFileCompMet","auFileName","auFileNumCh" ...
    )
 fprintf('----------.MP3 VS .WAV----------\n');
fprintf('            %s VS %s\n', wavFileName,auFileName);
fprintf('            %s VS %s\n', wavFileCompMet,auFileCompMet);
fprintf('            %s VS %s\n', wavFileDur, auFileDur);
fprintf('            %d VS %d\n', wavFileRate,auFileRate);
fprintf('-------------------------------\n');

%% fyghjk
disp(['            ',wavFileName, ' VS ', auFileName]);
disp(['            ',wavFileCompMet, ' VS ', auFileCompMet]);
disp(['            ',num2str(wavFileDur), ' VS ', num2str(auFileDur)]);
disp(['            ',num2str(wavFileRate), ' VS ', num2str(auFileRate)]);
