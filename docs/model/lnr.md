---
title: Linearization
layout: default
parent: Model
nav_order: 3
permalink: /model/linearize/
math: katex
---

***
# **Linearization**
***

For evaluating the system as well as design controllers to archive the desired purpose, the model should be linearize for applying classical methods  

## **1. Methology**

In mathematic, fixed point is the point where there is no transformation to the input.

$$f(\overline{c}) = \overline{c}$$

In the inverted pendulum, for the pole angle, there are two fixed-point: $\theta=0$ and $\theta=\pi$.

Consider $x$ is near the fixed point $\overline{x}$ as well as $\Delta{x}=x-\overline{x}\approx0$. Therefore, rewrite the nonlinear formula at $x$

$$
\dot{x} = f(x) = f(\overline{x}+\Delta{x})
$$

Apply Taylor series to approximate the $\dot{x}$

$$
\dot{x} 
=f(\overline{x}+\Delta{x})
\approx  
f(\overline{x}) + \frac{Df}{Dt}(\overline{x})\Delta{x} +  \frac{D^2f}{Dt^2}(\overline{x})\Delta{x}^2 + \frac{D^3f}{Dt^3}(\overline{x})\Delta{x}^3 + ...
\approx
\frac{Df}{Dt}(\overline{x})\Delta{x}
$$

Hence, the linear ODE solution is archived as

$$\rightarrow\boxed{ \dot{x} = \frac{Df}{Dt}(\overline{x})\Delta{x}}$$

Where $\frac{Df}{Dt}$ is the Jacobian matrix term


## **2. Nonlinear state space system**

From the inverted pendulum declare:

$$\frac{d}{dt}x = f(x,u,t)$$

Set all the state variables:

$$
    \begin{array}{l}
        x_1 = x \\
        x_2 = \dot{x} \\
        x_3 = \theta \\
        x_4 = \dot{\theta}
    \end{array}
$$

Hence, the state space equation of inverted pendulum can be expressed as:

$$
    \frac{d}{dt}x =
    \frac{d}{dt} 
        \begin{bmatrix}
        x_1 \\ x_2 \\ x_3 \\ x_4 
        \end{bmatrix} =
    \frac{d}{dt} 
        \begin{bmatrix}
        x \\ \dot{x} \\ \theta \\ \dot{\theta} 
        \end{bmatrix} = 
    \frac{d}{dt} 
        \begin{bmatrix}
        f_1 \\ f_2 \\ f_3 \\ f_4 
        \end{bmatrix}
$$

Where:

$$f_1 = x_2$$

$$f_2 = \frac{mlsin(\theta)\dot{\theta} - mgcos(\theta)sin(\theta)+u}{M+msin(\theta)^2}$$

$$f_3 = x_4$$
        
$$f_4 =  \frac{mlcos(\theta)sin(\theta)\dot{\theta} - (M+m)gsin(\theta) + ucos(\theta) }{ml+mlsin(\theta)^2-(M+m)l}$$

For the observe equation:

$$y = Cx = 
\begin{bmatrix}
    1&0&0&0\\
    0&0&1&0
\end{bmatrix}
\begin{bmatrix}
        x \\ \dot{x} \\ \theta \\ \dot{\theta} 
\end{bmatrix}
$$

## **3. Linearize system**

Consider $x_0 = \overline{x}$, $u_0 = 0$, $x = x_0 + \delta{x}$, $u = u_0 + \delta{u}$, expand first-order Taylor Series near fixed point $\overline{x}$:

$$
    \delta{\dot{x}} = f(x,u,t) = f(x_0+\delta{x},u,t)\approx \frac{Df}{Dx}(x_0,u,t)\delta{x} + \frac{Df}{Du}(\overline{x},u,t)\delta{u} = A\delta{x} + B\delta{u}
$$

Expand Jacobian matrix at $x_0$:

$$
\frac{Df}{Dx} = 
    \begin{bmatrix}
        \frac{d}{dx}f_1 & \frac{d}{d\dot{x}}f_1 & \frac{d}{d\theta}f_1 & \frac{d}{\dot{d\theta}}f_1  \\
        \frac{d}{dx}f_2 & \frac{d}{d\dot{x}}f_2 & \frac{d}{d\theta}f_2 & \frac{d}{\dot{d\theta}}f_2  \\
        \frac{d}{dx}f_3 & \frac{d}{d\dot{x}}f_3 & \frac{d}{d\theta}f_3 & \frac{d}{\dot{d\theta}}f_3  \\
        \frac{d}{dx}f_4 & \frac{d}{d\dot{x}}f_4 & \frac{d}{d\theta}f_4 & \frac{d}{\dot{d\theta}}f_4
    \end{bmatrix} =
    \begin{bmatrix}
        0 & 1 & 0 & 0 \\
        0 & 0 & -\frac{mg}{M} & 0 \\
        0 & 0 & 0 & 1 \\
        0 & 0 & \frac{M+m}{Ml} & 0 
    \end{bmatrix}
$$

$$
\frac{Df}{Du} =
    \begin{bmatrix}
        \frac{d}{du}f_1 \\
        \frac{d}{du}f_2 \\
        \frac{d}{du}f_3 \\
        \frac{d}{du}f_4
    \end{bmatrix} =
    \begin{bmatrix}
        0 \\
        \frac{1}{M} \\
        0 \\
        -\frac{1}{Ml}
    \end{bmatrix}
$$

Hence, state-space of linearized-system is:

$$
\delta{\dot{x}} = 
    \begin{bmatrix}
        0 & 1 & 0 & 0 \\
        0 & 0 & -\frac{mg}{M} & 0 \\
        0 & 0 & 0 & 1 \\
        0 & 0 & \frac{M+m}{Ml} & 0 
    \end{bmatrix}\delta{x} + 
    \begin{bmatrix}
        0 \\
        \frac{1}{M} \\
        0 \\
        -\frac{1}{Ml}
    \end{bmatrix}\delta{u} \\
    y = C\delta{x} = 
    \begin{bmatrix}
        1&0&0&0\\
        0&0&1&0
    \end{bmatrix}\delta{x}
$$

Substitude $M=2.4$, $m=0.23$, $l=0.36$ and $g=9.8$ to state-space:

$$
\delta{\dot{x}} = 
    \begin{bmatrix}
        0 & 1 & 0 & 0 \\
        0 & 0 & -\frac{1127}{1200} & 0 \\
        0 & 0 & 0 & 1 \\
        0 & 0 & \frac{263}{8640} & 0 
    \end{bmatrix}\delta{x} + 
    \begin{bmatrix}
        0 \\
        \frac{5}{12} \\
        0 \\
        -\frac{125}{108}
    \end{bmatrix}\delta{u} \\
    y = C\delta{x} = 
    \begin{bmatrix}
        1&0&0&0\\
        0&0&1&0
    \end{bmatrix}\delta{x}
$$