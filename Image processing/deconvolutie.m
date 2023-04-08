%
% deconvolutie: deconvolutie demo (boek sectie 5.7)
%
% Beeld 1: ingelezen testbeeld
% Beeld 2: geconvolueerd beeld (met Gaussiaanse lowpass filter met sigma=3)
% Beeld 3: naieve inverse filtering veroorzaakt delingen door nul bij hoge
%          frequenties (buitenkant FT)
% Beeld 4: resultaat van deconvolutie mits eenvoudige voorzorg ivm delingen
%          door nul
% Beeld 5: zelfde als beeld 2, maar met uniforme (witte) ruis toegevoeg,
%          met amplitude 1%. Het verschil tussen 2 en 5 is nauwelijks te
%          zien.
% Beeld 6: resultaat van deconvolutie na wat fine tuning, ruis maakt
%          deconvolutie een flink pak moeilijker
%
% Philippe Bekaert - 17 Oktober 2002
% 

% lees testbeeld in
f=imread('testimage.gif');
f=double(f)/255; f=1-f; f=flipud(f);
figure(1); pcolor(f); shading interp; colormap('gray'); axis image

% 2) maak genormaliseerde Gaussianse lowpass filter
h=zeros(128,128);   % we weten dat f 128x128 pixels is
for i=1:128; for j=1:128; x=i-65; y=j-65; h(i,j)=x*x+y*y; end; end
h=exp(-0.5*h/(3*3));
h=h/sum(sum(h));

% 3) pas filter toe (via frequentiedomein)
F=fftshift(fft2(f));
H=fftshift(fft2(ifftshift(h)));
G=F.*H;
g=real(ifft2(ifftshift(G)));
figure(2); pcolor(g); shading interp; colormap('gray'); axis image

% deconvolutie
G1=fftshift(fft2(g));
F1=G1./H;
figure(3); surf(log10(abs(F1))); shading interp
% deconvolutie lukt niet wegens delingen door nul voor hoge frequenties.

F1=G1./(H+5e-15);    % vermijd deling door nul, 5e-15 term werd experimenteel bepaald
f1=real(ifft2(ifftshift(F1)));
figure(4); pcolor(f1); shading interp; colormap('gray'); axis image

% voeg beetje uniforme (witte) ruis toe aan geconvolueerde beeld 
g1=g+0.01*rand(size(g));
% verschil met beeld 2 is niet te merken
figure(5); pcolor(g1); shading interp; colormap('gray'); axis image

% deconvolutie, werkt veel minder goed
G2=fftshift(fft2(g1));
F2=G2./(H+0.1);
f2=real(ifft2(ifftshift(F2)));
figure(6); pcolor(f2); shading interp; colormap('gray'); axis image

