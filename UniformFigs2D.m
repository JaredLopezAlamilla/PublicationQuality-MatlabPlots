function [fig1,ax1] =UniformFigs2D(num)
% This function creates uniform size figures created by: plot, contour, quiver
% the final size is perfect for 2column journals, e.g., APSjournals: PRE, PRL,
% >> [fig1,ax1]=UniformFigs2D(1); % will resize figure number 1 and save handles
    fig1=figure(num);
    ax1=gca;
    set(ax1,'ActivePositionProperty','Position');

    %------------ Postion relative to screen & window size ---------------------------
    %-- set(fig1,'Position', [Xo Yo width height]);
    set(fig1,'Units','points');
    set(fig1, 'OuterPosition', [10 30 614 544]); 
    % Final figure size after export is:
    %    {width-12pt, height-69pt}                                             
    %------------ axis postion and size   ---------------------------
    %-- set(ax1,'Position', [Xo Yo width height]);
    set(ax1,'Units','points');
%     set(ax1,'Position', [80 58 414 370]); % good for 2column A4size journal
    set(ax1,'Position', [80 67.5 414 370]); % good for 2column Lettersize journal
%     set(ax1,'Position', [80 58 414 240]); % good size for subplot
end
