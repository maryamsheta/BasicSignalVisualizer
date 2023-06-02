fig = uifigure("Name","Basic Signal Visualizer");
fig.Color = "white";

signals = ["", "Unit Step Signal", "Unit Impulse Signal", "Ramp Signal", "Exponential Signal Case One","Exponential Signal Case Two","Exponential Signal Case Three","Exponential Signal Case Four"];
dd = uidropdown(fig, "Items", signals, "Position", [150, 350, 300, 50], "Placeholder", "Choose A Signal");

dd.BackgroundColor = "white";
s1 = uistyle("BackgroundColor","white");
addStyle(dd,s1);

ax = uiaxes(fig, "Position", [90, 100, 400, 200]);
ax.Toolbar = [];
ax.Visible = false;

dd.ValueChangedFcn = @(src, event) plotSignal(ax, src.Value);

function plotSignal(ax, selectedSignal)

    cla(ax);
    ax.Visible = true;

    switch selectedSignal

        case "Unit Step Signal"
            n = -5:5;
            u = (n >= 0);
            stem(ax, n, u,"filled");
            xlabel(ax, "Time");
            ylabel(ax, "Amplitude");
            
        case "Unit Impulse Signal"
            n = -5:5;
            delta = zeros(size(n));
            delta(n == 0) = 1;
            stem(ax, n, delta,"filled");
            xlabel(ax, "Time");
            ylabel(ax, "Amplitude");
            
        case "Ramp Signal"
            n = -5:5;
            r = zeros(size(n));
            r(n >= 0) = n(n>=0);
            stem(ax, n, r,"filled");
            xlabel(ax, "Time");
            ylabel(ax, "Amplitude");
            
        case "Exponential Signal Case One"
            n = -5:5;
            C = 1;
            alpha = 2;
            x = C * alpha.^n;
            stem(ax, n, x,"filled");
            xlabel(ax, "Time");
            ylabel(ax, "Amplitude");

         case "Exponential Signal Case Two"
            n = -5:5;
            C = 1;
            alpha = 0.5;
            x = C * alpha.^n;
            stem(ax, n, x,"filled");
            xlabel(ax, "Time");
            ylabel(ax, "Amplitude");      

        case "Exponential Signal Case Three"
            n = -5:5;
            C = 1;
            alpha = -0.5;
            x = C * alpha.^n;
            stem(ax, n, x,"filled");
            xlabel(ax, "Time");
            ylabel(ax, "Amplitude");   
        
        case "Exponential Signal Case Four"
            n = -5:5;
            C = 1;
            alpha = -2;
            x = C * alpha.^n;
            stem(ax, n, x,"filled");
            xlabel(ax, "Time");
            ylabel(ax, "Amplitude");   
            
    end
end