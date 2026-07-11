#import "template.typ": *
#import "@preview/ctheorems:1.1.3": *
#show: thmrules

#let problem = thmbox("theorem", "問題", fill: rgb("#eeffee")).with(numbering: none)
#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let proposition = thmbox("proposition", "Proposition", fill: rgb("#eeffee"))
#let lemma = thmbox("lemma", "補題", fill: rgb("#eeffee")).with(numbering: none)
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)

#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))


#let example = thmplain("example", "Example").with(numbering: none)
#let claim = thmplain("claim", "Claim").with(numbering: none)
#let proof = thmproof("proof", "Proof")
#let answer = thmproof("proof", "Answer")

#let depth = "depth"
#let tensor = $times.o$

#show: jarticle.with(
  fontsize: 11pt,
  title: [早稲田院 数学科 2026]
)

#problem("1")[
  領域 $D = {(x, y) in RR^2 | |x| <= x^2 + y^2 <= 1}$ について考える。以下の問に答えよ。

  (i) 領域 $D$ を図示せよ。

  (ii) 重積分
  $ integral.double_D (1 + x^2 + y^2)/sqrt(x^2 + y^2) d x d y $
  の値を求めよ。
]

#answer[
  (i)
  #figure(
    image(
      bytes("<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 320 280'><circle cx='160' cy='140' r='105' fill='#d9ecff'/><circle cx='212.5' cy='140' r='52.5' fill='white'/><circle cx='107.5' cy='140' r='52.5' fill='white'/><path d='M20 140H300M160 260V20' stroke='#666' stroke-width='1'/><g fill='none' stroke='#222' stroke-width='2'><circle cx='160' cy='140' r='105'/><circle cx='212.5' cy='140' r='52.5'/><circle cx='107.5' cy='140' r='52.5'/></g><g font-family='serif' font-size='16' fill='#222'><text x='301' y='135'>x</text><text x='166' y='18'>y</text><text x='47' y='158'>−1</text><text x='263' y='158'>1</text><text x='217' y='158'>1/2</text><text x='78' y='158'>−1/2</text></g></svg>"),
      format: "svg",
      width: 8cm,
    ),
    caption: [青色部分],
  )

  (ii) 極座標 $x = r cos theta$, $y = r sin theta$（$r >= 0$）を用いると
  $
    |x| <= x^2 + y^2 <= 1
    quad <==> quad
    |cos theta| <= r <= 1
  $
  したがって
  $
    D = {(r cos theta, r sin theta)
      | 0 <= theta < 2 pi, |cos theta| <= r <= 1}
  $
  と表される。

  Jacobian が $r$ であることと対称性から
  $
    I
    &= integral_0^(2 pi) integral_(|cos theta|)^1
         (1 + r^2) d r d theta \
    &= integral_0^(2 pi)
         (4/3 - |cos theta| - (|cos theta|^3)/3) d theta \
    &= 4 integral_0^(pi/2)
         (4/3 - cos theta - (cos^3 theta)/3) d theta \
    &= 4 (2 pi/3 - 1 - 2/9) \
    &= (24 pi - 44)/9
  $
]

#problem("2")[
  次の問に答えよ。以下では $n$ は $1$ 以上の整数とする。

  (1) $RR$ の部分空間 $W_1, W_2$ が $RR^n = W_1 + W_2$ および $W_1 inter W_2 = {0}$ を満たすとする。
  このとき、任意の $x in RR^n$ に対して $x_1 in W_1, x_2 in W_2$ の組 $(x_1, x_2)$ で $x = x_1 + x_2$ となるものが唯一つ存在することを示せ。ここで
  $ W_1 + W_2 = {x=x_1 + x_2 | x_1 in W_1, x_2 in W_2} $
  である。

  そこで $x_1 = P_(W_1) (x), x_2 = P_(W_2) (x)$ と書き、線形写像 $P_(W_1):RR^n -> RR$ を $W_2$ に沿った $W_1$ への射影、 $P_(W_2):RR^n -> RR$ を $W_1$ に沿った $W_2$ への射影とよぶ。また、$P_(W_1), P_(W_2)$ の標準基底に関する行列表示も同じ記号 $P_(W_1), P_(W_2)$ を用いることにする。

  (2) $RR^3$ の部分空間を
  $ L = {(x, y, z) in RR^3 | x + 2y + z = 0, -x + y + z = 0} $
  $ H = {(x, y, z) in RR^3 | x + y + z = 0} $
  とする。

  (a) $x = (1, 1, 1) in RR^3$  に対して $P_L (x), P_H (x)$ を求めよ。

  (b) 行列 $P_L, P_H$ を求めよ。

  (c) $3 times 3$ 行列 $A$ の固有値は $2, -1$ であり、固有値 $2$ の固有空間が $L$、固有値 $-1$ の固有空間が $H$ とする。
  $A$ を求めよ。
]

