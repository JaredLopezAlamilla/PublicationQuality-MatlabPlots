# PublicationQuality-MatlabPlots
Contains matlab script for high quality matlab plots


This repository contains a colection of scripts for matlab.
The scripts will help to produce consistent aesthetics plots
for publication in maths, physics journals and others such a thesis project.

# Minimal example

once matlab has been initialized we can proceed to plot a dummy array

>> surf(Xdummy,Ydummy,Zdummy,'edgecolor','none');

>> [fig1,ax1]=UniformFigs3D(1);

>> HybridPDF_PNG3D(fig1,ax1);

>> save2pdf('Hybrid_Example.pdf','1','300');
