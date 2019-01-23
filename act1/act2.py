import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
df=pd.read_csv("tv.txt", sep=" ")
#1) mean and range
mean=df.tvhours.mean()
print("hour mean=",mean)

hour_min=df.tvhours.min()
print("hour min=",hour_min)

hour_max=df.tvhours.max()
print("hour max=",hour_max)

#2) yes-records with 14, 10, 10, which affects
plt.boxplot(df.tvhours)
plt.show()  

#3)
dfclean=df[df.tvhours<10]
mean_clean=dfclean.tvhours.mean()
print("hour mean cleaned=",mean_clean)
#4)
# 	tvhours 	obedience 	attitude
#tvhours 	1.000000 	-0.17882 	-0.084275
corr=dfclean.corr(method='pearson')
print(corr)
#5)obedience has low negative correlation(attitude is lower), which is statistically not significant
#6)  What fun damental problem does this data present for the hypothesis?
#  ----that attitude not means agression? presentation of children, who watch tv more is much more lower, than children,
#  who watch lesser
#What sampling changes could be made to better test the hypothesis that"children who watch more TV are more aggressive"?
# ----collect data about agression
#     get bigger dataset, which will better cover interested area(children,who watch tv more)
from collections import Counter
freqs = Counter(dfclean.tvhours)
print("attitude freqs",freqs)