#answer[
  (1) $RR^n = W_1 + W_2$ であるから、任意の $x in RR^n$ に対して
  $x_1 in W_1$, $x_2 in W_2$ で $x = x_1 + x_2$ となるものが存在する。

  一方、
  $
    x = x_1 + x_2 = y_1 + y_2 quad (x_1, y_1 in W_1, x_2, y_2 in W_2)
  $
  と二通りに表されたとする。
  このとき
  $
    x_1 - y_1 = y_2 - x_2
  $
  であり、$x_1 - y_1 in W_1$ かつ $y_2 - x_2 in W_2$ なので
  $
    x_1 - y_1 in W_1 inter W_2 = {0}
  $
  よって $x_1 = y_1, x_2 = y_2$ である。
  以上より、そのような組 $(x_1, x_2)$ は唯一つ存在する。

  (2) $L$ の定義式から $z=x-y$, $2x+y=0$ を得るので、
  $
    L = {t(1,-2,3) | t in RR}
  $
  と書ける。
  $ell=(1,-2,3)$ とおく。$ell$ の成分の和は $2 eq.not 0$ なので
  $ell in.not H$ であり、$L inter H={0}$ である。
  また $L$ は直線、$H$ は平面であるから $RR^3=L+H$ となる。

  任意の $xi=(u,v,w) in RR^3$ に対して $xi-t ell in H$ となる条件は
  $
    0
    &= (u-t)+(v+2t)+(w-3t) \
    &= u+v+w-2t
  $
  すなわち $t=(u+v+w)/2$ である。したがって
  $
    P_L(xi)
      &= (u+v+w)/2 (1,-2,3) \
    P_H(xi)
      &= xi-P_L(xi)
  $

  (a) $xi=(1,1,1)$ を代入すると
  $
    P_L(1,1,1)
      &= (3/2,-3,9/2) \
    P_H(1,1,1)
      &= (1,1,1)-P_L(1,1,1) \
      &= (-1/2,4,-7/2)
  $

  (b) 上の一般式から、標準基底に関する行列表示は
  $
    P_L
      &= 1/2 mat(
        1, 1, 1;
        -2, -2, -2;
        3, 3, 3
      ) \
    P_H
      &= I_3-P_L \
      &= 1/2 mat(
        1, -1, -1;
        2, 4, 2;
        -3, -3, -1
      )
  $

  (c) $xi=P_L(xi)+P_H(xi)$ とおく。すると $A$ は $L$ 上では $2$ 倍の写像、$H$ 上では $-1$ 倍の写像とみなせるので
  $
    A xi = 2P_L(xi)-P_H(xi)
  $
  これが任意の $xi in RR^3$ で成り立つので
  $
    A
      &= 2P_L-P_H \
      &= 3P_L-I_3 \
      &= 1/2 mat(
        1, 3, 3;
        -6, -8, -6;
        9, 9, 7
      )
  $
]

#problem("3B")[
  空でない集合 $Lambda$ で添え字づけられた $RR$ の閉集合の族 ${C_lambda}_(lambda in Lambda)$ に対し、次の条件 (F1)、(F2)、(F3) を考える。ただし、$Lambda'$が空集合のときは $inter.big_(lambda in Lambda') C_lambda = RR$ とする。

  (F1) $Lambda$ の任意の有限部分集合 $Lambda' subset Lambda$ に対して $inter.big_(lambda in Lambda') C_lambda eq.not emptyset$ が成立する。

  (F2) $Lambda$ の任意の高々加算な部分集合 $Lambda' subset Lambda$ に対して $inter.big_(lambda in Lambda') C_lambda eq.not emptyset$ が成立する。

  (F3) $RR$ の任意の閉集合 $C$ に対し、$C = C_lambda$ か $C inter C_lambda = emptyset$ となる $lambda in Lambda$ が存在する。

  次の問に答えよ。

  (1) (F1) を満たすが $inter.big_(lambda in Lambda) C_lambda eq emptyset$ となる集合 $Lambda$ と閉集合の族 ${C_lambda}_(lambda in Lambda)$ の例を挙げよ。

  (2) $r_0 in RR$ を固定する。$r_0$ を満たす閉集合 $C$ 全体のなす族は (F2) と (F3) を満たすことを示せ。

  (3) ${O_lambda}_(lambda in Lambda)$ を $RR$ の開集合の族とする。もし $union_(lambda in Lambda) O_lambda = RR$ ならば、高々加算な $Lambda$ の部分集合 $Lambda' subset Lambda$ で $union_(lambda in Lambda') O_lambda = RR$ となるものが存在することを示せ。

  (4) (F2) と (F3) を満たす閉集合の族はある実数 $r_0$ に対して
  $ {C subset RR | C "は閉集合かつ" r_0 in C} $ #footnote[原文は${C | C "は閉集合かつ" r_0 in C}$であり、この$C$が考える閉集合族の要素であることを暗黙のうちに表している可能性もあるが、そうすると今度は $C$ が閉集合であることが自明な条件となってしまうので、ここでは $C$ は $RR$ の一般の閉集合とした。]
  となることを示せ。
]

