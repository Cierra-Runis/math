#import "@preview/cetz:0.4.0"
#import "@preview/thmbox:0.2.0": sectioned-counter, thmbox, thmbox-init
#import "@preview/hydra:0.6.1": hydra
#import "@preview/subpar:0.2.2"
#import "theme.typ": theme-init, theme-setup

#set document(
  title: "Math",
  author: "Cierra Runis",
)
#set par(first-line-indent: (amount: 2em, all: true))

/// START: Fonts
#let serif-fonts = (
  (name: "New Computer Modern", covers: regex("[a-zA-Z0-9’]")), // TODO: Remove "’""
  "FZFW ZhuZi MinchoS",
)
#set text(font: serif-fonts, size: 13pt)
#set strong(delta: 800)
#show emph: text.with(font: "LXGW WenKai GB")
#show raw: text.with(font: "Cascadia Code")
#show math.equation: set text(font: (
  "New Computer Modern Math",
  "FZFW ZhuZi MinchoS",
))
/// END: Fonts

/// START: Colors
#let flavor = theme-init()
#show: theme-setup.with(flavor)
#let colors = flavor.colors

#let link-color = colors.red
#show outline.entry: set text(fill: link-color)
#show link: set text(fill: link-color)
#show ref: set text(fill: link-color)
#show footnote: set text(fill: link-color)
#set footnote.entry(separator: line(length: 30%, stroke: (paint: colors.text, thickness: 0.5pt)))

/// - file (str): The path to the SVG file.
/// - color (color): The color to replace the stroke color with.
#let svg-colorize(file, color) = {
  bytes(
    read(file).replace(
      regex("stroke=\"[^\"]*\""),
      "stroke=\"" + color.to-hex() + "\"",
    ),
  )
}
/// END: Colors

/// START: Thmbox
#let conjecture-counter = counter("conjecture")
#show: sectioned-counter(conjecture-counter)
#let conjecture = thmbox.with(
  color: colors.blue,
  counter: conjecture-counter,
  variant: "猜想",
  title-fonts: serif-fonts,
  sans-fonts: serif-fonts,
)

#let exercise-counter = counter("exercise")
#show: sectioned-counter(exercise-counter)
#let exercise = thmbox.with(
  color: colors.sky,
  counter: exercise-counter,
  variant: "练习",
  title-fonts: serif-fonts,
  sans-fonts: serif-fonts,
)

#let example-counter = counter("example")
#show: sectioned-counter(example-counter)
#let example = thmbox.with(
  color: colors.green,
  counter: example-counter,
  variant: "示例",
  title-fonts: serif-fonts,
  sans-fonts: serif-fonts,
)

#let theorem = thmbox.with(
  color: colors.red,
  variant: "定理",
  title-fonts: serif-fonts,
  sans-fonts: serif-fonts,
)

#let lemma = thmbox.with(
  color: colors.lime,
  variant: "引理",
  title-fonts: serif-fonts,
  sans-fonts: serif-fonts,
)

#let definition = thmbox.with(
  color: colors.yellow,
  variant: "定义",
  title-fonts: serif-fonts,
  sans-fonts: serif-fonts,
)

#let remark = thmbox.with(
  color: colors.text,
  variant: "注记",
  title-fonts: serif-fonts,
  sans-fonts: serif-fonts,
)

#let corollary = thmbox.with(
  color: colors.red,
  variant: "推论",
  title-fonts: serif-fonts,
  sans-fonts: serif-fonts,
)

#let proposition = thmbox.with(
  color: colors.fuchsia,
  variant: "命题",
  title-fonts: serif-fonts,
  sans-fonts: serif-fonts,
)

#let note = thmbox.with(
  color: colors.text,
  variant: "笔记",
  numbering: none,
  title-fonts: serif-fonts,
  sans-fonts: serif-fonts,
)

#let proof = thmbox.with(
  color: colors.emerald,
  variant: "证明",
  numbering: none,
  title-fonts: serif-fonts,
  sans-fonts: serif-fonts,
)

#let warning = thmbox.with(
  color: colors.orange,
  variant: "警告",
  numbering: none,
  title-fonts: serif-fonts,
  sans-fonts: serif-fonts,
)

#let algorithm = thmbox.with(
  color: colors.purple,
  variant: "算法",
  numbering: none,
  title-fonts: serif-fonts,
  sans-fonts: serif-fonts,
)
/// END: Thmbox

= 自然数 <chap:natural-number>

自然数集 $NN$ 是我们接触最早的数集，但就是这样一个“性质简单”的数集，我们也能从中发现一些有趣的东西.

== 认识自然数 <sec:understand-natural-number>

自我们出生就一直和数字打交道：人有几根手指？河里有几只鸭子？朴素的我们掰着手指记数：0、1、2、3……10，至此我们会使用 0 到 10 的数字来计数了.

好像有什么不对劲，0 是自然数吗？

不同的书籍、领域给出的答案是不一样的，就根据 #link("https://zh.wikipedia.org/wiki/%E7%9A%AE%E4%BA%9A%E8%AF%BA%E5%85%AC%E7%90%86")[皮亚诺公理] 得出的结论，答案是肯定的.

这五条公理的内容如下：

- 0 是自然数.

- 每个自然数 $a$ 有且仅有一个后继数 $a'$ 为自然数.

- 对自然数 $b$、$c$，当且仅当 $b' = c'$ 时有 $b = c$.

- 0 不是任何自然数的后继数.

- 任意有关自然数的命题，若其对自然数 0 成立，且假定它对自然数 $a$ 为真时，可证其对 $a'$ 也成立，那么命题对所有自然数成立.

个人认为把 0 认作自然数的好：离散数学中有单位元（幺元）的概念，若 $0 in.not NN$，则定义在集合 $NN$ 上的二元运算 $+$ 就没有单位元了，让其失去这样的性质就失去了数学的美感.

为了避免 $NN$ 的歧义，我们将尽可能使用 $NN_0$ 表示包含 0 的自然数集，而 $NN^*$ 则表示不包含 0 的自然数集. 当使用 $NN$ 时，默认是包含 0 的自然数集.

== 四则运算 <sec:four-arithmetic-operations>

=== 加法 <subsec:addition>

=== 减法 <subsec:subtraction>

// \begin{question}
//   证明关于 $x_1, x_2, dots.c, x_n$ 的方程组
//   \[
//     \left\{
//     \begin{gathered}
//       \prod_{k = 1}^{n} (x_k - lambda_1) = \mu_1 \\
//       \prod_{k = 1}^{n} (x_k - lambda_2) = \mu_2 \\
//       dots.c                                      \\
//       \prod_{k = 1}^{n} (x_k - lambda_n) = \mu_n
//     \end{gathered}
//     \right.
//   \]
//   有且仅有确定的解.
// \end{question}
//
#example[
  证明关于 $x_1, x_2, dots.c, x_n$ 的方程组

  $
    cases(
      product_(k = 1)^n (x_k - lambda_1) = mu_1,
      product_(k = 1)^n (x_k - lambda_2) = mu_2,
      dots.c,
      product_(k = 1)^n (x_k - lambda_n) = mu_n,
    )
  $

  有且仅有确定的解.
]

#proof[
  设 $f(x) = product_(k = 1)^n (x - lambda_k)$，则 $f(x)$ 为 $n$ 次多项式，且其系数为 $lambda_1, lambda_2, dots.c, lambda_n$ 的函数.

  由代数基本定理知 $f(x)$ 有 $n$ 个根，且这些根是 $lambda_1, lambda_2, dots.c, lambda_n$ 的排列.

  故方程组有且仅有确定的解.
]

=== 乘法 <subsec:multiplication>

=== 除法 <subsec:division>

==== 取余 <subsubsec:modulus>

== 数的性质 <sec:number-properties>

=== 负数 <subsec:negative-number>

=== 奇数 <subsec:odd-number>

=== 偶数 <subsec:even-number>

=== 因数 <subsec:factor>

=== 倍数 <subsec:multiple>

=== 倒数 <subsec:reciprocal>

=== 质数 <subsec:prime-number>

=== 合数 <subsec:composite-number>

== 比较大小 <sec:compare-size>

给出自然数 $a$、$b$，现在的我们看到不等式 $a > b$ 时，很容易就得到 $a - b > 0$，未免陷入到了代数的桎梏中——让我们回忆一下我们当初是怎么进行比较的：

\begin{figure}[H]
\small
\centering
\begin{tikzpicture}
\foreach \n/\t in
{0/1,1/2,2/3,3/4}
{\node[circle,fill=lightgray,draw]
at (\n,1.2) {$\t$};}

\foreach \n in
{0,1,2}
{\node at (\n,0.6) {|};}

\foreach \n/\t in
{0/1,1/2,2/3}
{\node[circle,fill=lightgray,draw]
at (\n,0) {$\t$};}
\end{tikzpicture}
\caption{比较大小} <fig:compare>
\end{figure}

像这样 \strong{一一对应}，直到一方比另一方多或相等.

为什么在这讲如此简单的东西呢？我们以一个数学问题切入感受一下：

\begin{question}
正奇数集 $O = \{1, 3, dots.c\}$ 与正偶数集 $E = \{2, 4, dots.c\}$ 哪个集合的元素个数（势）更大？
\end{question}

\begin{solution}
存在函数 $f: O \to E, f(x) = x + 1$ 为双射函数，则 $O, E$ 同势.
\end{solution}

而双射的定义如下：

\begin{definition}[双射函数]
若 $f: X \to Y$ 有 $forall x in X$ 存在唯一的 $y$ 与 $x$ 对应，且 $forall y in Y$ 存在唯一的 $x$ 与 $y$ 对应，则称 $f$ 为双射函数. 换句话说，如果 $f$ 为两集合间的 \strong{一一对应} 关系，则 $f$ 是双射的.
\end{definition}

在此也请读者们思考：

