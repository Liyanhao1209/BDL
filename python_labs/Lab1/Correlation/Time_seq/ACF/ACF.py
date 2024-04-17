import sys

import matplotlib.pyplot as plt
import numpy as np
from statsmodels.tsa.stattools import acf, pacf

from h5Reader import readHdf5


def ACF(ts, region: int, business: int):
    lags = np.arange(1, len(ts))  # 定义延迟范围
    acf_values = acf(ts, nlags=len(lags) - 1)  # 计算自相关函数值

    plt.figure(figsize=(12, 6))
    # plt.subplot(121)
    plt.plot(lags, acf_values)
    plt.title('Auto correlation Function (ACF)')
    plt.xlabel('Lags')
    plt.ylabel('ACF')
    plt.grid(True)
    print(target_dir + "\\ACF_" + str(region) + "_" + str(business) + ".png")
    plt.savefig(target_dir + "\\ACF_" + str(region) + "_" + str(business) + ".png", dpi=300)

    return acf_values


def PACF(ts, region: int, business: int):
    # 样本大小
    sample_size = len(ts)
    # 计算偏自相关函数时，nlags不能超过样本大小的50%
    max_nlags = sample_size // 1000
    lags = np.arange(max_nlags + 1)  # 延迟范围从0到max_nlags
    # 计算偏自相关函数值
    pacf_values = pacf(ts, nlags=max_nlags)

    # plt.subplot(122)
    plt.plot(lags, pacf_values)
    plt.title('Partial Auto correlation Function (PACF)')
    plt.xlabel('Lags')
    plt.ylabel('PACF')
    plt.grid(True)
    print(target_dir + "\\PACF_" + str(region) + "_" + str(business) + ".png")
    plt.savefig(target_dir + "\\PACF_" + str(region) + "_" + str(business) + ".png", dpi=300)

    return pacf_values


if __name__ == '__main__':
    args = sys.argv

    dataset_path = args[1]
    # region = int(args[2])
    # business = int(args[3])
    target_dir = args[4]
    data, idx = readHdf5.readH5(dataset_path, ['data', 'idx'])

    for i in range(10000):
        for j in range(5):
            ts_slice = data[:, i, j]
            ACF(ts_slice, i, j)
            PACF(ts_slice, i, j)
