function r = fourierbasis(rij,kolom,w)
% fourierbasis(rij, kolom, w)
%
% Toont beeld in spatiaal domein dat overeenkomt met de pixel
% op gegeven rij en kolom in frequentiedomein. Dit laat je toe te
% bestuderen welke patronen in spatiaal domein overeenkomen met iedere
% pixel in een Fourierbeeldvoorstelling. (Resize de getoonde figuur over
% de breedte van je scherm voor best resultaat.)
%
% Door de (complexe) waarde van w te varieren kan je bestuderen dat: 
% 1) de amplitude van het het golfpatroon gelijk is aan de modulus van w
% 2) de fazehoek van w rechtstreeks een fazeverschuiving 
% van het resulterende golfpatroon in spatiaal domein bepaalt.
%
% Probeer dit eens uit met de volgende waarden:
%
% 1) Met ieder punt in het frequentiedomein komt een bepaald beeldpatroon
% overeen:
% fourierbasis(1,1,1);
% fourierbasis(2,1,1);
% fourierbasis(1,2,1);
% fourierbasis(2,2,1);
% fourierbasis(10,20,1);
% fourierbasis(65,1,1);
% fourierbasis(65,65,1);
% fourierbasis(120,1,1);
% fourierbasis(10,1,1);
%
% 2) De amplitude van het patroon is gegeven door de modulus van de
% coefficient in het frequentiedomein:
% fourierbasis(2,3,1);
% fourierbasis(2,3,0.5);
% fourierbasis(2,3,1.5);
%
% 3) Fazehoek van complexe coefficient bepaalt fazeverschuiving van
% patroon:
% fourierbasis(2,3,1);
% fourierbasis(2,3,j);
% fourierbasis(2,3,-1);
% fourierbasis(2,3,-j);
%
% Philippe Bekaert   9 October 2002

% Merk op dat matlab indices
% tellen vanaf 1 terwijl in de formules in het boek en in de literatuur de
% indices beginnen te tellen vanaf 0. Merk ook op dat de deling door MN in
% matlab gebeurt bij de inverse Fourier transformatie terwijl deze in het
% boek bij de voorwaartse Fourier transformatie gebeurt. Dit maakt dat de
% laagste coefficient niet de gemiddelde intensiteit in een beeld zal
% weergeven, maar de som van de intensiteiten. Merk eveneens op dat
% deze functie als argumenten rij en kolom aanneemt: de u-component in het
% boek komt overeen met de kolom en de v component met de rij.
M=zeros(128,128);
M(rij,kolom)=128*128*w;            % 128*128 pixels

% toon beeld in frequentiedomein
subplot(1,3,1); 
pcolor(abs(M)); 
shading flat; axis square; colormap('gray'); 
xlabel('u'); ylabel('v'); title('Frequentiedomein');

N=real(ifft2(M));          % inverse Fourier transformatie + maak reeel

% toon beeld in spatiaal domein als 3D oppervlak
subplot(1,3,2); 
surf(real(N)); 
shading interp; axis auto; axis([0 128 0 128 -2 2 -1.5 1.5]); colormap('default'); 
xlabel('x'); ylabel('y');

% toon beeld in spatiaal domein als 2D beeld
subplot(1,3,3); 
pcolor(real(N)); 
shading interp; colormap('gray'); axis square; caxis([-1.5 1.5]);
xlabel('x'); ylabel('y'); title('Spatiaal domein');

M(rij,kolom)=0;

r=0;
return;