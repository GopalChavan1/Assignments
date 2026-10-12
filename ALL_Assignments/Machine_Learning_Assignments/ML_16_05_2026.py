#!/usr/bin/env python
# coding: utf-8

# In[2]:


import numpy as np
import pandas as pd 
import matplotlib.pyplot as plt
import seaborn as sns


# In[3]:


advertising = pd.DataFrame(pd.read_csv("advertising.csv"))


# In[4]:


advertising.head()


# In[5]:


advertising.describe()


# In[7]:


# data cleaning 
#1) null values
advertising.isnull()


# In[8]:


# Duplicates 
advertising.duplicated().sum()


# In[12]:


# Feature Selection 
advertising.columns


# In[13]:


sns.pairplot(advertising,
             x_vars=['TV', 'Newspaper', 'Radio'],
             y_vars='Sales',
             kind='scatter')


# In[16]:


sns.heatmap(advertising.corr(),cmap="coolwarm",annot=True)
plt.show()


# In[14]:


X = advertising["TV"]
y = advertising[['Sales']]


# In[17]:


#train test split
from sklearn.model_selection import train-test_split
X_train,X_test,y_train,y-test = train_test_split(X,y,train_size =0.8, test_size=0.2)


# In[19]:


from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    train_size=0.8,
    test_size=0.2,
    random_state=100
)


# In[20]:


from sklearn.linear_model import LinearRegression


# In[21]:


lr = LinearRegression()


# In[22]:


lr.fit(X_train, y_train)


# In[ ]:





# In[24]:


print("intercept",lr.intercept_)
print("coeffe", lr.coef_)


# In[27]:


plt.scatter(X_train,y_train)
plt.plot(X_train,6.89+0.055*X_train) # y =mx+ c


# In[30]:


## prediction on test data
y_pred = lr.predict(X_test)
y_pred  


# In[32]:


# evaluate model 
# adjusted r square

from sklearn.metrics import r2_score
r_squared = r2_score(y_test, y_pred)
r_squared


# In[ ]:


# ideal range  for metrics is 0.85 to 0.95 


# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[23]:


# Import Libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load Dataset
advertising = pd.read_csv("advertising.csv")

# Display First 5 Rows
print(advertising.head())

# Dataset Information
print(advertising.info())

# Statistical Summary
print(advertising.describe())

# -------------------------------
# Data Cleaning
# -------------------------------

# Check Null Values
print("Null Values:")
print(advertising.isnull().sum())

# Check Duplicate Values
print("Duplicate Rows:", advertising.duplicated().sum())

# Display Column Names
print("Columns:")
print(advertising.columns)

# -------------------------------
# Data Visualization
# -------------------------------

# Scatter Plot for Feature Selection
sns.pairplot(
    advertising,
    x_vars=['TV', 'Newspaper', 'Radio'],
    y_vars='Sales',
    kind='scatter'
)

plt.show()

# Correlation Heatmap
plt.figure(figsize=(8, 5))
sns.heatmap(
    advertising.corr(),
    cmap="coolwarm",
    annot=True
)

plt.show()

# -------------------------------
# Feature Selection
# -------------------------------

# Independent Variable (Feature)
X = advertising[['TV']]

# Dependent Variable (Target)
y = advertising[['Sales']]

# -------------------------------
# Train Test Split
# -------------------------------

from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    train_size=0.8,
    test_size=0.2,
    random_state=100
)

# -------------------------------
# Linear Regression Model
# -------------------------------

from sklearn.linear_model import LinearRegression

# Create Model
lr = LinearRegression()

# Train Model
lr.fit(X_train, y_train)

print("Model Trained Successfully")

# -------------------------------
# Prediction
# -------------------------------

y_pred = lr.predict(X_test)

print("Predicted Values:")
print(y_pred)

# -------------------------------
# Model Coefficient & Intercept
# -------------------------------

print("Intercept:", lr.intercept_)
print("Coefficient:", lr.coef_)

# Regression Equation
print("Regression Equation:")
print(f"Sales = {lr.intercept_[0]} + ({lr.coef_[0][0]} * TV)")

# -------------------------------
# Model Evaluation
# -------------------------------

from sklearn.metrics import mean_absolute_error
from sklearn.metrics import mean_squared_error
from sklearn.metrics import r2_score

print("MAE:", mean_absolute_error(y_test, y_pred))
print("MSE:", mean_squared_error(y_test, y_pred))
print("R2 Score:", r2_score(y_test, y_pred))

# -------------------------------
# Plot Regression Line
# -------------------------------

plt.figure(figsize=(8, 5))

plt.scatter(X_test, y_test)

plt.plot(X_test, y_pred)

plt.xlabel("TV Advertisement Budget")
plt.ylabel("Sales")
plt.title("TV vs Sales Linear Regression")

plt.show()


# In[ ]:




