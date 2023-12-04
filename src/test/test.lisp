; Comment
; TODO:
; FIXME:
; XXX:
; BUG:
; HACK:
; NOTE:

;; Literal
'()              ; list
`()              ; quoted List
[]               ; vector
{}               ; hash map
#{}              ; hash set
""               ; string
"\n"             ; escape sequence
#"[0-9]+"        ; regular expression
false            ; false
true             ; true
nil              ; nil (means null/None)
0x1a             ; hexadecimal
0o17             ; octal
0b0101           ; binary
-4/3             ; fraction (TODO: not need?)
1+2j             ; complex number
-3.14e15         ; float
-999             ; int
nan              ; Not A Number
inf              ; positive infinity
-inf             ; negative infinity
-0.0             ; negative zero
:symbol          ; symbol

;; Keywords
(ns)
(import)
(let)
(const)
(def)
(defn)
(fn)
(set!)
(return)
(yield)
(if)
(when)
(cond)
(for)
(while)
(break)
(continue)
(struct)
(enum)
(class)
(this)
(macro)
(throw)
(try)
(catch)


;; Builtin Functions / Special Forms / Macros
;; TODO: Need variable hilight => Semantic Analysis

;; Mathmatical
(inc 1)              ; add 1
(dec 1)              ; subtract 1
(+ 1 1)              ; Add
(- 1 1)              ; Subtract
(* 2 3)              ; product
(/ 1 2)              ; devide (float)
(// 1 2)             ; devide
(% 3 2)              ; remainder
(let [a 2]           ; bind variable
  (set! a 3)         ; assign(destructive)
  (print a))         ; print
(= 2 2)              ; equal
(is [1, 2] [1, 2])   ; ident (=> false)
(< 2 3)              ; less
(<= 2 3)             ; less equal
(> 2 3)              ; greater
(>= 2 3)             ; greater equal
(abs -2)             ; absolute value
(abs [-2, 3, 4])     ; absolute value applying to vector
(and true false)     ; and
(or true false)      ; or
(xor true true)      ; xor
(not false)          ; not
(cos 2.0)            ; cosine
(sin 2.0)            ; sine
(tan 2.0)            ; tangent
(acos 2.0)           ; arccosine
(asin 2.0)           ; arcsine
(atan 2.0)           ; arctangent
(log 2.0)            ; log_e
(log10 2.0)          ; log_10
(rand)
(randint)

;; Definition
(def a 2)            ; variable
(const C [1, 2, 3])  ; constant value (can't assgin after)

(defn func [a,       ; function
            b 32]    ; default argument
  (print a)
  (+ a b))
(func 2 3)           ; positional arguments
(func {:a 2, :b 3})  ; named arguments
(func 2 {:b 3})      ; mixed above
(def lst '(4, 5))
(func @lst)          ; extract arguments

(fn [x]
  (+ x 1))           ; Anonymous Function

;; Utility
(type [1, 2, 3])     ; show type
(time (+ 1 2))       ; measure processing time
(print {:a 2, :b 3}) ; print any
(printf "{0:02d}kg" 56) ; print format

;; Control Flow
(if (< 2 3)          ; if condition
  "true"
  "false")
(when (< 2 3)        ; when codition
  "do")

(for [i (range 5)]   ; for loop, range
  (print i))

(def a 0)
(while (< a 100)     ; while loop
  (print a)
  (set! a (+ a 1))   ; add and assign
  (if (> a 50)
     (break)         ; break
     (continue)))    ; continue

;; Cast
(bool 2)                 ; to bool
(int 2.0)                ; to int
(float -3)               ; to float
(str :a)              ; to string
(sym "a")             ; to symbol

;; Collection
(list 1 2 3)             ; make list
(vector '(1 2 3))        ; coerce vector
(hmap '(:a 1 :b 2))      ; coerce hash map
(hset '(:a :b))          ; coerce hash set

;; Predicate
(nil? false)             ; is nil?
(true? nil)              ; is true?
(false? true)            ; is false?
(bool? 2)                ; is bool?
(int? 2.3)               ; is int?
(float? "a")
(str? :a)
(sym? 3)
(list? '(1 2 3))
(vector? [1 2 3])
(hmap? {:a 1, :b 2})
(hset? #{:a, :b})
(empty? "")
(zero? 9)
(nan? inf)
(inf? -inf)
(-inf? nan)
(in? 1 [3, 2, 1])

;; string
(format "{0:03d} kg" 56)      ; format string
(join "," ["1", "2", "3"])    ; join (=> "1,2,3")
(find #"[0-9]+" "abc12de")    ; find regex (=> "12")
(match #"([0-9]+)" "ab1c34d") ; match regex (=> ["ab1c34d", "1", "34"])
(in? "a" "12aabc32")          ; is string in string?
(upper "abc")                 ; upper-case
(lower "DEF")                 ; lower-case

;; vector
;; TODO: see lodash.js
(shape [[1, 2], [3, 4], [5, 6]]) ; shape of vector (=> [3, 2])
(len [1, 2, 3])                  ; length of vector
(sum [1, 2, 3])                  ; sum of vector
(mean [1, 2, 3])                 ; mean of vector
(max [1, 2, 3])                  ; max of vector
(min [1, 2, 3])                  ; min of vector
(std [1, 2, 3])                  ; standard deviation of vector
(head [1, 2, 3] 2)
(tail [1, 2, 3] 2)
(cycle)
(chunk)
(replace)
(reverse)
(repeat)
(some? [false, true, false])
(every? [false, true, false])

(sort [3, 1, 2])                 ; sort (non-destructive)
(shuffle [3, 1, 2])              ; shuffle (non-destructive)
(push [3, 1, 2] 4)               ; push_back (non-destructive)
(cons [3, 1, 2] 4)               ; push_front (non-destructive)

(def v [3, 1, 2])
(sort! v)                        ; sort (destructive)
(shuffle! v)                     ; shuffle (destructive)
(push! v 4)                      ; push_back (destructive)
(cons! v 4)                      ; push_front (destructive)

;; hashmap
(assoc)
(assoc!)

;; slicing
([1] [[1, 2], [3, 4], [5, 6]])         ; => [3, 4]
([0:2] [[1, 2], [3, 4], [5, 6]])       ; => [[1, 2], [3, 4]]
([0:-1, 1] [[1, 2], [3, 4], [5, 6]])   ; => [2, 4]
([1, 1] [[1, 2], [3, 4], [5, 6]])      ; => 4
([:a] {:a 2, :b 3})                    ; => 2


;; functional programming
(filter)
(map)
(apply)
(comp)

;; struct/enum/class/macro
(struct)
(enum)
(class)
(macro)
;; throw/try/catch
(throw)
(try)
(catch)
;; namespace
(ns)

;; I/O
(read)
(write)
