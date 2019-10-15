function HybridPDF_PNG3D(Fig,Axes,KeepObjects, RelativePosition, Draft, Key)
% This function cotains intructions to produce and
% hybrid PDF-PNG 3D image within matlab

% When a surface plot or mesh plot in matlab is generated from big array  
% the direct exportation produce artifacts in the PDF image that are unpleasant
% Also the size of the produced vectorial image can exceed the 20Mb making it 
% slow to load into a compiled pdf such as an article or book
% For this purpose a hybrid file is better for publication
if nargin < 3
    KeepObjects = [];
end
if nargin < 4
    RelativePosition = [0 0 1 1];
end
if nargin < 5
    Draft = false;
end
if nargin < 6
    Key = '';
end

Figure = Axes.Parent;
FigureInnerWH = Figure.InnerPosition([3 4 3 4]);
PixelPosition = round(RelativePosition .* FigureInnerWH);

if isempty(Key)
    OverlayAxes = axes(Figure, 'Units', 'Normalized', 'Position', PixelPosition ./ FigureInnerWH);
    if Draft
        OverlayAxes.Box = 'on';
        OverlayAxes.Color = 'none';
        OverlayAxes.XTick = [];
        OverlayAxes.YTick = [];
        OverlayAxes.HitTest = 'off';
    else
        uistack(OverlayAxes, 'bottom');
        OverlayAxes.Visible = 'off';
    end
    setappdata(Figure, 'BitmapRenderOriginalVisibility', get(Axes.Children, 'Visible'));

    Axes.CLimMode = 'manual';
    Axes.XLimMode = 'manual';
    Axes.YLimMode = 'manual';
    Axes.ZLimMode = 'manual';

    hManager = uigetmodemanager(Figure);
    [hManager.WindowListenerHandles.Enabled] = deal(false);
    set(Figure, 'KeyPressFcn', @(f, e) BitmapRender(gca, KeepObjects, RelativePosition, Draft, e.Key));
elseif strcmpi(Key, 'space')
    OverlayAxes = findobj(Figure, 'Tag', 'BitmapRenderOverlayAxes');
    delete(get(OverlayAxes, 'Children'));
    OriginalVisibility = getappdata(Figure, 'BitmapRenderOriginalVisibility');
    [Axes.Children.Visible] = deal(OriginalVisibility{:});
else
    return;
end

if Draft
    return;
end

Axes.Visible = 'off';


KeepObjectsVisibility = get(KeepObjects, 'Visible');
[KeepObjects.Visible] = deal('off');

drawnow;
% ---- Render  resolution of surface ---- 
% % print('-dpng','-r600','plot.png');  % option '-r600' implies 600dpi
% % print('-dpng','-r150','plot.png'); 
print('-dpng','-r300','plot.png'); 
Frame=imread('plot.png');
% ---- Takes out Alpha channel ----
mask=zeros(size(Frame(:,:,1)) );
mask(all( Frame~=255, 3 ) ) = 1;
imwrite(Frame, 'plotb.png', 'Alpha',mask);
[Frame,~,alphachannel]=imread('plotb.png');

[Axes.Children.Visible] = deal('off');
Axes.Visible = 'on';
Axes.Color = 'none';
if numel(KeepObjects) == 1
    KeepObjects.Visible = KeepObjectsVisibility;
else
    [KeepObjects.Visible] = deal(KeepObjectsVisibility{:});
end

Image = imagesc(OverlayAxes, Frame,'AlphaData', alphachannel);
% % Image = imagesc(OverlayAxes, Frame);

uistack(Image, 'top');
OverlayAxes.Tag = 'BitmapRenderOverlayAxes';
OverlayAxes.Visible = 'off';
Fig.Renderer='Painters';
uistack(Axes, 'down');
end
