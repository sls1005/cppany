import cppany

var a = initAny(int, 10)
assert a.hasValue()
assert castAny[int](a) == 10
resetAny(a)
assert not a.hasValue()
a.emplace[:char]('A')
assert a.hasValue()
assert castAny[char](a) == 'A'
var b: Any = 2.0
a.swapAny(b)
assert castAny[float](a) == 2.0
assert castAny[char](b) == 'A'