\begin{problem}[\cref{ans:odd-even-union}] <prob:odd-even-union>
$NN^*$ 与 $O, E$ 是否同势？若是请给出函数 $f$，否则给出理由.
\end{problem}

\begin{problem}[\cref{ans:real-number-interval}] <prob:real-number-interval>
集合 $A = \{x | 0 < x < 1, x in RR\}$ 与集合 $RR$ 是否同势？若是请给出函数 $f$，否则给出理由.
\end{problem}

== 进制 <sec:base>

== 统计 <sec:statistics>

=== 平均数 <subsec:mean>

=== 最值 <subsec:max-min>

在一组数 $x_1, x_2, dots.c, x_n$ 中，若其中的某个数 $x_k$ 对其中任意一个数 $s$ 有 $x_k >= s$，则称 $x_k$ 为最大值，同理可以给出最小值的定义.

那么根据这样的定义，最大值实际上是可以有“多个”的，比如一下一组数：$0, 1, 1, 2, 2$, 实际上后两个数都是这组数的最大值，只是两者相同而已.

为了避免这样的重复，我们一般将这组数用一个集合表示，而集合中的元素只会出现一次，那么我们搬出严格定义如下：

\begin{definition}[最大元与最小元] <def:max-min-element>
设 $(P,<= )$为偏序集，$S$ 为其子集. 若 $g in S$ 对任何 $s in S$ 有 $s <= g$，则 $g$ 称为 $S$ 的 *最大元*（Greatest Element），同理若 $l in S$ 对任何 $s in S$ 有 $l <= s$，则 $l$ 称为 $S$ 的 *最小元*（Least Element）.
\end{definition}

我们会用多种方式来表示最大值：如 $s_{max}$、$max{S}$，在元素个数为二时，我们还可以用一个算式来表达最大值：

记 $M = max(a, b)$，则
$
  M = frac(a + b + |a - b|, 2)
$ <eq:max>

容易证明 $a >= b$ 时 $M = a$，$a < b$ 时 $M = b$.

同理记 $m = min(a, b)$，则
$
  m = frac(a + b - |a - b|, 2)
$ <eq:min>

由此我们就将比较抽象的取最大最小值用准确的算式表达出来了，在未来我们学习随机变量时会利用这个算式的.

== 坐标 <sec:coordinate>

== 鸡兔同笼 <sec:chicken-rabbit>

= 平面几何

== 平面图形

== 立体图形

== 对称

== 角

= 集合与常用逻辑用语

= 一元二次函数、方程与不等式

= 函数

== 函数、导数、积分

== 基本知识

== 多阶函数的记法

对 $f(x)$，记 $f'(x)$ 为一阶导，$f''(x)$ 为二阶导，$f'''(x)$ 为三阶导，任意阶导都可为 $f^{(n)}(x)$.

== 极值点判别法则

对函数 $f(x)$ 在 $x = x_0$ 处若存在 $n \in NN^*$ 使得
\[
f'(x_0) = f''(x_0) = \dots = f^{(n - 1)}(x_0) = 0, f^{(n)}(x_0) > 0
\]
则当 $n$ 为偶数时，$x_0$ 为极小值点.

使得
\[
f'(x_0) = f''(x_0) = \dots = f^{(n - 1)}(x_0) = 0, f^{(n)}(x_0) < 0
\]
则当 $n$ 为偶数时，$x_0$ 为极大值点. 当 $n$ 为奇数时 $x_0$ 既不是极大值点，也不是极小值点.

一般取 $n = 2$，即一般来说
\begin{center}
$f'(x_0) = 0, f''(x_0) > 0$ 即有 $x_0$ 为极小值点. \\
$f'(x_0) = 0, f''(x_0) < 0$ 即有 $x_0$ 为极大值点.
\end{center}

% TODO: 注意 18 年全国三卷导数题 (2) 问

== 琴生不等式

\begin{gather}
forall x \in D, f''(x) \ge0 \iff forall x_1, x_2 \in D, \dfrac{f(x_1) + f(x_2)}{2} \ge f(\dfrac{x_1 + x_2}{2}) \label{eq:convex-inequality} \\
forall x \in D, f''(x) \le0 \iff forall x_1, x_2 \in D, \dfrac{f(x_1) + f(x_2)}{2} \le f(\dfrac{x_1 + x_2}{2}) \label{eq:concave-inequality}
\end{gather}

这在图像上显然成立.

== ALG 不等式

\begin{equation}
forall x_1, x_2 \in RR^\* \implies \dfrac{x_1 + x_2}{2} > \dfrac{x_1 - x_2}{\ln{x_1} - \ln{x_2}} > \sqrt{x_1x_2} \label{eq:alg-inequality}
\end{equation}

== 三阶导数与零点中点导数关系

若 $f'''(x) > 0$ 且 $f(x)$ 有两零点 $x_1, x_2$，则
\begin{equation}
f'\left(\dfrac{x_1 + x_2}{2}\right) < 0 \label{eq:deriv_middle_negative}
\end{equation}

若 $f'''(x) < 0$ 且 $f(x)$ 有两零点 $x_1, x_2$，则
\begin{equation}
f'\left(\dfrac{x_1 + x_2}{2}\right) > 0 \label{eq:deriv_middle_positive}
\end{equation}

现使用虚设函数法证明 \cref{eq:deriv_middle_negative}：

