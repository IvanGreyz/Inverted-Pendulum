---
title: Home
layout: default
nav_order: 1
---

---
# **Inverted Pendulum**
---

This is a project from class Introduction to Modern control in Ho Chi Minh University - University of Technology.

![Cart Pole]({{ site.baseurl }}/assets/img/InvertedPendulum.png)



Inline: $ \dot{x} = Ax + Bu $

Block:

$$
J(\theta) = \sum_{t=0}^{T} \gamma^t r_t
$$

More tests:

- Quadratic: $ax^2 + bx + c = 0$
- Roots: $x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}$
- Vector: $\mathbf{x}_{k+1}=A\mathbf{x}_k+B\mathbf{u}_k$

$$
\mathbf{x}(t)=e^{At}\mathbf{x}(0)+\int_0^t e^{A(t-\tau)}B\mathbf{u}(\tau)\,d\tau
$$

$$
\dot{x}_1 = x_2,\quad
\dot{x}_2 = \frac{1}{m}\left(u - b x_2 - k x_1\right)
$$
