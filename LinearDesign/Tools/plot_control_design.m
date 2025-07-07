function [] = plot_control_design(DesignStruct, loopPlotFlag, clResponsePlotFlag, controllersPlotFlag)

%[] = plot_control_design(DesignStruct, loopPlotFlag, clResponsePlotFlag, controllersPlotFlag)
% DesignStruct - struct constructed using get_design_functions
% loopPlotFlag - do plot open loop flag
% clResponsePlotFlag - do plot closed loop response
% controllersPlotFlag - do plot controllers bode
%% Plots Control Theory Related Functions

opt_bode = evalin('base', 'opt_bode');
opt_nichols = evalin('base', 'opt_nichols');
opt_time = evalin('base', 'opt_time');


%% Loop
if loopPlotFlag
    figure('Name','Open Loop', 'Position',[0 0 1200 600])
    subplot(121)
    margin(DesignStruct.L)
    xlim([0.1 500])
    set(findobj(gcf, 'Type', 'Axes'), 'Fontsize', 12)
    grid minor
    
    legend('show')
    subplot(122)
    nicholsplot(DesignStruct.L, opt_nichols)
    legend('show')
    xlim([-360 0])

    set_linewidth_ctrl(3)
end

%%
if controllersPlotFlag

    figure('Name','Controllers', 'Position',[0 0 1200 600])
    
    subplot(121)
    bodeplot(DesignStruct.C , opt_bode)
    title(sprintf('%s - Bode Plot', DesignStruct.C.Name));


    subplot(122)
    bodeplot(DesignStruct.F , opt_bode)
    title(sprintf('%s - Bode Plot', DesignStruct.F.Name));

    ax = findobj(gcf, 'type', 'axes', '-and', {'Visible', 'on'});

    for i = 1:numel(ax)
        legend(ax(i), 'show', 'Location', 'best', 'ItemHitFcn', @clickLegendToHide)
    end

    set_linewidth_ctrl(3)

end



%%



if clResponsePlotFlag

    opt_bode.PhaseVisible = 'off';

    figure('Name','Reference Tracking', 'Position',[0 0 1200 800])
    
    subplot(321)
    bodeplot(DesignStruct.T_r2y , DesignStruct.T_r2ym, DesignStruct.T_r2e, opt_bode);
    title('Reference Track Bode Plot')
    xlim([0.1 500])

    subplot(322)
    stepplot(DesignStruct.T_r2y, DesignStruct.T_r2u, opt_time)
    title('Reference Track Step Response')

    subplot(323)
    bodeplot(DesignStruct.T_d2y , DesignStruct.P, opt_bode);
    title('Disturbance Rejection - PlotBode')
    xlim([0.1 500])

    subplot(324)
    stepplot(DesignStruct.T_d2y, DesignStruct.T_d2u , opt_time)
    title('Disturbance Rejection - Step Response')

    subplot(325)
    bodeplot(DesignStruct.T_ym2u, DesignStruct.T_n2u, opt_bode)
    title('Noise Sensetivity - PlotBode')
    xlim([0.1 500])

    subplot(326)
    stepplot(DesignStruct.T_ym2u, DesignStruct.T_n2u, opt_time)
    title('Noise Sensetivity - PlotBode')

    opt_bode.PhaseVisible = 'on';

    ax = findobj(gcf, 'type', 'axes', '-and', {'Visible', 'on'});

    for i = 1:numel(ax)
        legend(ax(i), 'show', 'Location', 'best', 'ItemHitFcn', @clickLegendToHide)
    end

    set_linewidth_ctrl(3)

end



end