\begin{proof}
记 $g(x) = f(x) - f(a - x)$，其中 $a = x_1 + x_2$，且令 $x_1 < \dfrac{a}{2} < x_2$，则
\begin{align*}
  g'(x)   & = f'(x) + f'(a - x)         \\
  g''(x)  & = f''(x) - f''(a - x)       \\
  g'''(x) & = f'''(x) + f'''(a - x) > 0
  \end{align*}
由
\[
g''(\dfrac{a}{2}) = 0
\]
得
\[
g'(x) \ge g'(\dfrac{a}{2}) = 2f'(\dfrac{a}{2})
\]
假设
\[
f'(\dfrac{a}{2}) \ge 0
\]
则
\[
g'(x) \ge 0
\]
即得 $g(x)$ 单调递增，但
\[
g(\dfrac{a}{2}) = 0 \implies f(x_1) < f(x_2)
\]
与
\[
f(x_1) = f(x_2) = 0
\]
的题设相悖，故
\[
f'(\dfrac{a}{2}) < 0
\]
即
\[
f'(\dfrac{x_1 + x_2}{2}) < 0
\]
\end{proof}

== 利用隐函数求导求曲线上一点切线斜率 \label{subsec:implicit-derivative}

有 $F(x,y) = x^2 + 2x + y^2 = 0$，则上一点 $(x,y)$ 切线斜率
\[
k = \dfrac{"d"y}{"d"x} = -\dfrac{\dfrac{partial F}{partial x}}{\dfrac{partial F}{partial y}} = -\dfrac{2x + 2}{2y}= -\dfrac{x + 1}{y}
\]

其中 $\dfrac{partial F}{partial x}$ 表示对 $F$ 求 $x$ 的偏导，即将除了 $x$ 的其他变量视为未知常数进行求导.

同理 $\dfrac{partial F}{partial y}$ 表示对 $F$ 求 $y$ 的偏导.

== 利用隐函数求导求约束条件下的函数最值

已知约束条件 $F(x,y) = 0$，求 $G(x,y)$ 最值.

\begin{example}
$F(x,y) = x^2 + y^2 + x y - 4 = 0$，求 $G(x,y) = x^2 + y^2$ 最值.
\end{example}

\begin{solution}
令
\[
-\dfrac{\dfrac{partial F}{partial x}}{\dfrac{partial F}{partial y}} = -\dfrac{\dfrac{partial G}{partial x}}{\dfrac{partial G}{partial y}}
\]
化简得 $y = \pm x$.

与 $F(x,y) = 0$ 联立解得
\[
\left(\pm\dfrac{2}{\sqrt{3}}, \pm\dfrac{2}{\sqrt{3}}\right), (\pm2, \mp2)
\]
代入得 $G(x,y)$ 最大值为 $8$，最小值为 $\dfrac{8}{3}$.
\end{solution}

不完全严谨，但确实很多时候有用.

== 圆锥曲线上一点切线方程

\begin{table}[H]
\small
\centering
\caption{圆锥曲线方程与切线方程} \label{tbl:conic-tangent}
\begin{tabular}{cc}
\hline
方程                                      & 过点 $P(x_0, y_0)$ 切线方程                       \\
\hline
$(x - a)^2 + (y - b)^2 = R^2$           & $(x - a)(x_0 - a) + (y - b)(y_0 - b) = R^2$ \\
$frac{x^2}{a^2} + frac{y^2}{b^2} = 1$ & $frac{x x_0}{a^2} + frac{y y_0}{b^2} = 1$   \\
$frac{x^2}{a^2} - frac{y^2}{b^2} = 1$ & $frac{x x_0}{a^2} - frac{y y_0}{b^2} = 1$   \\
$frac{y^2}{b^2} - frac{x^2}{a^2} = 1$ & $frac{y y_0}{b^2} - frac{x x_0}{a^2} = 1$   \\
$y^2 = 2 p x$                             & $y y_0 = p(x + x_0)$                         \\
$x^2 = 2 p y$                             & $x x_0 = p(y + y_0)$                         \\
\hline
\end{tabular}
\end{table}

== 极值点偏移

\begin{example}
$f(x) = x(\ln{x} - \dfrac{x}{2} + a - 1)$ 有两极值点 $x_1, x_2, x_1 < x_2$.
\begin{enumerate}[leftmargin=*, label=(\arabic*)]
\item 求 $a$ 范围.
\item 证明 $2 \ln{x_1} + \ln{x_2} < 0$.
\end{enumerate}
\end{example}

\begin{enumerate}[leftmargin=*, label=(\arabic*)]
\item \begin{solution}
由
\[
f'(x) = \ln{x} - x + a
\]
\[
f''(x) = \dfrac{1}{x} - 1
\]
得
\[
//           f'(x)_{\max} = f'(1) = a - 1
//         \]
//         由题 $f'(x)_{\max} > 0$，故 $a \in (1, +oo)$.
//       \end{solution}
// \item \begin{proof}
//         由 (1) 可得 $0 < x_1 < 1 < x_2$，所证原式可以改证 $x_2 < \dfrac{1}{x_1^2}$.

因为
\[
\dfrac{1}{x_1^2}, x_2 \in (1, +oo)
\]
且由 (1) 有 $f'(x)$ 在 $(1, +oo)$ 上单调递减，则所证
\[
x_2 < \dfrac{1}{x_1^2}
\]
可以改证
\[
f'(\dfrac{1}{x_1^2}) < f'(x_2) = 0
\]
而
\[
f'(\dfrac{1}{x_1^2}) = \ln{\dfrac{1}{x_1^2}} - \dfrac{1}{x_1^2} + a
\]
其中的 $a$ 又可由
\[
f'(x_1) = \ln{x_1} - x_1 + a = 0
\]
得到，则代入得
\[
f'(\dfrac{1}{x_1^2}) = \ln{\dfrac{1}{x_1^2}} - \dfrac{1}{x_1^2} + x_1 - \ln{x_1}
\]
记
\[
g(x) = \ln{\dfrac{1}{x^2}} - \dfrac{1}{x^2} + x - \ln{x} = -3 \ln{x} + x - \dfrac{1}{x^2}, x \in (0, 1)
\]
故证明 $g(x) < 0$, 易得
\[
g'(x) = \dfrac{(x - 1)(x^2 - 2x - 2)}{x^3} > 0
\]
在 $(0, 1)$ 上成立，则 $g(x) < g(1) = 0$，故题得证.
\end{proof}
\end{enumerate}

== 一元函数微分 \label{sec:one-variable-differential}

== 一元函数极值点的判定 \label{subsec:extreme-point}
看 $x_0$ 左右两侧是否为局部最大（小）值，极值点是横坐标.

== 一元函数拐点的判定 \label{subsec:inflection-point}

看 $f''(x)$ 是否在 $x_0$ 左右两侧异号，该点本身可以不可导，且 $f''(x) > 0$ 时为凹函数，$f''(x) < 0$ 时为凸函数，拐点是点.

== 利用泰勒展开求极限

\[
e^x = 1 + x + \dfrac{x^2}{2!} + \cdots + \dfrac{x^n}{n!} + \omicron(x^n)
\]

\[
a^x = 1 + x \ln{a} + \dfrac{x^2}{2!} \ln^2{a} + \cdots + \dfrac{x^n}{n!} \ln^n{a} + \omicron(x^n)
\]

\[
\sin{x} = x - \dfrac{x^3}{3!} + \dfrac{x^5}{5!} - \dfrac{x^7}{7!} + \cdots + (-1)^n \dfrac{x^{2n + 1}}{(2n + 1)!} + \omicron(x^{2n + 1})
\]

\[
cos{x} = 1 - \dfrac{x^2}{2!} + \dfrac{x^4}{4!} - \dfrac{x^6}{6!} + \cdots + (-1)^n \dfrac{x^{2n}}{(2n)!} + \omicron(x^{2n})
\]

\[
\tan{x} = x + \dfrac{x^3}{3} + \dfrac{2x^5}{15} + \omicron(x^5)
\]

\[
\ln{(1 + x)} = x - \dfrac{x^2}{2} + \dfrac{x^3}{3} - \dfrac{x^4}{4} + \cdots + (-1)^{n - 1} \dfrac{x^n}{n} + \omicron(x^n)
\]

\[
\arcsin{x} = x + \dfrac{x^3}{6} + \dfrac{3x^5}{40} + \cdots
\]

\[
\arctan{x} = x - \dfrac{x^3}{3} + \dfrac{x^5}{5} - \dfrac{x^7}{7} + \cdots + (-1)^{n - 1} \dfrac{x^{2n - 1}}{2n - 1} + \omicron(x^{2n - 1})
\]

\[
(1 + x)^{1 / x} = e - \dfrac{ex}{2} + \dfrac{11ex^2}{24} - \dfrac{7ex^3}{16} + \dfrac{2447ex^4}{5760} + \omicron(x^4)
\]

\[
(1 + x)^n = 1 + \dfrac{n}{1!} x + \dfrac{n (n - 1)}{2!} x^2 + \dfrac{n (n - 1) (n - 2)}{3!} x^3 + \cdots
\]

\[
(1 + x)^{1 / n} = 1 + \dfrac{x}{n} - \dfrac{n - 1}{2!} \dfrac{x^2}{n^2} + \dfrac{(n - 1) (2n - 1)}{3!} \dfrac{x^3}{n^3} - \dfrac{(n - 1) (2n - 1) (3n - 1)}{4!} \dfrac{x^4}{n^4} + \cdots
\]

== 斯特林公式

$$
n! = \sqrt{2 \pi n} (\dfrac{n}{e})^n, n \to +oo
$$

== 一元函数高阶求导

== 高阶求导转为等比数列求和

\begin{example}
$f(x) = \dfrac{1}{x^2 - x +1}$，求 $f^{(2022)}(0)$.
\end{example}

\begin{solution}
由立方和公式
\[
a^3 + b^3 = (a + b)(a^2 - ab + b^2)
\]
得
\[
f(x) = \dfrac{1 + x}{1 + x^3} = \dfrac{1}{1 + x^3} + x\dfrac{1}{1 + x^3}
\]
而
\[
// \dfrac{1}{1 + x^3} = sum_{k = 0}^{oo} (-x^3)^k, |x^3| < 1
\]
故
\[
// f(x) = sum_{k = 0}^{oo} (-1)^k x^{3k} + sum_{k = 0}^{oo} (-1)^k x^{3k + 1}, |x^3| < 1
\]
故 $f^{(2022)}(0)$ 应该为 $x^{2022}$ 的系数乘以 $2022!$.

因为 $2022 = 3 times 674 + 0$，所以 $x^{2022}$ 的系数为 $(-1)^{674} = 1$，故答案为 $2022!$.
\end{solution}

除利用立方和公式外，还可利用立方差公式等.

== 高阶求导转为泰勒展开式

\begin{example}
$f(x) = x^2\ln{(1 + x)}$，求 $f^{(n)}(0)$.
\end{example}

\begin{solution}
因为
\[
\ln{(1 + x)} = sum_{k = 1}^{oo} frac{(-1)^{k + 1} x^k}{k}
  \]
  故
  \[
  f(x) = x^2\ln{(1 + x)} = sum_{k = 1}^{oo} frac{(-1)^{k + 1} x^{k + 2}}{k}
\]
故 $f^{(n)}(0)$ 应为 $x^{n}$ 的系数乘以 $n!$.

由 $x^{k+2}$，当 $k = n-2$ 时有 $x^n$，系数为 $frac{(-1)^{n-1}}{n-2}$，故答案为
\[
f^{(n)}(0) = frac{(-1)^{n-1}}{n-2} n!
\]
\end{solution}

== 一元函数极限

求 $\lim_{x \to a} f(x)$ 时，要考查 $\lim_{x \to a^+} f(x)$ 和 $\lim_{x \to a^-} f(x)$.

若
$$
\lim_{x \to +oo} f(x) = 0, \lim_{x \to +oo} g(x) = +oo
$$
则
$$
\lim_{x \to +oo} (1 + f(x))^{g(x)} = \exp{\lim_{x \to +oo} f(x)g(x)}
$$

当分子或分母为根式相加减时，可尝试分子或分母有理化.

若有 $\lim_{x \to x_0} \dfrac{f(x)}{g(x)} = a$，则可以转写为在 $x = x_0$ 的某个领域内 $f(x) = a g(x)$.

对于$\lim_{n \to +oo} f(\dfrac{1}{n})$，不可使用 $x = \dfrac{1}{n}$ 的代换，必须保留 $\dfrac{1}{n}$ 的形式.

对于 $\lim_{n \to +oo} x_n = +oo, \lim_{n \to +oo} y_n = \lim_{n \to +oo} z_n = a$，有 $\lim_{n \to +oo} x_n [f(y_n) - f(z_n)] = \lim_{n \to +oo} x_n (y_n - z_n) f'(\xi)$，其中 $\xi$ 在 $y_n, z_n$ 之间.

== 极限四则运算存在性 \label{sec:limit-arithmetic}

若 $\lim_{x \to a} f(x) = A$, $\lim_{x \to a} g(x)$ 不存在，则 $\lim_{x \to a} f(x) + g(x)$ 不存在.

当 $A \neq 0$ 时，又有$\lim_{x \to a} f(x)g(x)$ 不存在，$A = 0$ 时不确定.

若 $\lim_{x \to a} f(x)$ 和 $\lim_{x \to a} g(x)$ 均不存在，则 $\lim_{x \to a} f(x) + g(x)$ 和 $\lim_{x \to a} f(x)g(x)$ 均不确定.

== 一元函数连续、可导、可微的判定与关系

== 一元函数连续的判定

若 $\lim_{x \to x_0} f(x) = f(x_0)$，则称 $f(x)$ 在 $x = x_0$ 处连续.

若 $\lim_{x \to x_0^-} f(x) = f(x_0)$，则称 $f(x)$ 在 $x = x_0$ 处左连续，右连续略.

== 一元函数可导的判定 \label{subsec:derivative-definition}

若 $\lim_{x \to x_0} \dfrac{f(x) - f(x_0)}{x - x_0}$ 存在，则称 $f(x)$ 在 $x = x_0$ 处可导.

若 $\lim_{x \to x_0^-} \dfrac{f(x) - f(x_0)}{x - x_0}$ 存在，则称 $f(x)$ 在 $x = x_0$ 处左可导，右可导略.

== 一元函数可微的判定

若 $Delta{y} = f(x_0 + Delta{x}) - f(x_0) = A Delta{x} + omicron(Delta{x})$，则称 $f(x)$ 在 $x = x_0$ 处可微，且微分 $"d"y = A Delta{x} = A"d"x$.

== 一元函数连续、可导、可微的关系

\[
可微 \iff 可导 \implies 连续
\]

没标注的箭头表示无法推出.

== 导数极限和导数的关系 \label{sec:derivative-limit}

$\lim_{x \to x_0} f'(x)$ 存在，无法判断 $f(x)$ 是否在 $x = x_0$ 处连续.

若 $\lim_{x \to x_0} f'(x) = A$，且 $f(x)$ 在 $x = x_0$ 处连续，则 $f'(x_0) = A$，否则不存在.

若 $\lim_{x \to x_0} f'(x) = oo$，则 $f'(x_0)$ 不存在.

若 $\lim_{x \to x_0} f'(x)$ 不存在且不为 $oo$，则需要利用 \cref{subsec:derivative-definition} 中的判断.

== 间断点

== 第一类间断点

可去间断点：$\lim_{x \to x_0} f(x)$ 存在，但其与 $f(x_0)$ 不相等或 $f(x_0)$ 无定义.

跳跃间断点：$\lim_{x \to x_0^+} f(x)$ 与 $\lim_{x \to x_0^-} f(x)$ 存在但不相等.

== 第二类间断点

$\lim_{x \to x_0^+} f(x)$ 与 $\lim_{x \to x_0^-} f(x)$ 任一不存在.

== 曲率和曲率半径

\[
K = \dfrac{|x'y'' - x''y'|}{(x'^2 + y'^2)^{frac{3}{2}}}
\]

\[
R = \dfrac{1}{K}
\]

== 曲率半径的推导

若 $x = x(t), y = y(t)$，令 $(x - a)^2 + (y - b)^2 = R^2$ 是其在点 $(x, y)$ 的曲率圆. 对曲率圆求关于 $t$ 的一阶、二阶导数：
\[
\left\{
\begin{aligned}
(x - a)x' + (y - b)y'                 & = 0 \\
x'^2 + y'^2 + (x - a)x'' + (y - b)y'' & = 0 \\
\end{aligned}
\right.
\]
解得
\[
\left\{
\begin{aligned}
x - a & = -\dfrac{x'^2 + y'^2}{x'y'' - x''y'} \cdot y' \\
y - b & = \dfrac{x'^2 + y'^2}{x'y'' - x''y'} \cdot x'  \\
\end{aligned}
\right.
\]
故有
\[
R^2 = \dfrac{(x'^2 + y'^2)^3}{(x'y'' - x''y')^2}
\]

一般题目会让你求单点的曲率，可以直接代入解上面的方程组.

== 渐近线

先看间断点：左右极限任一为无穷 $==>$ 铅直渐近线.

再看水平或斜渐近线 $y = a x + b$，同样要考查 $x \to +oo$ 和 $x \to -oo$ 两个方向.

== 一元函数不定积分

== 原函数存在定理

\begin{itemize}
\item 若 $f(x)$ 在 $[a, b]$ 上连续，则在 $[a, b]$ 上存在原函数.
\item 若 $f(x)$ 在 $[a, b]$ 上有跳跃间断点，则在 $[a, b]$ 上一定不存在原函数.
\end{itemize}

$f(x)$ 不连续时，原函数存在性与定积分存在性可以各不相干.

由原函数定义, $F'(x) = f(x)$，故 $F(x)$ 连续.

== 好用的式子

\[
integral e^{ax} cos{bx} \,"d"x = e^{ax} \cdot frac{a cos{bx} + b \sin{bx}}{a^2 + b^2} + C
\]

\[
integral e^{ax} \sin{bx} \,"d"x = e^{ax} \cdot frac{a \sin{bx} - b cos{bx}}{a^2 + b^2} + C
\]

当 $P(x)$ 为多项式时以下三个式子非常好用.

\[
integral P(x) e^{ax} \,"d"x = e^{ax} \left( frac{P}{a} - frac{P'}{a^2} + frac{P''}{a^3} - \cdots \right) + C
\]

\[
integral P(x) cos{ax} \,"d"x = cos{ax} \left( frac{P'}{a^2} - frac{P'''}{a^4} + \cdots \right) + \sin{ax} \left( frac{P}{a} - frac{P''}{a^3} + \cdots \right) + C
\]

