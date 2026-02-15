---
title: Model Verification
layout: default
parent: Model
nav_order: 2
permalink: /model/Model-Verification/
math: katex
---

# **Model Verification**

Veriffy mathematics formula 

## **1. Oscillation**
By experiment, with no external force, the pendulum show that it oscillates around the stable point with amplitude smaller over time. Therefore, some conclusions are declared:

> 1. If there is no external force and free loss, the pendulum osillates forever with constant trajectory.
> 2. The maximum height $H_{max} = H_0$ with $H_0$ is the intial height when drop the pole.
> 3. In a period, the pole reach $H_{max}$ twice. Time for pole to reach next $H_{max}$ is constant.
> 4. The pole reach $V_{max}$ when pole at $H_{min}$ and $v=0$ when reach $H_{max}$.

## **2. Center of Gravity**

Consider there is no loss and no drive force. Call $x_c, y_c$ is the center of gravity position. By the conservation of mometum law:

$$ \frac{d}{dt}p_c = \sum{F_{ext}} = N $$

$$
    \rightarrow
        \left\{
            \begin{array}{l}
                \vec{p}_{x_c}(t) = \int_{0}^{t}{F_{ext}}d\tau = 0 \\
                \vec{p}_{y_c}(t) = \int_{0}^{t}{F_{ext}}d\tau = \int_{0}^{t_0}Nd\tau 
            \end{array}
        \right.
$$

Analysis 

Decomposite $\vec{p}_{x_c}$ into $\vec{p}_{x}$ and $\vec{p}_{x_p}$:

$$  \vec{p}_{x_c}(t) = \vec{p}_x + \vec{p}_{x_p} = 0 $$ 

Therefore, the motion of cart and pole has no affect to the center of mass of the system. 

$$\vec{v}_{x_c} = 0$$

$$\rightarrow \vec{x}_c = x_c(0)$$

Hence, the position of center of mass of the pole is constant from the pole dropping moment  