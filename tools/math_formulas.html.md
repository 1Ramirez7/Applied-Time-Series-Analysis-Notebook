---
title: "Formulas"
subtitle: "Using Simple Math"
format: 
  html:
    error: false
    message: false
    warning: false
    embed-resources: true
    toc: true
    code-fold: true
---







**Autoregressive (AR) Model** 

4.3 lesson (book reference 4.15)

::: {.callout-note icon="false" title="Definition of an Autoregressive (AR) Model"}
The time series $\{x_t\}$ is an **autoregressive process of order** $p$, denoted as $AR(p)$, if $$
  x_t = \alpha_1 x_{t-1} + \alpha_2 x_{t-2} + \alpha_3 x_{t-3} + \cdots + \alpha_{p-1} x_{t-(p-1)} + \alpha_p x_{t-p} + w_t ~~~~~~~~~~~~~~~~~~~~~~~ (4.15)
$$

where $\{w_t\}$ is white noise and the $\alpha_i$ are the model parameters with $\alpha_p \ne 0$.
:::


**Exploring AR(1) Models** Lesson 4.3. 

**Definitino**
Recall that an $AR(p)$ model is of the form $$
  x_t = \alpha_1 x_{t-1} + \alpha_2 x_{t-2} + \alpha_3 x_{t-3} + \cdots + \alpha_{p-1} x_{t-(p-1)} + \alpha_p x_{t-p} + w_t
$$ So, an $AR(1)$ model is expressed as $$
  x_t = \alpha x_{t-1} + w_t
$$ where $\{w_t\}$ is a white noise series with mean zero and variance $\sigma^2$.



**Second-Order Properties of an AR(1) Model** Lesson 4.3.

:::: {.callout-note icon="false" title="Second-Order Properties of an $AR(1)$ Model"}
If $\{x_t\}_{t=1}^n$ is an $AR(1)$ prcess, then its the first- and second-order properties are summarized below.

$$
\begin{align*}
  \mu_x &= 0 \\  
  \gamma_k = cov(x_t, x_{t+k}) &= \frac{\alpha^k \sigma^2}{1-\alpha^2}
\end{align*}
$$

::: {.callout-tip title="Click here for a proof of the equation for $cov(x_t,x_{t+k})$" collapse="true"}
Why is $cov(x_t, x_{t+k}) = \dfrac{\alpha^k \sigma^2}{1-\alpha^2}$?

If $\{x_t\}$ is a stable $AR(1)$ process (which means that \$\|\alpha\|\<1) can be written as:

\begin{align*}
  (1-\alpha \mathbf{B}) x_t &= w_t \\
  \implies x_t &= (1-\alpha \mathbf{B})^{-1} w_t \\
    &= w_t + \alpha w_{t-1} + \alpha^2 w_{t-2} + \alpha^3 w_{t-3} + \cdots \\
    &= \sum\limits_{i=0}^\infty \alpha^i w_{t-i}
\end{align*}

From this, we can deduce that the mean is

$$
  E(x_t) 
    = E\left( \sum\limits_{i=0}^\infty \alpha^i w_{t-i} \right)
    = \sum\limits_{i=0}^\infty \alpha^i E\left( w_{t-i} \right)
    = 0
$$

The autocovariance is computed similarly as:

\begin{align*}
  \gamma_k = cov(x_t, x_{t+k}) 
    &= cov \left( 
      \sum\limits_{i=0}^\infty \alpha^i w_{t-i}, \\
      \sum\limits_{j=0}^\infty \alpha^j w_{t+k-j} \right) \\
    &= \sum\limits_{j=k+i} \alpha^i \alpha^j cov ( w_{t-i}, w_{t+k-j} ) \\
    &= \alpha^k \sigma^2 \sum\limits_{i=0}^\infty \alpha^{2i} \\
    &= \frac{\alpha^k \sigma^2}{1-\alpha^2}
\end{align*}

See Equations (2.15) and (4.2).
:::
::::




**Characterisitc Equation** 

Lesson 4.3

::: {.callout-note icon="false" title="Definition of the Characteristic Equation"}
Treating the symbol $\mathbf{B}$ formally as a number (either real or complex), the polynomial

$$
  \theta_p(\mathbf{B}) x_t = \left( 1 - \alpha_1 \mathbf{B} - \alpha_2 \mathbf{B}^2 - \cdots - \alpha_p \mathbf{B}^p \right) x_t
$$

is called the **characteristic polynomial** of an AR process.

If we set the characteristic polynomial to zero, we get the **characteristic equation**:

$$
  \theta_p(\mathbf{B}) = \left( 1 - \alpha_1 \mathbf{B} - \alpha_2 \mathbf{B}^2 - \cdots - \alpha_p \mathbf{B}^p \right) = 0
$$
:::



