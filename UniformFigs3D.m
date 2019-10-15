function [fig1,ax1] =UniformFigs3D(num)
% This function creates uniform size figures created by: mesh, surf, plot3
% the final size is perfect for 2column journals, e.g., APSjournals: PRE, PRL,
% >> [fig1,ax1]=UniformFigs3D(1); % will resize figure number 1 and save handles
    fig1=figure(num);
    ax1=gca;
    set(ax1,'ActivePositionProperty','Position');

    %------------ Position y window size ---------------------------
    %-- set(fig1,'Position', [Xo Yo width height]);
    set(fig1,'Units','points');
    set(fig1, 'OuterPosition', [10 30 581 546.5]);
    %Final size after export is
    %    {width-12pt, height-69pt}
    %------------ Axis position and size    ---------------------------
    %-- set(ax1,'Position', [Xo Yo width height]);
    set(ax1,'Units','points');
    set(ax1,'Position', [98 88 390 347]);
%     set(ax1,'Position', [98 84 390 347]);
%     set(ax1,'Position', [80 58 414 240]); %a good subplot




end
