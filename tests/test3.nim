import cppany

var a: Any = 0.5
try:
  echo castAny[int](a) #error
  # The above code must raise a `BadAnyCast`
except BadAnyCast as e:
  echo [e.what()]
