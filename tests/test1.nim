import cppany

proc main =
  var a: Any = 1
  assert castAny[int](a) == 1
  a = 2.5
  assert castAny[float](a) == 2.5
  a = 'A'
  assert castAny[char](a) == 'A'
  let b = a
  assert castAny[char](b) == 'A'

main()