\[
integral P(x) \sin{ax} \,"d"x = \sin{ax} \left( frac{P'}{a^2} - frac{P'''}{a^4} + \cdots \right) - cos{ax} \left( frac{P}{a} - frac{P''}{a^3} + \cdots \right) + C
\]

== 如何快速拆开分式多项式

\begin{example}
求 $I = integral \dfrac{7x - 2}{(2x - 1)(x + 1)} \,"d"x$.
\end{example}

\begin{solution}
先将分式多项式拆开为
\[
\dfrac{7x - 2}{(2x - 1)(x + 1)} = \dfrac{A}{2x - 1} + \dfrac{B}{x + 1}
\]
然后在式子两边同时乘以 $2x - 1$ 得
\[
\dfrac{7x - 2}{x + 1} = A + \dfrac{2x - 1}{x + 1} B
\]
再令 $x = \dfrac{1}{2}$ 得 $A = 1$，再在式子两边同时乘以 $x + 1$ 得
\[
\dfrac{7x - 2}{2x - 1} = \dfrac{x + 1}{2x - 1} A + B
\]
最后令 $x = -1$ 得 $B = 3$.

故原式为
\[
\begin{aligned}
I & = integral \left( \dfrac{1}{2x - 1} + \dfrac{3}{x + 1} \right) \,"d"x \\
& = \dfrac{1}{2} \ln{|2x - 1|} + 3\ln{|x + 1|} + C
\end{aligned}
\]
\end{solution}

== 欧拉公式在积分中的应用

令 $y = e^{"i"x}$，则有
\[
2"i" \sin{x} = y - frac{1}{y}, 2 cos{x} = y + frac{1}{y}
\]
\[
// 2"i" \sin{kx} = y^k - frac{1}{y^k}, 2 cos{kx} = y^k + frac{1}{y^k}, k \in NN_0
\]

\begin{example}
求 $I = integral cos^4{x} \,"d"x$.
\end{example}

\begin{solution}
因为
\[
\begin{aligned}
\left(2cos{x}\right)^4 & = \left(y + frac{1}{y}\right)^4                              \\
& = y^4 + frac{1}{y^4} + 4\left(y^2 + frac{1}{y^2}\right) + 6 \\
& = 2 cos{4x} + 8 cos{2x} + 6
\end{aligned}
\]
故
\[
cos^4{x} = frac{cos{4x}}{8} + frac{cos{2x}}{2} + frac{3}{8}
\]
\[
I = integral cos^4{x} \,"d"x = frac{\sin{4x}}{32} + frac{\sin{2x}}{4} + frac{3x}{8} + C
\]
\end{solution}

对于不出现奇数次幂的正弦函数积分非常好处理. 若出现了奇数次幂，一般按 $\sin{x} \,"d"x = -"d"cos{x}$ 的方式处理.

== 费曼积分法 \label{subsec:feiman-integration}

若 $f(x, t)$ 在 $R[x \in [a, A], t \in [b, B]]$ 内有定义且连续，且 $\dfrac{partial{f}}{partial{t}}$ 在 $R$ 内连续，则有
\[
\dfrac{"d"}{"d"t} integral_{a}^{A} f(x, t) \,"d"x = integral_{a}^{A} \dfrac{partial{f}}{partial{t}} \,"d"x
\]

更一般情况下，当下限为 $u(t)$，上限为 $v(t)$，且 $t \in (b, B)$ 时有
\[
u(t) \in [a, A], v(t) \in [a, A]
\]
则有
\[
\dfrac{"d"}{"d"t} integral_{u(t)}^{v(t)} f(x, t) \,"d"x = f(v(t), t) \cdot v'(t) - f(u(t), t) \cdot u'(t) + integral_{u(t)}^{v(t)} \dfrac{partial{f}}{partial{t}} \,"d"x
\]

\begin{example}
求 $I = integral \dfrac{"d"x}{(1 + x^2)^2}$.
\end{example}

\begin{solution}
构造
\[
f(x, t) = integral \dfrac{"d"x}{t^2 + x^2}
\]
则
\[
\dfrac{partial{f}}{partial{t}} = integral \dfrac{-2t \,"d"x}{(t^2 + x^2)^2}
\]
有
\[
\left[\dfrac{partial{f}}{partial{t}}\right]_{t \to 1} = -2I
  \]
  故
  \[
  \begin{aligned}
  I & = -\dfrac{1}{2} \left[\dfrac{partial{f}}{partial{t}}\right]_{t \to 1}                                                                          \\
& = -\dfrac{1}{2} \left[\dfrac{partial}{partial{t}} integral \dfrac{"d"x}{t^2 + x^2} \right]_{t \to 1}                                        \\
  & = -\dfrac{1}{2} \left[\dfrac{partial}{partial{t}} \left( \dfrac{1}{t} \arctan{\dfrac{x}{t}} \right) \right]_{t \to 1}                          \\
// & = -\dfrac{1}{2} \left[ -\dfrac{1}{t^2} \arctan{\dfrac{x}{t}} - \dfrac{x}{t^3} \cdot \dfrac{1}{1 + \left(\dfrac{x}{t}\right)^2} \right]_{t \to 1} \\
& = \dfrac{\arctan{x} + \dfrac{x}{1 + x^2}}{2} + C
\end{aligned}
\]
\end{solution}

