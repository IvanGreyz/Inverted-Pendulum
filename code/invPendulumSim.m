dt = 0.001;

% ===== Check simulation output =====
if ~exist("out","var") || isempty(out)
    disp("Simulation did not run yet");
    return
end

% ===== Extract signals =====
tSeries   = out.get("tout");
variables = out.get("var");

x    = variables.data(:,1);   % cart position (m)
dx   = variables.data(:,2);   % cart velocity (m/s)

the  = variables.data(:,3);   % theta (DEGREE)  <<<
dthe = variables.data(:,4);   % theta_dot (DEG/s)

exF = out.get("exF");
F   = exF.Data;
if numel(F) == 1
    F = repmat(F, numel(tSeries), 1);
end

% ===== Geometry =====
lPole = 0.23;          % pole length (m)
sCart = [0.16 0.08];   % [width height] (m)

% ===== Figure/Axes =====
set(groot,'defaultFigureWindowStyle','normal');
fig = figure("Name","Cart Pole (theta from vertical)","Color","white","WindowStyle","normal");
clf(fig,'reset');

ax0 = axes("Parent",fig);
grid(ax0,"on"); hold(ax0,"on");
axis(ax0,"equal");

ylim(ax0,[-0.3, 0.45]);
xlim(ax0,[-1, 1]);
xlabel(ax0,"x (m)");
ylabel(ax0,"y (m)");

% ===== Colors =====
cartColor = [0.60 0.20 0.70];   % purple-ish
massColor = [0.10 0.35 0.85];   % blue

% ===== Static ground =====
line(ax0,[-10 10],[0 0],"LineWidth",1.2,"Color","k"); % ground

% ===== Graphics objects =====
cartRec = rectangle(ax0,"Position",[x(1)-sCart(1)/2, 0, sCart(1), sCart(2)], ...
    "FaceColor",cartColor,"EdgeColor","k","LineWidth",1.0);

% Pivot marker (point P)
pivotDot = plot(ax0,NaN,NaN,"ko","MarkerFaceColor","k","MarkerSize",4);

% Rod + mass
rodLine  = line(ax0,[NaN NaN],[NaN NaN],"LineWidth",2.0,"Color",[0 0 0]);
massDot  = plot(ax0,NaN,NaN,"o","MarkerFaceColor",massColor,"MarkerEdgeColor","k","MarkerSize",10);

% Info text (theta in degree)
infoTxt = text(ax0,0.02,0.98,"", ...
    "Units","normalized","VerticalAlignment","top", ...
    "FontName","Consolas","FontSize",10, ...
    "BackgroundColor",[1 1 1 0.75]);

% ===== Real-time pacing =====
t0 = tic;

for i = 1:numel(tSeries)

    % Cart position (bottom at y=0)
    set(cartRec,"Position",[x(i)-sCart(1)/2, 0, sCart(1), sCart(2)]);

    % Pivot at top center of cart (point P)
    xP = x(i);
    yP = sCart(2);
    set(pivotDot,"XData",xP,"YData",yP);

    % ---- IMPORTANT: theta is measured from +Y (vertical) as in the provided plot ----
    % x offset =  l*sin(theta)
    % y offset =  l*cos(theta)
    xM = xP + lPole * sind(the(i));
    yM = yP + lPole * cosd(the(i));

    % Rod and mass
    set(rodLine,"XData",[xP xM],"YData",[yP yM]);
    set(massDot,"XData",xM,"YData",yM);

    % Keep view centered on cart
    xlim(ax0,[x(i)-1, x(i)+1]);

    % Info text (degree)
    infoTxt.String = sprintf(["t = %.4f s\nx = %.4f m,  dx = %.4f m/s\ntheta = %.3f deg,  dtheta = %.3f deg/s\nF = %.4f N"], ...
        tSeries(i), x(i), dx(i), the(i), dthe(i), F(i));

    drawnow;

    % Wall-time pacing ~ dt
    targetWall = dt * tSeries(i);
    while toc(t0) < targetWall
        pause(0.001);
    end
end