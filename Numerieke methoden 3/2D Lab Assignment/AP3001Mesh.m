clear all

Geometry = 'squareg'; 

permeability = 10^(-7);

viscosity = 1.002*10^(-3);

extract_rate = 50;

K = {[0 0.00001 1 10 100 1000 10000], logspace(-5, 0, 20)};
trans_rate = K{1}(4);

hydro_press = 10^6;

p = (1:5).';
wells(p,:) = [0.6*cos(2*pi*(p-1)/max(p)), 0.6*sin(2*pi*(p-1)/max(p))];
wells(max(p)+1,:) = [0,0];

% Geometry = 'squareg'; % gives square [-1,1] x [-1,1]

% Geometry = 'circleg'; % gives unit circle centered at origin

% Geometry = 'lshapeg'; % gives L-shape

[p,e,t] = initmesh(Geometry);

[p,e,t] = refinemesh(Geometry,p,e,t); % gives gridrefinement

%[p,e,t] = refinemesh(Geometry,p,e,t); % gives second gridrefinement

%[p,e,t] = refinemesh(Geometry,p,e,t); % gives third gridrefinement

figure(1);
pdemesh(p,e,t); % plots the geometry and mesh

x = p(1,:); y = p(2,:);

n = length(p(1,:));

elmat = t(1:3,:);
elmat = elmat';
elmatbnd = e(1:2,:);
elmatbnd = elmatbnd';

topology = 3; topologybnd = 2;