更多信息见 \href{http://mathmarch.com/knowledge/0d9388502e0811eabe02815ed3256640}{此链接}.

== 一元函数定积分

== 一般函数反常积分敛散性的判定

反常积分有以下两种可能：

\begin{itemize}
\item \textbf{无穷限的反常积分} —— 积分上下限任一为无穷：$integral_{a}^{+oo} f(x) \,"d"x$、$integral_{-oo}^{b} f(x) \,"d"x$、$integral_{-oo}^{+oo} f(x) \,"d"x$.
\item \textbf{无界函数的反常积分} —— 积分区间内某点 (瑕点) 函数值为无穷：$integral_{a}^{b} f(x) \,"d"x$ 且 $exists x_0 \in [a, b]$ 使 $f(x_0) = oo$
\end{itemize}

当然这两种情况也可以同时成立，接下来给出判定方法：

\paragraph{无穷限判定}记 $\lim_{x \to oo} x^p f(x) = A$

\begin{itemize}
\item 若存在 $p > 1$ 使 $A$ 存在，则收敛.
\item 若存在 $p \leq 1$ 使 $A$ 为无穷或非零数，则发散.
\end{itemize}

\paragraph{瑕点判定}记 $\lim_{x \to x_0^+} (x - x_0)^p f(x) = A$
\begin{itemize}
\item 若存在 $p < 1$ 使 $A$ 存在，则收敛.
\item 若存在 $p \geq 1$ 使 $A$ 为无穷或非零数，则发散.
\end{itemize}

当然你还需要判定 $\lim_{x \to x_0^-} (x_0 - x)^p f(x) = A$，只有当各处均收敛时，才能判定整体收敛.

== 奇偶函数反常积分的敛散性

若 $integral_{-oo}^{+oo} f(x) \,"d"x$ 收敛，则
\[
integral_{-oo}^{+oo} f(x) \,"d"x =
  \begin{cases}
  0                                       & f(x) 为奇函数 \\
  2 integral_{0}^{+oo} f(x) \,"d"x & f(x) 为偶函数
\end{cases}
\]

若
\[
// integral_{-oo}^{+oo} f(x) \,"d"x \coloneqq
// \lim\limits_{A \to +oo, B \to -oo} integral_{B}^{A} f(x) \,"d"x
\]
存在，则
$$
// \lim\limits_{R \to +oo} integral_{-R}^{R} f(x) \,"d"x
$$
存在，反之不一定成立.

== 反常积分和的敛散性

\begin{table}[H]
\small
\centering
\caption{反常积分和的敛散性} \label{tbl:improper-integral-sum-convergence}
\begin{tabular}{ccc}
\hline
$integral_{a}^{+oo} f(x) \,"d"x$ & $integral_{a}^{+oo} g(x) \,"d"x$ & $integral_{a}^{+oo} [f(x) \pm g(x)] \,"d"x$ \\
\hline
收敛                                      & 收敛                                      & 收敛                                                 \\
收敛                                      & 发散                                      & 发散                                                 \\
发散                                      & 发散                                      & 不确定                                                \\
\hline
$integral_{-oo}^{a} f(x) \,"d"x$ & $integral_{a}^{+oo} f(x) \,"d"x$ & $integral_{-oo}^{+oo} f(x) \,"d"x$      \\
\hline
收敛                                      & 收敛                                      & 收敛                                                 \\
--                                      & --                                      & 发散                                                 \\
\hline
\end{tabular}
\end{table}

== 三角函数的积分特性

以下性质均由区间重现推出：

\[
integral_{0}^{\pi} x f(\sin{x}) \,"d"x = \dfrac{\pi}{2} integral_{0}^{\pi} f(\sin{x}) \,"d"x
\]
\[
integral_{0}^{frac{\pi}{2}} f(\sin{x}) \,"d"x = integral_{0}^{frac{\pi}{2}} f(cos{x}) \,"d"x
\]

== Wallis 公式

\[
\begin{aligned}
I & = integral_{0}^{frac{\pi}{2}} \sin^m{x} cos^n{x} \,"d"x \\
  & = integral_{0}^{frac{\pi}{2}} cos^m{x} \sin^n{x} \,"d"x \\
& =
\begin{cases}
\dfrac{(m - 1)!! (n - 1)!!}{(m + n)!!}                      & 若 m,n 不均为偶数 \\
\dfrac{(m - 1)!! (n - 1)!!}{(m + n)!!} \cdot \dfrac{\pi}{2} & 若 m,n 均为偶数
\end{cases}
\end{aligned}
\]

== 周期函数的积分特性

若 $f(x)$ 为周期为 $T$ 的连续函数，则有
\[
integral_{a}^{a + T} f(x)\,"d"x = integral_{b}^{b + T} f(x)\,"d"x
\]

== 一元函数积分转多元函数积分

对 $rho = rho(theta)$，有面积公式
\[
S = frac{1}{2} integral_{theta_1}^{theta_2} rho^2\,"d"theta
  \]
  故当求如下形式积分
  \[
  I = integral_{a}^{b} f^2(\sin theta, costheta)\,"d"theta
\]
可设
\[
rho = f(\sin theta, costheta)
\]
令
\[x = rho costheta, y = rho \sin theta
\]
则有
\[
I = 2S
\]
转化为二重积分更易处理.

对于
\[
I = integral_0^{+oo} frac{f(x)}{x}\,"d"x
\]
可用公式
\[
frac{1}{x} = integral_0^{+oo} e^{-xy}\,"d"y
\]
得
\[
I = integral_0^{+oo} "d"y \cdot integral_0^{+oo} f(x) e^{-xy}\,"d"x
\]
特别适用于 $f(x) = e^{a x}$ 或 $f(x) = a \sin{b x} + c cos{d x}$ 等情况. 参见 \href{https://www.bilibili.com/video/av1604217605}{此链接} 与 \href{https://www.bilibili.com/video/av368640102}{此链接}.

== 傅汝兰尼积分 (Frullani 积分)

设 $f(x)$ 在 $[0, +oo)$ 上连续，$a, b > 0$，定义如下积分
\[
I = integral_0^{+oo} frac{f(ax) - f(bx)}{x}\,"d"x
\]

\begin{itemize}
\item 若 $\lim_{x \to +oo} f(x) = A$，则
\[
I = [f(0) - A] \ln{frac{b}{a}}
\]

\item 若存在 $k > 0$ 使得 $integral_k^{+oo} frac{f(x)}{x}\,"d"x$ 收敛，则
\[
I = f(0) \ln{frac{b}{a}}
\]

\item 若存在 $k > 0$ 使得 $integral_0^k frac{f(x)}{x}\,"d"x$ 收敛，则
\[
I = -f(+oo) \ln{frac{b}{a}}
\]
\end{itemize}

== 定积分的应用

== 平面图形面积

\begin{itemize}
\item 对于直角坐标函数 $y = f(x)$，或反函数 $x = phi.alt(y)$，面积公式易推导.
\item 极坐标下，有
\[
S = frac{1}{2} integral_a^b rho^2(theta)\,"d"theta
\]
更多内容参见 \cref{subsec:jacobian-matrix}.
\end{itemize}

== 平面曲线弧长

\begin{itemize}
\item 参数方程下公式易推导.
\item 直角坐标 $y = f(x)$ 情形可转化为参数形式.
\item 极坐标下有
\[
l = integral_a^b \sqrt{rho^2(theta) + rho'^2(theta)}\,"d"theta
\]
更多内容参见 \cref{sec:line-integral-and-surface-integral}.
\end{itemize}

== 旋转体体积

易推导的情形不赘述. 若以极坐标形式表示，可参见 \href{https://www.bilibili.com/video/av554024399}{此链接} 及 \cref{subsec:jacobian-matrix}.

考虑角度 $theta$ 有微小变化 $"d"theta$，其旋转体体积微元为
\[
"d"V = frac{2\pi}{3} rho^3 \sin theta\,"d"theta
\]

\begin{proof}
面积微元为小长方形
\[
"d"S = rho\,"d"theta\,"d"rho
\]
微体积元为
\[
"d"v = "d"S \cdot 2\pi rho \sin theta
\]
总体积为
\[
"d"V = integral_0^rho 2\pi rho^2 \sin theta\,"d"theta\,"d"rho = 2\pi \sin theta \cdot frac{rho^3}{3} \,"d"theta
\]
\end{proof}

== 旋转曲面面积

直角坐标情形容易推导，参数方程情形可直接套用参数形式，更多参见 \cref{sec:line-integral-and-surface-integral}.

== 多元函数微分

== 多元函数求导

若 $z = z(x, y)$，则
\[
"d"z = \dfrac{partial z}{partial x} "d"x + \dfrac{partial z}{partial y} "d"y
\]

若 $z = z(u, v),\ u = u(x, y),\ v = v(x, y)$，则
\[
\dfrac{partial z}{partial x} = \dfrac{partial z}{partial u} \dfrac{partial u}{partial x} + \dfrac{partial z}{partial v} \dfrac{partial v}{partial x}
\]
\[
\dfrac{partial z}{partial y} = \dfrac{partial z}{partial u} \dfrac{partial u}{partial y} + \dfrac{partial z}{partial v} \dfrac{partial v}{partial y}
\]

若 $I(x) = integral_{u(x)}^{v(x)} f(t) "d"t$，则
\[
\dfrac{"d"I}{"d"x} = f(v) v' - f(u) u'
\]

当积分内不单为关于 $t$ 的函数时，需要代换变量，注意该式和 \cref{subsec:feiman-integration} 中式子的不同.

== 二元函数极限

若
\[
// \lim_{(x, y) \to (x_0, y_0)} \dfrac{F(x, y)}{G(x, y)} = a
\]
则可以转写为在 $(x_0, y_0)$ 的某个领域内 $F(x, y) = a G(x, y)$.

\begin{example}
已知 $f(x, y)$ 在点 $(0, 0)$ 的去心邻域内有定义，且满足
\[
// \lim_{x \to 0, y \to 0} \dfrac{f(x, y) - f(0, 0)}{x^2 + 1 - x\sin y} = -3
\]
则函数 $f(x, y)$ 在点 $(0, 0)$ 处是 \_\_\_\_（填“极大值”“极小值”或“非极值”）点.
\end{example}

这题若转写了，那么 $f(x, y) = -3(x^2 + 1 - x\sin y) + f(0, 0)$，以此推导会得出非极值点的结论，但我们假定的这个函数是有问题的，代入 $(0, 0)$ 会发现 $f(0, 0)$ 无解，即不存在那样的连续的、二阶可导的函数满足题意，实际上题目也提醒了去心，而我们这个心是有问题的，所以不能转写.

\begin{solution}
当 $x \to 0, y \to 0$ 时
\[
x^2 + 1 - x\sin y \to 1 > 0
\]
故
\[
f(x, y) - f(0, 0) \to -3 < 0
\]
根据极值点定义，在 $(0, 0)$ 的某个去心邻域内有 $f(x, y) < f(0, 0)$，即 $f(0, 0)$ 是极大值点.
\end{solution}

这种题还是利用定义做好些.

== 二元函数连续、偏导存在、偏导连续、可微的判定和关系

== 二元函数连续的判定

若
\[
// \lim_{(x, y) \to (x_0, y_0)} f(x, y) = f(x_0, y_0)
\]
则称 $f(x, y)$ 在 $(x_0, y_0)$ 处连续.

可令 $x = rho cos theta,\ y = rho sin theta$ 进行代换，若极限结果与 $theta$ 相关不等于 $f(x_0, y_0)$，则不连续.

== 二元函数偏导存在的判定

若
\[
\lim_{x \to x_0} \dfrac{f(x, y_0) - f(x_0, y_0)}{x - x_0} 存在 \implies f'_x(x_0, y_0)存在
\]

若
\[
\lim_{y \to y_0} \dfrac{f(x_0, y) - f(x_0, y_0)}{y - y_0} 存在 \implies f'_y(x_0, y_0)存在
\]

== 二元函数偏导连续的判定

若
\[
\lim_{(x, y) \to (x_0, y_0)} \dfrac{partial f(x, y)}{partial x} = f'_x(x_0, y_0)
\]
则称 $f(x, y)$ 在 $(x_0, y_0)$ 关于 $x$ 的偏导连续.

同理，对于 $y$ 的偏导也类似.

== 二元函数可微的判定

若 $f'_x(x_0, y_0)$ 和 $f'_y(x_0, y_0)$ 都存在，则考查极限
\[
// \lim_{(Delta x, Delta y) \to (0, 0)} \dfrac{f(x_0 + Delta x, y_0 + Delta y) - f(x_0, y_0) - f'_x(x_0, y_0)Delta x - f'_y(x_0, y_0)Delta y}{\sqrt{Delta x^2 + Delta y^2}} = 0
\]
成立则称可微，否则不可微.

== 二元函数连续、偏导存在、偏导连续、可微的关系

\[
两个偏导在 (x_0, y_0) 连续 \implies
\left\{
\begin{aligned}
& f(x, y) 在该点可微                  \\
& f(x, y) 在该点连续 \implies 两个偏导都存在
\end{aligned}
\right.
\]

未标注箭头表示无法推出.

== 多元函数极值点的判定

设 $z = F(x, y)$ 在 $(x_0, y_0)$ 处具有连续二阶偏导数，且 $f'_x = 0,\ f'_y = 0$, 设 $f''_{x x} = A,\ f''_{x y} = B,\ f''_{y y} = C$，则：

\begin{itemize}
\item 若 $A C - B^2 > 0$ 且 $A > 0$，为极小值. $A < 0$，为极大值.
\item 若 $A C - B^2 < 0$，不是极值点.
\item 若 $A C - B^2 = 0$，不能确定，用定义判断.
\end{itemize}

== 多元函数积分

== 轮换对称性

若 $D subset RR^2$ 且 $forall{(x, y) \in D}$ 都有 $(y, x) \in D$，则 $D$ 具有轮换对称性.

\begin{example}
求
\[
\begin{aligned}
// I & = \iint_{D} (\dfrac{x^2}{a^2} + \dfrac{y^2}{b^2}) \,"d"x"d"y \\
D & = \{(x, y) | x^2 + y^2 \leqslant R^2\}
\end{aligned}
\]
\end{example}

\begin{solution}
因为 $D$ 满足轮换对称性，故
\[
I = \iint_{D} (\dfrac{y^2}{a^2} + \dfrac{x^2}{b^2}) \,"d"x"d"y
  \]
  故
  \[
  2I = (\dfrac{1}{a^2} + \dfrac{1}{b^2}) \iint_{D} (x^2 + y^2) \,"d"x"d"y
\]
下略.
\end{solution}

当然对于更高维也有相似结论，此处略.

== 雅可比矩阵 \label{subsec:jacobian-matrix}

在进行二元函数积分时我们想进行换元，但 $"d"x"d"y$ 该换成什么呢？

// 我们来探讨一下令 $x = x(u, v)$, $y = y(u, v)$ 到底是什么意思 —— 是这样的一个函数 $F$ 作用于向量 $\begin{bmatrix}u\\v\end{bmatrix}$ 后输出 $\begin{bmatrix}x(u, v)\\y(u, v)\end{bmatrix}$.

// 我们考虑极小区域上输入的微小变动与输出的微小变动，其可视作线性变换，记 $J = \begin{bmatrix}k_1 & k_3 \\ k_2 & k_4\end{bmatrix}$，我们来推导该值.

\begin{solution}
对于
\[
\begin{bmatrix}"d"u \\ 0\end{bmatrix}
\]
有
\[
J \begin{bmatrix}"d"u \\ 0\end{bmatrix} = \begin{bmatrix}k_1"d"u \\ k_2"d"u\end{bmatrix}
\]
而这又对应参数方程的极小方向向量，故
\[
k_1 "d"u = \dfrac{partial{x}}{partial{u}} \cdot "d"u \implies k_1 = \dfrac{partial{x}}{partial{u}}
\]
\[
k_2 "d"u = \dfrac{partial{y}}{partial{u}} \cdot "d"u \implies k_2 = \dfrac{partial{y}}{partial{u}}
\]
同理
\[
k_3 = \dfrac{partial{x}}{partial{v}}
\]
\[
k_4 = \dfrac{partial{y}}{partial{v}}
\]
故
\[
J =
\begin{bmatrix}
\dfrac{partial{x}}{partial{u}} & \dfrac{partial{x}}{partial{v}} \\ \dfrac{partial{y}}{partial{u}} & \dfrac{partial{y}}{partial{v}}
\end{bmatrix}
\]
又有面积微元比例
\[
absdet{J} \cdot "d"u"d"v = \,"d"x"d"y
\]
\end{solution}

详情可见 \href{https://www.bilibili.com/video/av82535620}{3Blue1Brown 《雅可比矩阵下：所谓的雅可比行列式》}. 且由此可见平面直角坐标转极坐标时 $abs det{J}$ 就等于 $rho$. 这对多元函数也是成立的，如三维直角坐标转极坐标时有
\[
abs det{J} = rho^2\sin{\varphi}
\]

== 曲线积分 \label{sec:line-integral-and-surface-integral}

该节内容不严谨，很多讨论都只限于二维、三维情况. 部分参照 \href{https://zhuanlan.zhihu.com/p/52347499?utm_psn=1791998179333525505}{此链接}.

更多相关视频：
\begin{itemize}
\item \href{https://www.bilibili.com/video/BV1dg4y1v7RP}{中英双语 可视化讲解格林定理}
\item \href{https://www.bilibili.com/video/BV19s41157Z4}{散度与旋度：麦克斯韦方程组、流体等所用到的语言}
\item \href{https://www.bilibili.com/video/BV1a541127cX}{nabla 算子 与梯度、散度、旋度}
\end{itemize}

== 第一类曲线积分 \label{subsec:first-kind-line-integral}

第一类曲线积分与积分方向无关，这适用于标量场.

\begin{example}
设线密度 $rho(x, y)$，则线质量为
\[
// M = integral_{L} rho(x, y) \,"d"s
\]
\end{example}

\begin{solution}
通常做法是找到参数 $t$，使得 $x = x(t), y = y(t)$，且保持方向一致.

则
\[
"d"x = x'(t)\,"d"t,\quad "d"y = y'(t)\,"d"t
\]
从而
\[
"d"s = \sqrt{"d"x^2 + "d"y^2} = \sqrt{x'^2 + y'^2}\,"d"t
\]
\end{solution}

对于更高维的情况可以类比推理.

实际上，第一类曲线积分也可以换元，详见 \href{https://open.163.com/newview/movie/free?pid=WHLGTKCPS&mid=XIAM50G16}{此链接}，但这疑似记不住，仅供了解. 极坐标代换还是要记的，曲线微元 $"d"s = sqrt{rho^2 + rho'^2}\,"d"theta$.

== 第二类曲线积分 \label{subsec:second-kind-line-integral}

第二类曲线积分与积分方向有关，这适用于矢量场.

\begin{example}
已知力场
\[
vec{F}(x, y) = \begin{bmatrix}F_x(x, y) \\ F_y(x, y)\end{bmatrix}
\]
求沿曲线 $vec{L}$ 的功 $W_{vec{L}}$.
\end{example}

\begin{solution}
\[
\begin{aligned}
W_{vec{L}} & = integral_{vec{L}} vec{F}"d"vec{s}        \\
// & = integral_{vec{L}} F_x"d"x + F_y"d"y
\end{aligned}
\]
且显然有 $W_{vec{L}} = -W_{-vec{L}}$.
\end{solution}

类似于第一类曲线积分，可以使用参数方程求解.

对于封闭曲线，见 \cref{subsec:nabla-curl-stokes}. 对于非封闭曲线，补全曲线为封闭曲线，并对补线使用参数方程法.

== Nabla 算子、环量、旋度、格林公式与斯托克斯公式 \label{subsec:nabla-curl-stokes}

当 $L$ 为闭合曲线时，该曲线积分即 $vec{F}$ 沿着曲线 $L$ 的环量. 利用 $W_{vec{L}} = -W_{-vec{L}}$，我们可以将环所包面域分割为无穷多小面域 $"d"vec{S}$，从而有
\[
\oint_{partial{D}}vec{F}"d"vec{s} = \iint_{D} vec{nabla} times vec{F} "d"vec{S}
\]

这里 $D$ 与 $partial{D}$ 的定义略，这里的 $vec{nabla}$ 称作 Nabla 算子，也称哈密顿算子.

\[
vec{nabla} = \begin{bmatrix}\dfrac{partial}{partial{x_1}} \\ \vdots \\ \dfrac{partial}{partial{x_n}}\end{bmatrix}
\]

要提醒的一点是 $vec{nabla} times vec{F}$ 不完全是叉乘，而是表示求旋度的意思，即 $"rot" vec{F}$，其反应了某点角动量的大小.

不同于梯度和散度，旋度不能简单的推广到其他维度，但是只有在三维中其结果为向量.

对于二元函数来说，该式子即格林公式
\begin{equation} \label{eq:green-theorem}
\begin{aligned}
\oint_{partial{D}}vec{F}"d"vec{s}
  & = \iint_{D} vec{nabla} times vec{F} \,"d"x"d"y \\
//  & = \iint \limits_{D} det{
\begin{bmatrix}
\dfrac{partial}{partial{x}} & \dfrac{partial}{partial{y}} \\ F_x & F_y
\end{bmatrix}
} \,"d"x"d"y
\end{aligned}
\end{equation}

对于三元函数来说，该式子即斯托克斯公式
\begin{equation} \label{eq:stokes-theorem}
\oint_{partial{D}}vec{F}"d"vec{s} = \iint_{D} vec{nabla} times vec{F} \cdot \begin{bmatrix}"d"y"d"z \\ "d"z"d"x \\ \,"d"x"d"y\end{bmatrix}
\end{equation}

== 线积分路径无关的判定

无旋场，即 $"rot" vec{F} equiv vec{0}$ 就有路径无关 —— 因为角动量抵消，所以在线上的积分恒为 0.

== 曲面积分

== 第一类曲面积分

第一类曲面积分与积分方向无关，这适用于标量场.

\begin{example}
例如面密度 $rho(x, y, z)$，则面质量
\[
// M = \iint_{\varSigma} rho(x, y, z) \, "d"S
\]
一般来说，该面 $Sigma$ 会以 $z = z(x, y)$ 的形式给出，从而有
\[
"d"S = \sqrt{1 + \left( \dfrac{partial{z}}{partial{x}} \right)^2 + \left( \dfrac{partial{z}}{partial{y}} \right)^2} \, "d"x "d"y
\]
\end{example}

\begin{solution}
在曲面 $z = z(x, y)$ 上取点 $(x_0, y_0, z_0)$，其在 $x$ 方向上有极小变动 $"d"x$，则变动向量为
\[
vec{v_1} = \left(1, 0, \dfrac{partial{z}}{partial{x}} \right) "d"x
\]
同理，$y$ 方向有
\[
vec{v_2} = \left(0, 1, \dfrac{partial{z}}{partial{y}} \right) "d"y
\]
可得面积微元即两个向量的叉积的模长，即
\[
"d"S = |vec{v_1} times vec{v_2}|
\]
对于其他情况也一样.
\end{solution}

这里再多提一个技巧：若被积函数 $rho(x, y, z) = F(x, y) \cdot z$ 且 $z \dfrac{partial{z}}{partial{x}}$、$z \dfrac{partial{z}}{partial{y}}$ 容易计算，则有
\[
M = \iint_{\varSigma} F(x,y) z\, "d"S = \iint_{D} F(x, y) \sqrt{z^2 + \left(z \dfrac{partial{z}}{partial{x}}\right)^2 + \left(z \dfrac{partial{z}}{partial{y}}\right)^2} \, "d"x "d"y
\]

这在球面、锥面上极其好用.

== 第一类曲面积分的参数方程法 \label{subsec:first-kind-surface-integral-parameterization}

被积曲面为 $F(x, y, z) = 0$，令
\[
x = x(u, v), y = y(u, v), z = z(u, v)
\]
满足该式且保向.

其在 $u$ 方向上有极小变动 $"d"u$，则变动向量为
\[
vec{v_1} = \left(\dfrac{partial{x}}{partial{u}}, \dfrac{partial{y}}{partial{u}}, \dfrac{partial{z}}{partial{u}} \right) "d"u
\]
同理，$v$ 方向有
\[
vec{v_2} = \left(\dfrac{partial{x}}{partial{v}}, \dfrac{partial{y}}{partial{v}}, \dfrac{partial{z}}{partial{v}} \right) "d"v
\]
面积微元为
\[
"d"S = |vec{v_1} times vec{v_2}| = \left| \left( \dfrac{partial{(y, z)}}{partial{(u, v)}}, \dfrac{partial{(z, x)}}{partial{(u, v)}}, \dfrac{partial{(x, y)}}{partial{(u, v)}} \right) "d"u "d"v \right|
\]
其中
\[
\dfrac{partial{(y, z)}}{partial{(u, v)}} =
\begin{vmatrix}
\dfrac{partial{y}}{partial{u}} & \dfrac{partial{y}}{partial{v}} \\
\dfrac{partial{z}}{partial{u}} & \dfrac{partial{z}}{partial{v}}
\end{vmatrix}
\]

\begin{example}
求
\[
// I = \iint_{\varSigma} \sqrt{\dfrac{x^2}{a^4} + \dfrac{y^2}{b^4} + \dfrac{z^2}{c^4}} \, "d"S
\]
其中
\[
\varSigma: \dfrac{x^2}{a^2} + \dfrac{y^2}{b^2} + \dfrac{z^2}{c^2} = 1
\]
\end{example}

\begin{solution}
令
\[
x = a\sin{\varphi}cos{theta}, y = b\sin{\varphi}\sin{theta}, z = ccos{\varphi}
\]
有
\[
"d"S = |vec{v_1} times vec{v_2}| = abc \sin{\varphi} \sqrt{\dfrac{x^2}{a^4} + \dfrac{y^2}{b^4} + \dfrac{z^2}{c^4}} \, "d"\varphi "d"theta
\]
即
\[
\begin{aligned}
I & = integral_{0}^{2\pi} "d"theta integral_{0}^{\pi} abc \left(\dfrac{\sin^3{\varphi} cos^2{theta}}{a^2} + \dfrac{\sin^3{\varphi} \sin^2{theta}}{b^2} + \dfrac{\sin{\varphi} cos^2{\varphi}}{c^2} \right) "d"\varphi                                            \\
& = abc \left( \dfrac{2 \cdot \dfrac{2!!}{3!!} \cdot 4 \cdot \dfrac{1!!}{2!!} \cdot \dfrac{\pi}{2}}{a^2} + \dfrac{2 \cdot \dfrac{2!!}{3!!} \cdot 4 \cdot \dfrac{1!!}{2!!} \cdot \dfrac{\pi}{2}}{b^2} + \dfrac{2 \cdot \dfrac{0!! \cdot 1!!}{3!!} \cdot 2\pi}{c^2} \right) \\
& = \dfrac{4\pi abc}{3} \left( \dfrac{1}{a^2} + \dfrac{1}{b^2} + \dfrac{1}{c^2} \right)
\end{aligned}
\]
\end{solution}

== 第二类曲面积分

第二类曲面积分与积分方向有关，这适用于矢量场.

\begin{example}
// 已知磁场 $vec{B}(x, y, z) = \begin{bmatrix}B_x(x, y, z) \\ B_y(x, y, z) \\ B_z(x, y, z)\end{bmatrix}$，则磁通量为
\[
// Phi_{vec{S}} = \iint_{vec{S}} vec{B} \cdot "d"vec{S} = \iint_{vec{S}} B_x \, "d"y"d"z + B_y \, "d"z"d"x + B_z \, "d"x"d"y
\]
且显然有 $Phi_{vec{S}} = -Phi_{-vec{S}}$.
\end{example}

== 第二类曲面积分的参数方程法

同理，有：
\[
"d"vec{S} = vec{v_1} times vec{v_2} = \left( \dfrac{partial{(y, z)}}{partial{(u, v)}}, \dfrac{partial{(z, x)}}{partial{(u, v)}}, \dfrac{partial{(x, y)}}{partial{(u, v)}} \right) "d"u"d"v
\]
因此：
\[
vec{B} \cdot "d"vec{S} = \left( B_x \dfrac{partial{(y, z)}}{partial{(u, v)}} + B_y \dfrac{partial{(z, x)}}{partial{(u, v)}} + B_z \dfrac{partial{(x, y)}}{partial{(u, v)}} \right) "d"u"d"v
\]

我们来看特例：

若有向曲面 $vec{S}$ 以 $z = z(x, y)$ 的形式给出，其在 $x O y$ 面上的投影为 $D$，则有：
\[
vec{B} \cdot "d"vec{S} = \left( -\dfrac{partial{z}}{partial{x}} B_x -\dfrac{partial{z}}{partial{y}} B_y + B_z \right) (\pm "d"x"d"y)
\]
其中，当 $vec{S}$ 与 $z$ 轴同向时取 $+$, 反之取 $-$.

== 通量、散度与高斯公式

不像环量有闭曲线的要求, 第二类曲面积分即称为通量，我们研究闭曲面上的通量.

散度表示为：
\[
vec{nabla} \cdot vec{F} = \mathrm{div} vec{F} = \dfrac{partial{F_x}}{partial{x}} + \dfrac{partial{F_y}}{partial{y}} + \dfrac{partial{F_z}}{partial{z}}
\]
其反映某点流出物质与流入物质的多少.

利用 $Phi_{vec{S}} = -Phi_{-vec{S}}$，我们可以将曲面所包围体域分割为无穷多个小体元 $"d"V$，从而得到：
\[
\begin{aligned}
I & = \oiint_{partial{V}} vec{F} \cdot "d"vec{S}                                                                                               \\
  & = \iiint_{V} vec{nabla} \cdot vec{F} \, "d"V                                                                                               \\
// & = \iiint_{V} \left( \dfrac{partial{F_x}}{partial{x}} + \dfrac{partial{F_y}}{partial{y}} + \dfrac{partial{F_z}}{partial{z}} \right) "d"V
\end{aligned}
\]

这就是高斯公式.

== 面积分路径无关的判定

若矢量场无散，即 $div vec{F} equiv 0$，则面积分路径无关. 因为任意封闭曲面上的流入和流出会抵消，所以在面上的积分恒为 0.

== 曲线积分与曲面积分中的奇点处理

在曲线积分和曲面积分中，若被积函数在某些点上有奇点，则需要对这些点进行处理.

== 曲线积分中的奇点处理

% TODO: 该节内容待补充

== 曲面积分中的奇点处理

% TODO: 该节内容待补充

== 泊松曲面积分

$f(x)$ 在 $RR$ 上连续，则
\[
\iint_{x^2 + y^2 + z^2 = 1} f(ax + by + cz) \, "d"S = 2\pi integral_{-1}^{1} f(\sqrt{a^2 + b^2 + c^2} \, t) \, "d"t
\]

证明如下，推导参考自 \href{https://www.bilibili.com/video/av571611163}{此链接}：

\begin{proof}
首先进行正交变换旋转坐标系为 $u$-$v$-$w$，考虑原坐标系过曲面上一点
\[
(x_0, y_0, z_0)
\]
的平面
\[
ax + by + cz = ax_0 + by_0 + cz_0
\]
并规定其法向量为 $(a, b, c)$，该旋转使 $w$ 轴与该法向量方向一致，可得在新坐标下左式等于
\[
// \iint_{u^2 + v^2 + w^2 = 1} f(F(u, v, w)) \, "d"S'
\]
这里的 $F(u, v, w)$ 还需要我们求出来.

有新坐标系坐标 $(u_0, v_0, w_0)$ 中 $w_0$ 即原坐标系中点到面 $a x + b y + c z = 0$ 的有正负的距离，可得
\[
w_0 = frac{ax_0 + by_0 + cz_0}{\sqrt{a^2 + b^2 + c^2}}
\]
即进行了
\[
ax + by + cz = \sqrt{a^2 + b^2 + c^2} w
\]
的代换，故我们得到
\[
F(u, v, w) = \sqrt{a^2 + b^2 + c^2} w
\]
则令
\[
u = \sqrt{1 - t^2} cos{theta}, \quad v = \sqrt{1 - t^2} \sin{theta}, \quad w = t
\]
由 \cref{subsec:first-kind-surface-integral-parameterization} 可得
\[
"d"S' = "d"t \, "d"theta
\]

\textit{这其实说明了圆柱面和对应的球面两者的面积元素大小一样，参见 \href{https://www.bilibili.com/video/BV1Et411W7oM}{【官方双语】为什么球的表面积是同样半径圆的面积的四倍？}.}

故式子即
\[
// integral_{0}^{2\pi} "d"theta integral_{-1}^{1} f(\sqrt{a^2 + b^2 + c^2} \, t) \, "d"t = 2\pi integral_{-1}^{1} f(\sqrt{a^2 + b^2 + c^2} \, t) \, "d"t
\]
\end{proof}

== 微分方程

== 可以分离变量的微分方程

若 $\dfrac{"d"y}{"d"x} = f(x) g(y)$，则 $\dfrac{"d"y}{g(y)} = f(x) "d"x$，两边分别积分即可.

== 齐次微分方程

若 $\dfrac{"d"y}{"d"x} = f(\dfrac{y}{x})$，则令
\[
u = \dfrac{y}{x} \implies \dfrac{"d"y}{"d"x} = xu' + u
\]
代入化为
\[
integral{\dfrac{"d"u}{f(u) - u}} = \ln{|x|} + C
\]
后略.

当然，若 $\dfrac{"d"x}{"d"y} = f(\dfrac{x}{y})$，换个视角看看即可. 事实上这种方法不局限于 $\dfrac{y}{x}$，应当灵活使用代换.

== 一阶线性微分方程

对 $y' + P(x)y = Q(x)$，有通解
\[
y = \dfrac{C + \displaystyleintegral{Q(x)I(x) "d"x}}{I(x)}
\]
其中
\[
I(x) = \exp{integral{P(x)} "d"x}
\]

== 二阶常数零式

对 $y'' + p y' + q y = 0$，注意关于 $r$ 的特征方程 $r^2 + p r + q = 0$.

\begin{itemize}
\item 若 $p^2 - 4q > 0$，则有两个不等实根 $r_1, r_2$，通解为
\[
y = C_1 e^{r_1 x} + C_2 e^{r_2 x}
\]
\item 若 $p^2 - 4q = 0$，则有一个重实根 $r$，通解为
\[
y = e^{rx} (C_1 + C_2 x)
\]
\item 若 $p^2 - 4q < 0$，则有一对共轭复根 $alpha \pm \beta i$，通解为
\[
y = e^{alpha x} (C_1 cos{\beta x} + C_2 \sin{\beta x})
\]
\end{itemize}

== \texorpdfstring{$n$ 阶常数零式{n 阶常数零式}}

对 $y^{(n)} + p_1y^{(n - 1)} + \cdots + p_n y = 0$，注意特征方程 $r^n + p_1 r^{n - 1} + \cdots + p_n = 0$，由代数基本定理其有 $n$ 个根，其中

\begin{itemize}
\item 单根对应 $C e^{r x}$.
\item $k$ 重实根对应 $e^{r x} sum_{i = 1}^{k} C_i x^{i - 1}$.
\item 一对共轭根 $alpha \pm \beta i$ 对应 $e^{alpha x}(C_1 cos{\beta x} + C_2 \sin{\beta x})$.
\item $k$ 对共轭根 $alpha \pm \beta i$ 对应 $e^{r x} (cos{\beta x} sum_{i = 1}^{k} A_i x^{i - 1} + \sin{\beta x} sum_{i = 1}^{k} B_i x^{i - 1})$.
\end{itemize}

== 二阶常数非零式

对 $y'' + p y' + q y = f(x)$，其通解为其对应的二阶常数零式的通解加上一个满足其的特解，接下来我们使用微分算子法来给出这样的特解.

我们将 $\dfrac{"d"}{"d"x}$ 记为 $D$，称作微分算子，且有 $D^n = \dfrac{"d"^n}{"d"x^n}$，那么特解
\[
// y^* = \dfrac{f(x)}{D^2 + pD + q}
\]

要注意的一点，上式不完全是等式，注意微分算子是一个作用，而不是单纯的“未知数”，而为什么我们能在下面的一些例子中把它当作未知数计算呢？这就牵扯到微分其实是线性的，在此不做展开.

\begin{enumerate}
\item $f(x) = e^{k x}$ 时.

见 $D$ 代入 $k$ 即可.

若 $k^2 + p k + q = 0$，则 $y^* = x\dfrac{e^{k x}}{2D + p}$；若 $2k + p = 0$，则 $y^* = x^2\dfrac{e^{k x}}{2}$.
\item $f(x) = \sin{a x}$ 或 $f(x) = cos{a x}$ 时.

见 $D^2$ 代入 $-a^2$ 即可.

\[
// y^* = \dfrac{f(x)}{q - a^2 + pD} = \dfrac{(q - a^2) - pD}{(q - a^2)^2 - p^2D^2} f(x) = \dfrac{(q - a^2)f(x) - pf'(x)}{(q - a^2)^2 + p^2a^2}
\]

当 $p = 0$ 时极方便.

当分母为 0 时同 $f(x) = e^{k x}$ 一样分子乘 $x$，分母求导.
\item $f(x)$ 为多项式时.

设 $y^*$ 为高一次的多项式代入求解（这里使用微分算子疑似有点恶心）.
\item $f(x) = e^{k x} \cdot g(x)$ 时.

先把 $e^{k x}$ 移到式子前，再按前面的方法处理即可.

\[
// y^* = \dfrac{e^{kx} \cdot g(x)}{D^2 + pD + q} = e^{kx} \dfrac{g(x)}{(D + k)^2 + p(D + k) + q}
\]
\end{enumerate}

\begin{example}
求
\[
y'' + 2y' + 5y = e^{x} \sin{2x}
\]
\end{example}

\begin{solution}
先求对应的二阶常数零式的通解，由于
\[
r^2 + 2r + 5 = 0
\]
有一对共轭根 $-1 \pm 2i$，通解为
\[
y_c = e^{-x} (C_1 cos{2x} + C_2 \sin{2x})
\]
接下来求特解
\[
y^* = \dfrac{e^{x} \sin{2x}}{D^2 + 2D + 5}
  \]
  先把 $e^{x}$ 移到前面，得到
  \[
  \begin{aligned}
  y^* & = e^{x} \dfrac{\sin{2x}}{(D + 1)^2 + 2(D + 1) + 5} \\
& = e^{x} \dfrac{\sin{2x}}{D^2 + 4D + 8}             \\
\end{aligned}
\]
再将 $D^2$ 代入 $-2^2$，得到
\[
\begin{aligned}
// y^* & = \dfrac{e^{x}}{4} \dfrac{\sin{2x}}{D + 1}           \\
& = \dfrac{e^{x}}{4} \dfrac{(D - 1) \sin{2x}}{D^2 - 1} \\
& = e^{x} \dfrac{\sin{2x} - 2cos{2x}}{20}
\end{aligned}
\]
故通解为
\[
y = e^{-x} (C_1 cos{2x} + C_2 \sin{2x}) + e^{x} \dfrac{\sin{2x} - 2cos{2x}}{20} + C
\]
\end{solution}



