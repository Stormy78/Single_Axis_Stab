function [opt_time, opt_bode, opt_nichols] = setPlots
%%
opt_time = timeoptions;
opt_time.Grid = 'on';
opt_time.XLabel.FontSize = 12;
opt_time.YLabel.FontSize = 12;
opt_time.TickLabel.FontSize = 12;
opt_time.Title.FontSize = 15;

opt_bode = bodeoptions;
opt_bode.Grid = 'on';
opt_bode.FreqUnits = 'Hz';
opt_bode.XLabel.FontSize = 12;
opt_bode.YLabel.FontSize = 12;
opt_bode.TickLabel.FontSize = 12;
opt_bode.Title.FontSize = 15;
opt_bode.XLim = [0.1 500];
% opt_bode.PhaseWrapping = 'on';

opt_nichols = nicholsoptions;
opt_nichols.FreqUnits = 'Hz';
opt_nichols.Grid = 'on';
opt_nichols.XLabel.FontSize = 12;
opt_nichols.YLabel.FontSize = 12;
opt_nichols.TickLabel.FontSize = 12;
opt_nichols.Title.FontSize = 15;
% opt_nichols.PhaseWrapping = 'on';
end