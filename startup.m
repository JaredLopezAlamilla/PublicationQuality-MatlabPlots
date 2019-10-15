% start up file for matlab
% This file will automatically set matlab figure properties
% Default interpreter set to LaTex
% Default font size
% Default colormaps
%set(0,'DefaultTextInterpreter','Latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(0,'DefaultAxesFontSize', 24,'DefaultAxesLineWidth',2.5,'DefaultTextInterpreter','Latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');

% select between the different colormaps best suit your puropose 
% uncomment line 14 to make default colormap: matlabs' parula 
% uncomment lines 18-19 to make default colormap: a nice gray scale
% uncomment line 21-22 to make  default colormap: wolfram-mathematica darkrainbow palette

%set(0,'DefaultFigureColormap',parula);

%GrayMap=repmat((168:-(168-70)/255:70)'.*ones(256,1),1,3)/256;
%set(0,'DefaultFigureColormap',GrayMap);

%load('darkrainbow.mat')
%set(0,'DefaultFigureColormap',darkrainbow);


