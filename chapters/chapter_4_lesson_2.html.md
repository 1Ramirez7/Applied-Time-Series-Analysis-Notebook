---
title: "White Noise and Random Walks - Part 2"
subtitle: "Chapter 4: Lesson 2"
format: 
  html:
    error: false
    message: false
    warning: false
    embed-resources: true
    toc: true
    code-fold: true
---





Learning Outcomes

**Characterize the properties of a random walk**
- Define the second order properties of a random walk
- Define the backward shift operator
- Use the backward shift operator to state a random walk as a sequence of white noise realizations
- Define a random walk with drift (book pg 77)
    - So the drift is like the random variable? That fits random variable. volatility is randomness. Except that for this Xt, the drift is part of the total for Xt, while the random component is what the classical decomposition can not account for. 
    -  Company stockholders generally expect their investment to increase in value despite the volatility of financial markets. The random walk model can be adapted to allow for this by including a drift parameter &. Closing prices (US dollars) for Hewlett-Packard Company stock for 672 trading days up to June 7, 2007 are read into R and plotted (see the code below and Fig. 4.8). The lag 1 differences are calculated using diff() and plotted in Figure 4.9. The correlogram of the differences is in Figure 4.10, and they appear to be well modelled as white noise. The mean of the differences is 0.0399, and this is our estimate of the drift parameter. The standard deviation of the 671 differences is 0.460, and an approximate 95% confidence interval for the drift parameter is [0.004, 0.075]. Since this interval does not include 0, we have evidence of a positive drift over this period.
    - How to calculate random drift parameter? 


**Simulate realizations from basic time series models in R**
Simulate a random walk
Plot a random walk

**Fit time series models to data and interpret fitted parameters**
Motive the need for differencing in time series analysis
Define the difference operator
Explain the relationship between the difference operator and the backward shift operator
Test whether a series is a random walk using first differences
Explain how to estimate a random walk with increasing slope using Holt-Winters
Estimate the drift parameter of a random walk
