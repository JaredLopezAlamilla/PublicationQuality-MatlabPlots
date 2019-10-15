function [fig1,ax1] =UniformFigs3D(num)

    fig1=figure(num);
    ax1=gca;
    set(ax1,'ActivePositionProperty','Position');

    %------------ Posicion y Tamaños de la ventana ---------------------------
    %-- set(fig1,'Position', [Xo Yo Ancho Alto]);
    set(fig1,'Units','points');
    set(fig1, 'OuterPosition', [10 30 581 546.5]);
    %Final size after export is
    %    {Ancho-12, Alto-69}
    %------------ Posicion y Tamaños de los ejes   ---------------------------
    %-- set(ax1,'Position', [Xo Yo Ancho Alto]);
    set(ax1,'Units','points');
    set(ax1,'Position', [98 88 390 347]);
%     set(ax1,'Position', [98 84 390 347]);
%     set(ax1,'Position', [80 58 414 240]); %a good subplot




end
