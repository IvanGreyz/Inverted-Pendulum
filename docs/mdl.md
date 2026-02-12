---
title: Modeling
layout: default
nav_order: 2
math: katex
---

# **Modeling**

In this section, a model descript from real inverted pendulum is contructed.

![Cart Pole]({{ site.baseurl }}/assets/img/InvertedPendulum.png)

{: .text-center}
*Figure 1.1. Inverted Pendulum*

## Free-cut method
![Free-cut]({{ site.baseurl }}/assets/img/Free-cut.png)

{: .text-center}
*Figure 1.2. Free-cut model*

From the *Figure 1.1*, the model is decomposited into two rigid bodies, which create Free-cut model (as *Figure 1.2*). There is a force $\vec{F}$  which is the force acting between cart and pole.

**Cart Model**

First, look at the cart model, as $2^{nd}$ Newton's law declared:

$$Ma = \sum_{n=1}^{\infty}{F} = \vec{P}_M + \vec{N} + \vec{F} + \vec{U}$$

Where $a$ is the acceleration of cart. Decomposite $a_M$ into $x$, $y$ direction:

$$
    \boxed{
        \left.
            \begin{array}{l}
                M\ddot{x} = F_x + U \\
                M\ddot{y} = -P + N + F_y
            \end{array}
        \right.        
    }
$$

**Pole model**
Next, analysis pole model. The pole relatively move around the position of the cart.

By applying $2^{nd}$ Newton's law:

$$ma_p = \sum_{n=1}^{\infty}{F} = \vec{P}_m + \vec{F}$$

The $a_p$ is the acceleration of pole from cart position. Decomposite $a_p$ to get:

$$
    \boxed{
        \left.
            \begin{array}{l}
                m\ddot{x}_p = F_x \\
                m\ddot{y}_p = -P + N + F_y
            \end{array}
        \right.        
    }
$$

The torque formula:

$$\sum{\tau} = \frac{d\vec{H}}{dt} + \vec{v} \times \vec{R}_{CP}$$

Where $\frac{d\vec{H}}{dt}$ is the time rate change of angular momentum of pole rod, $\vec{v} \times \vec{R}_{CP}$ is the time rate change of angular momentum of pole rod causing by cart motion, $\vec{v}$ is the velocity of cart and $\vec{R}_{CP}$ is the displacement vector from cart to pole.

Due to assumpsion that the rod is  as no weight and the pole is a particle, hence $\frac{d\vec{H}}{dt} = 0$. The torque equation is:

$$\boxed{F_x cos(\theta) - F_y sin(\theta) = mgsin(\theta)l}$$

**Kinetics relation**
From the figure, the geometry relation of cart and pole is:
$$R_{P} = R_C+lR_{CP}$$ Decomposite this equation into x,y components:

$$
    \begin{array}{l}
        x_p = x + lcos(\theta) \\
        y_p = y + lsin(\theta)
    \end{array}
$$  

Next, derivative twice to get the acceleration relation:

$$
\boxed{
    \begin{array}{l}
        \ddot{x}_p = \ddot{x} - lsin(\theta)\ddot{\theta} - lcos(\theta)\dot{\theta}^2 \\
        \ddot{y}_p = \ddot{y} + lcos(\theta)\ddot{\theta} - lsin(\theta)\dot{\theta}^2
    \end{array}
}
$$

**Result**
By transform the equations of motion from **Cart model, Pole model** and **Kinetics relation**, the equations of motion descripe the $\ddot{x}$ motion and $\ddot{\theta}$ motion is:

$$\boxed{\ddot{x} = \frac{ml(sin(\theta)\dot{\theta} - mgcos(\theta)sin(\theta)+u)}{M+msin(\theta)^2}}$$

$$\boxed{\ddot{\theta} = \frac{ml(cos(\theta))sin(\theta)\dot{\theta} - (M+m)gsin(\theta) + ucos(\theta) }{mlcos(\theta)^2-(M+m)l}}$$


## Projected Newton-Euler method

## Larange method