(symbol "a")
(keyword "a")
(datetime {:year 2018
           :mon 1
           :day 1
           :hour 0
           :min 0
           :sec 0
           :nano 0
           :tz "UTC+00:00"})

;; tzは+/-, 09, 09:45の表記を許容する
;; デストラクチャリング
;; 関数への値の引き渡しは、List, VectorかMapで行う(Setは意味がないので省く)
(let [[a, b, c] [1, 2, 3]] (print a b c)) ;; 1 2 3
(let [[a, _, c] [1, 2, 3]] (print a c)) ;; 1 3
(let [[a, [b1, b2], c] [1, [2, 3], 4]] (print b1 b2)) ;; 2 3
(let [[a & b] [1 2 3]] (print a b)) ;; 1 [2 3]
(let [[a & b] [1]] (print a b)) ;; 1 nil
(let [[a & b] []] (print a b)) ;; nil nil
;; Sci-Lispにはseqのようなものはなく、restは元の型を保つ

(let [{:a a, :b b} {:a 1 :b 2}] (print a b)) ;; 1 2
(let [{"a" a, "b" b} {:a 1}] (print a b)) ;; 1 nil
(let [{0 a, 1 b} {0 1, 1 2}] (print a b)) ;; 1 2
;; 問題はマップ
(let [{:a x, :b y, :default {x 2}} {:a 10 :b 20}] (print x y)) ;; 10 20
(defn nation-datetime
  "Create a datetime object"
  [nation #str ;; 位置引数(シンボルの直後の#xxxは型アノテーションとしてみなされる)
   & rest      ;; 可変長引数(restはベクタになる, ここでデストラクチャリングも可能だがあまり意味なし)
   & {:year year #i64, :mon mon #i64, :day day #i64,
      :hour hour #i64, :min min #i64, :sec sec #i64,
      :nano nano #i64, :tz tz #str,
      :default {:year 1970, :mon 1, :day 1, :hour 0,
                :min 0, :sec 0, :nano 0, :tz "UTC+00:00"}}]
  => #datetime ;; 返り値の型アノテーション
  ;; デフォルト値を指定したものは、型推論ができる(あんまり意味はないか)
  ;; Mapはキーとペアのセットだが、型情報はシンタックス的に許容する
  ;; 型アノテーションは指定しなくてもいい(型推論できないものは、Any型になる)
  ;; シンボルにどちらも指定されていた場合は後勝ち
  ;; index accessは要素がないときnilを返す
  (let [year (or (0 rest) year)
        mon (or (1 rest) mon)
        day (or (2 rest) day)
        hour (or (3 rest) hour)
        min (or (4 rest) min)
        sec (or (5 rest) sec)
        nano (or (6 rest) nano)
        tz (or (7 rest) tz)]

      (print nation)
      (rust/datetime year mon day hour mi sec nano tz))
)

(nation-datetime "Japan" 2018 1 1 {:tz "UTC+09:00"})
(nation-datetime "UK" {:year 2018 :mon 1 :day 1
                       :hour 0 :min 0 :sec 0 :nano 0})

;; 強力な最適化を効かすのはやはり型情報
;; 型も入ってくるとさらにわけがわからん
;; デフォルト値はletで指定することにする
;; typedef 気軽に型定義する

;; まず設計ができなければ書くことはできない!
;; よく考えよう

;; 多重ディスパッチ

(defn some [x #i64] => #i64
  (print "i64")
  x)

(defn some [x #f64] => #f64
  (print "f64")
  x)

;; enum
(enum Color
  [Red Green Blue])

(def c #Color Color.Red)

(switch c
  [Color.Red] (print "red")
  [Color.Green] (print "green")
  [Color.Blue] (print "blue"))

;; struct
(struct Point
  [x #i64 y #i64
   move #fn[#i64, #i64 => #Point]])

(def p #Point (Point {:x 1, :y 2}))
;; or
(def p #Point (Point 1 2))
;; mixできるが、キーワード指定したほうが勝つ
;; 不足している場合はnilが入る

(print p.x p.y)  ;; このスタイルを許可する
(print (.x p) (.y p)) ;; こういうこともできる

;comment
; TODO:
; FIXME:
; XXX:
; BUG:
; HACK:
; NOTE:
(nil, nil)
[nil, nil]
{nil, nil}
(false, true)
(-0x9f, 0x9f)
(-0o07, 0O66)
(-0b01, 0B11_11)
(-10.08, 12., -2.9e05, 1_0e1_0)
(-1+1j, 1+1j, 1e1+1e1j, 1e-1j, 1e+1j, -1e1j, 1e-1j, 1e+1j, 1.0e1j)
(1.2, .2_2, 2., 2.2, 2.2e1, 2.2e-1, -2.2e+1, 1e2)
(1_2, 10__000_0)