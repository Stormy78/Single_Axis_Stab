function plotContrlPerf_func(P, C, H, Kt, bode_options, nichols_options, loopOnlyFlag)


[L, S,T, Tu, Td] = getKeyFunctions_func(P, C, H ,Kt);

f_BW = bandwidth(T)/(2*pi);

[Gm, Pm, Wcg, Wcp] = margin(L);

%%
figure('Position',[0 0 1200 600])

subplot(121)
bodeplot(L, bode_options);
title(sprintf('Loop Bode - Gm = %.1f[dB] @ %.1f[Hz], Pm = %.1f @ %.1f[Hz]',...
    mag2db(Gm), Wcg/(2*pi), Pm, Wcp/(2*pi)), 'FontSize', 12)

set(findobj(gcf, 'Type', 'Line'), 'LineWidth', 2)
set(findobj(gcf, 'Type', 'Axes'), 'Fontsize', 12)

subplot(122)
nicholsplot(L, nichols_options);
title('Loop Nichols', 'FontSize', 12)

set(findobj(gcf, 'Type', 'Line'), 'LineWidth', 2)
set(findobj(gcf, 'Type', 'Axes'), 'Fontsize', 12)

%%
if ~loopOnlyFlag
    
    figure('Position',[0 0 1200 800])
    
    subplot(221)
    b1 = bodeplot(S, T, bode_options);
    setoptions(b1,'PhaseVisible','off');
    legend('S - function', 'T - function', 'Fontsize', 10)
    title(sprintf('Reference Track BW = %.1f [Hz]', f_BW), 'FontSize', 12)
    
    subplot(223)
    b2 = bodeplot(Td, P, bode_options);
    setoptions(b2,'PhaseVisible','off');
    legend({'$T_{D} Rej.$', '$P/K_{T}$'}, 'Interpreter', 'latex','Fontsize', 10, 'Location', 'best');
    title('Dist. Reject.', 'FontSize', 12)
    
    subplot(222)
    stepplot(T, Td);
    legend({'step r $\rightarrow$ y','step d $\rightarrow$ y'}, 'Interpreter', 'latex', 'Location', 'best');
    title('Step Response', 'FontSize', 12)
    set(gca, 'FontSize', 12)
    grid minor
    
    subplot(224)
    stepplot(Tu);
    title('step r $\rightarrow$ u', 'Interpreter','latex', 'FontSize', 12)
    set(gca, 'FontSize', 12);
    grid minor
    
    set(findobj(gcf, 'Type', 'Line'), 'LineWidth', 2)
    set(findobj(gcf, 'Type', 'Axes'), 'Fontsize', 12)
    
end
end

