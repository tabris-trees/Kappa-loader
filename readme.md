# 在程序中生成服从 Kappa 分布的随机数 🍎

Kappa 分布的分布函数看起来是如此的复杂，它甚至在做三维的速度空间积分时没办法分解变量化成多个单变量积分的形式（<span class='mohu'>Maxwellian 分布就可以！</span>）。就算是简单的一维的分布，Maxwellian 分布可以直接调用各个语言函数库中的正态分布命令，比如 MATLAB 中的 `normrnd()` ，而 Kappa 分布却无从下手。不过好在人家本来这些语言中的随机数都是人为产生的，我们当然可以自己写一个生成 Kappa 分布的程序来实现我们的目的。

首先，生成一个任意分布的随机数主要有两种方法：

- 变换法
- 接受拒绝法

简单解释一下变换法就是通过分布函数单调递增的特性，先生成一堆均匀分布（0 ~ 1之间）的随机数（这个命令每个语言必定都有），再利用反函数讲这些随机数转换为按照我们所要求的分布的随机数（也就是反函数的反函数就是原函数的想法）；接受拒绝法要我们先生成一个可以直接生成的近似分布的随机数种群，要求这个近似的分布函数在每一点都要大于原分布函数的函数值，在生成一个0 ~ 1之间的均匀分布的随机数种群，如果均匀分布的随机数种群小于近似分布种群与要求分布之间的误差就接受近似分布种群，否则拒绝，重复多次即可。<span class='mohu'>（**大概就是这样，并不完全准确，具体的还是推荐Google一下**）</span>

一般来说，Kappa 分布这样的复杂分布只能是按照接受-拒绝法这种劳神费力的方式来生成，但是呢！有人（Abdul et al. 2014, 2015, 2021）发现 Kappa 分布和统计学中常用的 <span style='background: yellow'>Student t 分布</span> 在本质上是等价的（只需要做个小小的无伤大雅的变换）。

对于一维的 Kappa 分布（均值为0）：

$$
\begin{equation}
    \begin{aligned}
        f\left(v_{x}\right)=\left(\pi \kappa \theta^{2}\right)^{-1 / 2} \frac{\Gamma(\kappa)}{\Gamma(\kappa-1 / 2)}\left(1+\frac{v_{x}^{2}}{\kappa \theta^{2}}\right)^{-\kappa}
    \end{aligned}
\end{equation}
$$

和一维的 Student t 分布：

$$
\begin{equation}
    \begin{aligned}
        p(t)=\frac{1}{\sqrt{(v \pi)} \sigma} \frac{\Gamma\left(\frac{v+1}{2}\right)}{\Gamma\left(\frac{v}{2}\right)}\left[1+\frac{1}{v}\left(\frac{t-\mu}{\sigma}\right)^{2}\right]^{-\frac{1}{2}(v+1)}
    \end{aligned}
\end{equation}
$$

通过变换：$\nu  = 2 \kappa - 1$，可以证明两者其实是一致的。

进一步的，方差 $\sigma^2$ 对应的变换为：

$$
\begin{equation}
    \begin{aligned}
        \sigma^{2}=\frac{\kappa \theta^{2}}{2 \kappa-1}
    \end{aligned}
\end{equation}
$$

这样，我们就可以通过生成 Student t 分布来生成 Kappa 分布。非常幸运的是，Student t 分布在统计学中被研究得很深入，我们可以通过两个在 $\left[0,1\right]$ 内均匀分布的两个随机数种群 $a_1, a_2$ 就可以得到我们想要的分布：

$$
\begin{equation}
    \begin{aligned}
        b&=\sqrt{v\left(a_{1}^{-2 / v}-1\right) \cos \left(2 \pi a_{2}\right)} \\
        c_{t}&=\mu+\sigma b
    \end{aligned}
\end{equation}
$$

其中，均值通常取 0 ，表示整体的静止。

该程序生成的随机数统计结果和理论（Kappa 分布函数曲线）符合的很好，同时将其和 Maxwellian 分布作了个对比

![maxwellian](https://hexo-1301133429.cos.ap-chengdu.myqcloud.com/post/3.jpg)

![kappa](https://hexo-1301133429.cos.ap-chengdu.myqcloud.com/post/4.jpg)

三维形式和一维情况类似。

# 原文地址🍉

https://www.tabirstrees.top/2022/07/08/KappaDistribution/