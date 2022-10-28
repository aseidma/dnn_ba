import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

file_prefix = "~/Documents/Personal/Uni/ba_code/121/"

n = 121
m = 11

for seq in range(1, n+1):
    filename = ""

    if seq < 10:
        filename = '00'
    elif seq < 100:
        filename = '0'

    final_filename = file_prefix + filename + str(seq) + '.txt'

    data = pd.read_csv(final_filename, sep="	", header=None).to_numpy()

    timecode = file_prefix + filename + str(seq) + "_timecode.txt"
    list = pd.read_csv(timecode, sep="   ", header=None).to_numpy()

    movements = np.zeros((len(data), 2))

    # for i in range(m):
    #     val_1 = list[i, 0].astype(np.int64)
    #     val_2 = list[i, 1].astype(np.int64)

    #     movements[val_1:val_2] = np.nanmax(np.nanmax(data, axis=0))

    # plt.plot(np.concatenate((data, movements), axis=1))
    plt.plot(data)
    plt.ylabel('electrical activity')
    plt.xlabel('milliseconds')
    plt.show()

