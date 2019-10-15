function HybridPDF_PNG2D(Fig,Axes,c,KeepObjects, RelativePosition, Draft, Key)
% This function cotains intructions to produce and
% hybrid PDF-PNG 2D image within matlab

% When a density plot or contour plot in matlab is generated from big array the eps/pdf tools 
% the direct exportation produce artifacts in the PDF image that are unpleasant
% Also the size of the produced vectorial imaga can exceed the 20Mb
% For this purpose a hybrid file is better for publication
if nargin < 4
    KeepObjects = [];
end
if nargin < 5
    RelativePosition = [0 0 1 1];
end
if nargin < 6
    Draft = false;
end
if nargin < 7
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
c.Visible='off';

KeepObjectsVisibility = get(KeepObjects, 'Visible');
[KeepObjects.Visible] = deal('off');

drawnow;
% % Frame = getframe(Figure, PixelPosition); % captures Bitmap plot
% % print('-dpng','-r600','plot.png'); 
% % print('-dpng','-r250','plot.png'); 
print('-dpng','-r100','plot.png');
Frame=imread('plot.png');
% Frame1=imagesc(Frame);

[Axes.Children.Visible] = deal('off');
Axes.Visible = 'on';
c.Visible='on';
Axes.Color = 'none';
if numel(KeepObjects) == 1
    KeepObjects.Visible = KeepObjectsVisibility;
else
    [KeepObjects.Visible] = deal(KeepObjectsVisibility{:});
end

% % Image = imagesc(OverlayAxes, Frame.cdata);
Image = imagesc(OverlayAxes, Frame);
uistack(Image, 'bottom');
OverlayAxes.Tag = 'BitmapRenderOverlayAxes';
OverlayAxes.Visible = 'off';
Fig.Renderer='Painters';

end

