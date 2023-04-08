%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SLIDE 6

fs   = 8192;
secs = 2;
tt = (0 : fs * secs) / fs;

freq = 880;
ww = sin(2 * pi * freq * tt);

soundsc(ww, fs)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SLIDE 8
clear

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Slide 8 (Happy birthday) 
freq = [262 262 294 262 349 330];
ww = [];
for kk = 1 : 6
    ww = [ww, sin(2 * pi * freq(kk) * tt)];
end

soundsc(ww, fs)

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Slide 10 (spectrogram) 

[piano, fs_piano] = audioread('Strijker.wav');
piano = piano(:, 1);
soundsc(piano, fs_piano);
spectrogram(piano,1280,640,4000,fs_piano, 'yaxis')
ylim([0 4])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Slide 15 (nietlineaire frequenties)

tt = (0 : 4 * fs) / fs;
ww = sin(2 * pi * 500 * tt);
ww = sin(2 * pi * (500 * tt + 50 * sin(2 * pi * tt) / pi))
ww = sin(2 * pi * (500 * tt + 125/2 * tt.^2));
soundsc(ww, fs);
spectrogram(ww, 1280, 640, 4000, fs, 'yaxis')
ylim([0 4])
