dt = 0.001;

% Check for exist simulation variables
if ~exist("out")
    disp("Simulation did not run yet");
    return
end

% Extract value
tSeries   = out.get("tout");
variables = out.get("var");
x    = variables.data(:,1);
the  = variables.data(:,3);

% ===== extra signals for text =====
dx   = variables.data(:,2);
dthe = variables.data(:,4);

exF  = out.get("exF");
if numel(F) == 1
    F = repmat(F, numel(tSeries), 1);
end

% Plot variables
lPole = 0.23;
sCart = [0.16 0.08];

% Init figure
set(groot,'defaultFigureWindowStyle','normal');
fig = figure("Name","Cart Pole","Color","white","WindowStyle","normal");
clf(fig,'reset');

% Init axes
ax0 = axes("Parent",fig);
grid(ax0,"on"); hold(ax0,"on");

% View setup
axis(ax0,"equal");
ylim(ax0,[-0.2, 0.4]);
xlim(ax0,[-1, 1]);
xlabel(ax0,"x (m)");
ylabel(ax0,"y (m)");

% ===== colors =====
cartColor = [0.85 0.33 0.10];   % dark orange
poleColor = [0.00 0.45 0.15];   % dark green

% Init plot objects (ax0)
cartRec = rectangle(ax0,"Position",[x(1)-sCart(1)/2, 0, sCart(1), sCart(2)], ...
                        "FaceColor",cartColor, "EdgeColor","k");
gndLine = line(ax0,[-10 10],[0 0],"LineWidth",1,"Color",'black'); %#ok<NASGU>
rodLine = line(ax0,[NaN NaN],[NaN NaN],"LineWidth",1.2, "Color","k");   % rod black
poleDot = plot(ax0,NaN,NaN,"o","MarkerFaceColor",poleColor, ...
                        "MarkerEdgeColor",poleColor,"MarkerSize",9);  % pole dark green

% ===== info text (multi-line) =====
infoTxt = text(ax0,0.02,0.98,"", ...
    "Units","normalized", ...
    "VerticalAlignment","top", ...
    "FontName","Consolas", ...
    "FontSize",10, ...
    "BackgroundColor",[1 1 1 0.7]);

% ===== frame rate control by simulation time =====
t0 = tic;

% Animation loop
for i = 1:length(tSeries)

    % cart
    set(cartRec,"Position",[x(i)-sCart(1)/2, 0, sCart(1), sCart(2)]);

    % pivot at top of cart
    xPivot = x(i);
    yPivot = sCart(2);

    % Theta: angle from +i (x-axis) to pole rod
    xTip = xPivot + lPole*cosd(the(i));
    yTip = yPivot + lPole*sind(the(i));

    set(rodLine,"XData",[xPivot xTip], "YData",[yPivot yTip]);
    set(poleDot,"XData",xTip, "YData",yTip);

    % keep view centered
    xlim(ax0,[x(i)-1, x(i)+1]);

    % ===== text per line (as requested) =====
    infoTxt.String = sprintf([ ...
        "t = %.4f s\n = %.4f m,  dx = %.4f m/s\ndtheta = %.4f deg/s\nF = %.4f N"], ...
        tSeries(i), ...
        x(i), dx(i), ...
        dthe(i), ...
        F(i));

    drawnow;

    % real-time pacing (scaled by dt)
    targetWall = dt * tSeries(i);
    while toc(t0) < targetWall
        pause(0.001);
    end
end