#answer[
  (1) $Lambda={1,2,3,dots}$ とし、各 $n in Lambda$ に対して
  $
    C_n=[n,infinity)
  $
  とおく。各 $C_n$ は閉集合である。空でない有限集合
  $Lambda' subset Lambda$ に対して $N=max Lambda'$ とおけば
  $
    inter.big_(n in Lambda') C_n=[N,infinity) eq.not emptyset
  $
  $Lambda'=emptyset$ の場合の共通部分は定義により $RR$ であるから、
  この族は (F1) を満たす。一方、任意の $x in RR$ に対して $n>x$ となる
  $n in Lambda$ が存在し、そのとき $x in.not C_n$ である。したがって
  $
    inter.big_(n in Lambda) C_n=emptyset
  $

  (2) $r_0 in C$ を満たす閉集合 $C$ 全体の族を
  $
    cal(F)_(r_0)
      = {C subset RR | C " は閉集合であり " r_0 in C}
  $
  と書く。
  それぞれの $C$ は $r_0 in C$ なので、明らかに (F2) を満たす。

  次に、任意の閉集合 $C subset RR$ をとる。$r_0 in C$ ならば
  $C in cal(F)_(r_0)$ なので、$C$ 自身によって (F3) が満たされる。
  $r_0 in.not C$ ならば ${r_0} in cal(F)_(r_0)$ であり、
  $
    C inter {r_0}=emptyset.
  $
  したがって (F3) が成り立つ。

  (3)
  $
    cal(B) = {(p,q) | p,q in QQ, p<q}
  $
  とする。$QQ times QQ$ は加算集合ゆえ $cal(B)$ も加算集合である。
  さらに
  $
    cal(B)_0
      = {B in cal(B) | exists lambda in Lambda, B subset O_lambda}
  $
  とおく。各 $B in cal(B)_0$ に対して
  $B subset O_(lambda_B)$ となる $lambda_B in Lambda$ を（選択公理を仮定すれば）一つ選び、
  $
    Lambda' = {lambda_B | B in cal(B)_0}
  $
  とおく。$cal(B)_0$ は加算集合の部分集合なので、$Lambda'$ は高々加算である。

  任意の $x in RR$ をとる。仮定より、ある $lambda in Lambda$ に対して
  $x in O_lambda$ である。$O_lambda$ は開集合なので、ある $epsilon>0$ が存在して
  $
    (x-epsilon,x+epsilon) subset O_lambda
  $
  となる。有理数の稠密性から
  $
    x-epsilon < p < x < q < x+epsilon
  $
  となる $p,q in QQ$ を選べる。このとき
  $x in (p,q) subset O_lambda$ であるから $(p,q) in cal(B)_0$ であり、
  $
    x in (p,q) subset O_(lambda_((p,q)))
      subset union_(mu in Lambda') O_mu.
  $
  $x$ は任意であるから
  $
    union_(lambda in Lambda') O_lambda=RR
  $
  となる。

  (4)
  $
    K = inter.big_(lambda in Lambda) C_lambda
  $
  とおく。
  $K = emptyset$ を仮定すると、De Morgan の法則により
  $
    union_(lambda in Lambda) O_lambda=RR quad (O_lambda "は" C_lambda "の補集合")
  $
  (3) より、高々加算な $Lambda' subset Lambda$ で
  $
    union_(lambda in Lambda') O_lambda = RR
  $
  となるものが存在する。再び De Morgan の法則を用いると
  $
    inter.big_(lambda in Lambda') C_lambda=emptyset
  $
  となるが、これは (F2) に反する。よって $K eq.not emptyset$ である。

  $r_0 in K$ をとる。このとき、すべての $lambda in Lambda$ に対して
  $r_0 in C_lambda$ であり、各 $C_lambda$ は閉集合なので
  $
    {C_lambda | lambda in Lambda}
      subset
    {C subset RR | C " は閉集合かつ " r_0 in C}
  $
  逆に、$C$ を $r_0 in C$ である任意の閉集合とする。(F3) より、
  ある $lambda in Lambda$ に対して
  $
    C=C_lambda
    quad "または" quad
    C inter C_lambda=emptyset
  $
  である。しかし $r_0 in C inter C_lambda$ なので後者は起こりえない。
  したがって $C=C_lambda$ である。ゆえに
  $
    {C_lambda | lambda in Lambda}
      =
    {C subset RR | C " は閉集合かつ " r_0 in C}
  $
]

#problem("7")[
  $n$ を $1$ 以上の整数とする。位相空間 $X$ と $RR^(n+1)$ を中心とする $n$ 次元球面 $S^n$ について、以下の問に答えよ。

  (1) $X$ から $S^n$ への連続写像 $f, g$ が、すべての $x in X$ に対して $f(x) eq.not g(x)$ を満たすとき、 $f$ と $-g$ はホモトピックであることを示せ。

  (2) $n$ が奇数のとき、$S^n$ から $S^n$ への恒等写像 $a(x) = x$ と対蹠点写像 $b(x) = -x$ はホモトピックであることを示せ。

  (3) $n$ が奇数のとき、$X$ から $S^n$ への連続写像 $f, g $ がすべての $x in X$ に対して $f(x) eq.not g(x)$ を満たすとき、$f$ と $g$ はホモトピックであることを示せ。

  (4) $n$ が偶数のとき、$X$ から $S^n$ への連続写像 $f, g$ であって、すべての $x in X$ に対して $f(x) eq.not g(x)$ を満たすがホモトピックでない例を挙げよ。
]

#answer[
  (1) ホモトピーを
  $
    H(x,t)
      = ((1-t)f(x)-t g(x))
        / norm((1-t)f(x)-t g(x)) quad (t in I)
  $
  とすればよい。実際
  $
    (1 - t) f(x) - t g(x) = 0
  $
  ならば
  $
    1-t = norm((1 - t) f(x))= norm(t g(g)) = t
  $
  より $t=1/2$ である。すると $f(x)=g(x)$ となり、仮定に反する。
  したがって $H$ の分母は $0$ にならず、$H$ は $X times [0,1] -> S^n$ なる連続写像である。

  (2) $n=2m-1 quad (m in NN)$ とおく。$RR^(n+1)=RR^(2m)$ 上の
  写像 $J$ を
  $
    J(x_1,x_2,dots,x_(2m-1),x_(2m))
      =(-x_2,x_1,dots,-x_(2m),x_(2m-1))
  $
  によって定める。これは線形写像なので連続である。任意の $x in RR^(2m)$ に対して
  $
    norm(J x)=norm(x), quad x dot J x=0
  $
  が成り立つことに注意する。そこで、$x in S^n$, $0 <= t <= 1$ に対して
  $
    K(x,t)=cos(pi t)x+sin(pi t)J x
  $
  とおく。すると
  $
    norm(K(x,t))^2
      &= norm(cos(pi t)x+sin(pi t)J x)^2 \
      &= cos^2(pi t) norm(x)^2 + 2 sin(pi t) cos(pi t) x dot J x + sin^2(pi t) norm(J x)^2 \
      &= cos^2(pi t) norm(x)^2 + sin^2(pi t) norm(J x)^2 \
      &= 1
  $
  であるから、$K(x,t) in S^n$ である。また
  $
    K(x,0)=x=a(x), quad K(x,1)=-x=b(x)
  $
  である。したがって $K$ は $a$ と $b$ を繋ぐホモトピーである。

  (3) (1) より $f tilde -g=b compose g$ であり、(2) より $b compose g tilde a compose g = g$
  ゆえに
  $
    f tilde g
  $

  (4) $X=S^n$ とし、恒等写像
  $
    f:S^n -> S^n, quad f(x)=x
  $
  と対蹠点写像
  $
    g:S^n -> S^n, quad g(x)=-x
  $
  をとる。$x in S^n$ に対して $x=-x$ ならば $x=0$ より $f(x) eq.not g(x)$ である。

  恒等写像の写像度は $1$ である。
  また、$"deg" g = (-1)^(n+1)$ であり、いま $n$ は偶数なので $"deg"g = -1 eq.not 1 = "deg"f$ である。
  よって $f tilde.not g$ である。
]
