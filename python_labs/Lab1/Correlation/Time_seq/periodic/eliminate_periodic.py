import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from statsmodels.tsa.seasonal import seasonal_decompose


def remove_seasonality_and_trend(ts, start_date, freq='600S'):
    # 根据起始时间和频率生成日期范围
    dates = pd.date_range(start=start_date, periods=len(ts), freq=freq)

    # 将一维数组和日期转换为pandas Series
    ts_series = pd.Series(ts, index=dates)

    # 季节性分解
    result = seasonal_decompose(ts_series, model='additive')

    # 绘制原始时间序列和分解结果
    plt.figure(figsize=(12, 8))

    # 原始时间序列
    plt.subplot(3, 1, 1)
    plt.plot(ts_series, label='Original')
    plt.title('Original Time Series')
    plt.legend()

    # 分解结果
    result.plot(subplots=True, sharex=True)
    plt.suptitle('Seasonal Decomposition')

    # 去除季节性和趋势，保留残差
    resid = result.resid

    # 如果需要，可以加上部分趋势
    # trend = result.trend
    # deseasonalized_ts = trend + resid

    # 仅保留残差作为去除季节性和周期性后的时间序列
    deseasonalized_ts = resid

    # 绘制去季节化和周期性后的时间序列
    plt.subplot(3, 1, 3)
    plt.plot(deseasonalized_ts, label='Deseasonalized')
    plt.title('Deseasonalized Time Series')
    plt.legend()

    # 显示图形
    plt.tight_layout()
    plt.show()

    # 返回去除季节性和周期性后的时间序列
    return deseasonalized_ts.values
