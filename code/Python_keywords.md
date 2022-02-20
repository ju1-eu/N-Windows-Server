# Python

## Keywords


```python
import math as ma
import numpy as np
# round(Zahl, Stellen))# 4 Stellen nach Komma runden
# print("l = ", round(l, 4), "m")
# Potenz: 2**3 = 2^3
# Wissenschaftliche Schreibweise
#zahl_1 = float(0.0003648) # Ohm = 0.3648 mOhm = 0.0003648 Ohm = 3.648e-04 Ohm
#print(np.format_float_scientific(zahl_1, precision = 4, exp_digits=2))
#zahl_2 = float(2.6667e-03) # Ohm = 2.666666 mOhm = 0.002666666 Ohm = 2.6667e-03 Ohm
#print(np.format_float_scientific(zahl_2, precision = 4, exp_digits=2))
# Schleife: von 1 bis 10 
#for i in range (1,11,1):
#    print(i*i)
```


```python
# boolean true, false
log_var_1 = (True == (1 > 2)) # False
log_var_2 = (True == (2 > 1)) # True
print(log_var_1)
print(log_var_2)
```


```python
# and, or, not
log_var_3 = (True and True) # True
log_var_4 = (True or False) # True
log_var_5 = (not False) # True
print(log_var_3)
print(log_var_4)
print(log_var_5)
```


```python
# break, continue
#while True:
#    break    # ende
#    continue # abbruch
```


```python
# class
#class Coffee:
    # Define your class
```


```python
# funktion
def say_hi():
    print("hi")

say_hi()
```


```python
# if, elif, else
x = int(input("Eingabe Zahl: "))
if x > 3: print("Big")
elif x == 3: print("3")
else: print("Small")
```


```python
# For 
for i in [0,1,2]:
    print(i)

# While 
j = 0
while j < 3:
    print(j); j = j + 1

```


```python
# lambda
(lambda x: x+3)(2) # 5

# return
def increment(x):
    return x + 1

increment(4) # returns 5
```


```python
# in
liste = [2, 39, 42]
log_var_6 = 42 in liste # True
print(log_var_6)

# is
y = x = 3
log_var_7 = x is y # True
print(log_var_7)

# None
print() is None # True
```
