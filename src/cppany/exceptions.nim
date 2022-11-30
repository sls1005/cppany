type
  CStdException* {.header: "<exception>", importcpp: "std::exception", inheritable.} = object
  BadCast* {.header: "<typeinfo>", importcpp: "std::bad_cast", inheritable.} = object of CStdException
  BadAnyCast* {.header: "<any>", importcpp: "std::bad_any_cast".} = object of BadCast

proc what*(self: CStdException): cstring {.importcpp: "const_cast<'0>(#.what())", raises: [].}
