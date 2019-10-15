# PublicationQuality-MatlabPlots
----
Contains matlab script for high quality matlab plots


This repository contains a colection of scripts for matlab.
The scripts will help to produce consistent aesthetics plots
for publication in maths, physics journals and others such a thesis project.

The functions and scripts should be added to the matlab path for easier use.
In particular startup.m shoul be located inside the UserName/Documents/MATLAB folder.

Finaly function this links to [save2pdf](http://mathworks.com/matlabcentral/fileexchange/16179-save2pdf) function (not of my ownership).

## Minimal example
****

once matlab has been initialized we can proceed to plot a dummy array

\>\> surf(Xdummy,Ydummy,Zdummy,'edgecolor','none');

\>\> [fig1,ax1]=UniformFigs3D(1);

\>\> HybridPDF_PNG3D(fig1,ax1);

\>\> save2pdf('Hybrid_Example.pdf','1','300');
