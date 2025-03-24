import matplotlib.pyplot as plt
import numpy as np

data = np.loadtxt("dac8bit.csv", delimiter=",", skiprows=1)
digital_code = data[:, 0]
Vout = data[:, 1]

plt.plot(digital_code, Vout, marker='o')
plt.title("8-bit DAC Transfer Curve")
plt.xlabel("Digital input code")
plt.ylabel("Analog output voltage (V)")
plt.grid(True)
plt.show()
