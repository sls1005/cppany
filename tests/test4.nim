import cppany

var x: array[3, Any]
x[0] = 1
x[1] = 2.5
x[2] = '3'
assert castAny[int](x[0]) == 1
assert castAny[float](x[1]) == 2.5
assert castAny[char](x[2]) == '3'
