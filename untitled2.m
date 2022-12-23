%% Filters design
freqArray = [31, 62, 125, 250, 500, 1000, 2000, 4000, 8000,16000];
order = 1024; % должен быть четным
fS = 44100;   
bBank=CreateFilters(freqArray,order,fS);
nums=randperm(10,3);
bTmp=bBank(nums,:);
for i =1:3
    [H(i, :), w(i, :)] = freqz(bTmp(i,:), 1, order);
end
dzb=@(x)20*log10(x);
H=dzb(abs(H));
w=w*fS/(2*pi);



%% Graph with standard functions
plot(w(1,:),H(1,:),'-k','LineWidth',1);
hold on;
xlim([0;21000]);
ylim([-60;10]);
plot(w(2,:),H(2,:),':*b','LineWidth',1);
plot(w(3,:),H(3,:),'-.rs','LineWidth',1);
grid on;
legend('фильтр №1','фильтр №2','фильтр №3')
xticks([2000,8000,16000]);
xticklabels({' 2 кГц',' 8 кГц',' 16 кГц'})
xlabel('f, kHz','FontSize',16);
ylabel('|H|, dB','FontSize',16);
title('Filters numbers: №1,№2,№3','FontSize',16);


%% Graph with changing object properties
f=figure('DefaultAxesFontSize',14);
ax=axes;
p.one=plot(w(1,:),H(1,:));
hold on;
p.two=plot(w(2,:),H(2,:));
p.three=plot(w(3,:),H(3,:));
PropNames={'xLim','yLim'};
PropValues={[0,21000],[-60,10]};
set(ax,PropNames,PropValues);
set(p.one,'Color','black');
set(p.two,'Color','blue');
set(p.three,'Color','red');
NameStyle = {'LineStyle'};
ValueLineOne = {'-'};
ValueLineTwo = {':'};
ValueLineThree = {'-.'};
set(p.one,NameStyle,ValueLineOne);
set(p.two,NameStyle,ValueLineTwo);
set(p.three,NameStyle,ValueLineThree);
set(p.two,"Marker","*");
set(p.three,"Marker","square");
ax.XTick=[2000,8000,16000];
ax.XTickLabel={'2кГц','8кГц','16кГц'};
ax.XLabel.String={'f, kHz'};
ax.YLabel.String={'|H|, dB'};
ax.Title.String={'Фильтры'};
ldg=legend('1','2','3');
f.Position =[0 0 600 500];



%% Graph with autofuncax
plot(w(1,:),H(1,:));
hold on;
xlim([0;21000]);
ylim([-60;10]);
plot(w(2,:),H(2,:));
plot(w(3,:),H(3,:));
f.Position =[2000 0 600 500];

%% Filtering of signals
signal = audioread('song1.mp3');
timeArray =(0:(length(signal)-1))/fS;
pitch=sin(2*pi*15000*timeArray);
s=[pitch',pitch'];
newsignal= s + signal;
[pxx,f] = pspectrum(newsignal,fS);
dbnewsidnal = dzb(pxx);
subplot(2,1,1);
plot(f, dbnewsidnal);
gain=[ones(1,9) 0];
gain=gain';
initB = zeros(1, order);
signalout=FilteringBanks(newsignal,bBank,'filter',gain,initB);
[pxx2,f2] = pspectrum(signalout,fS);
subplot(2,1,2);
plot(f2,dzb(pxx2));



%% Spectrogram
f=figure();
[s, f, t] = spectrogram(signal(:, 1), 2^10, [], freqArray, fS);
[F, T] = meshgrid(f, t);
mesh(F, T, abs(s'));
set(gca, 'Xscale', 'log')
%% yggh
p = plot(x,y,LineWidth=4)

