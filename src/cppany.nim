when not defined(cpp):
  {.error: "This can only be used with the C++ backend.".}
elif defined(gcc) or defined(clang):
  when not defined(useDefaultCStd):
    {.passC: "-std=gnu++17".}

import std/macros
import ./cppany/exceptions
from ./cppany/utils import inPlaceType, TInPlaceType

{.push header: "<any>".}

type Any* {.importcpp: "std::any".} = object

proc initAny*(): Any {.constructor, importcpp: "'0()", raises: [].}

proc initAny*[T](x: T): Any {.constructor, importcpp: "'0(#)", raises: [CStdException].}

proc hasValue*(self: Any): bool {.importcpp: "#.has_value()", raises: [].}

proc emplace*[T](self: var Any): T {.varargs, discardable, importcpp: "(#.emplace<'0>(@))", raises: [CStdException].}

proc swapAny*(self, other: var Any) {.importcpp: "#.swap(#)", raises: [].}

proc resetAny*(self: var Any) {.importcpp: "#.reset()", raises: [].}

proc castAny*[T](self: Any): T {.importcpp: "std::any_cast<'0>(#)", raises: [BadAnyCast].}

proc castAny*[T](self: ptr Any): ptr T {.importcpp: "std::any_cast<'0>(#)", raises: [].} #maybe nil

proc initAnyVariadicImpl[T](_: TInPlaceType[T]): Any {.constructor, varargs, importcpp: "'0(@)", raises: [CStdException].}

{.pop.}

macro initAny*[T](typ: typedesc[T], args: varargs[typed]): Any =
  result = newCall(
    bindSym("initAnyVariadicImpl"),
    newCall(
      bindSym("inPlaceType"), typ
    )
  )
  for a in args:
    result.add(a)

converter toAny*[T](self: T): Any {.importcpp: "(('1) #)", raises: [CStdException].}
  # `('1)` is correct. It converts the argument to the expected type before converting into `std::any` (The later will be done automatically.)

export exceptions.BadAnyCast
export exceptions.what
