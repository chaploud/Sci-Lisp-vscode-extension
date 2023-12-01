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
:symbol          ; symbol (TODO:)

;; Builtin Functions / Special Forms / Macros
;; TODO: Need variable hilight => Semantic Analysis

;; Mathmatical
(+ 1 1)            ; Add
(- 1 1)            ; Subtract
(* 2 3)            ; product
(/ 1 2)            ; devide (float)
(// 1 2)           ; devide
(% 3 2)            ; remainder
(let [a 2]         ; bind variable
  (= a 3)          ; assign
  (print a))       ; print
(== 2 2)           ; equal
(< 2 3)            ; less
(<= 2 3)           ; less equal
(> 2 3)            ; greater
(>= 2 3)           ; greater equal
(abs -2)           ; absolute value
(abs [-2, 3, 4])   ; absolute value applying to vector
(and true false)   ; and
(or ture false)    ; or
(xor true true)    ; xor

;; Cast
(bool 2)                 ; to bool
(int 2.0)                ; to int
(float -3)               ; to float
(string :a)              ; to string
(symbol "a")             ; to symbol

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
(string? :a)
(symbol? 3)
(list? '(1 2 3))
(vecter? [1 2 3])
(hmap? {:a 1, :b 2})
(hset? #{:a, :b})
(empty? "")
(in? 1 [3, 2, 1])

;; string
(format "{0:03d} kg" 56)      ; format string
(join "," ["1", "2", "3"])    ; join (=> "1,2,3")
(find #"[0-9]+" "abc12de")    ; find regex (=> "12")
(match #"([0-9]+)" "ab1c34d") ; match regex (=> ["ab1c34d", "1", "34"])
(in? "a" "12aabc32")          ; is string in string?
