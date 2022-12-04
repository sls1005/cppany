# CPP Any
A Nim wrapper for C++'s `std::any`.

### Example

```nim
import cppany

var a: Any = 1
echo castAny[int](a) # 1
a = 2.5
echo castAny[float](a) # 2.5
a = 'A'
echo castAny[char](a) # 'A'
```

### Note
+ Do not get confused with the `Any` type from this module and that from `std/typeinfo`. (In this manual, `Any` refers to the former.) Those two types should not be used in the same module, even if it's possible.

+ One can only cast `Any` to the type of which it stores (via `castAny`), otherwise a BadAnyCast is raised.

+ Do not use `Any` to store GC'ed types (`seq`, `string`, ...), unless you fully understand the memory-managing strategy you choose.

+ Due to some technical limitations, One cannot have a `seq` of `Any`, but can have an `array` of them.

+ As `std::any` was defined in C++17  (Nim currently uses C++14), this module requires you to pass a flag to the backend C++ compiler (via `--passC`), telling it to use the new standard. However, if you're with GCC or Clang, it is automatically done by this module, so you don't have to worry about that.

+ In a project that uses this module, the `{.register.}` pragma cannot be used, as it's incompatible with C++17.

### References

+ <https://en.cppreference.com/w/cpp/utility/any>

+ <https://en.cppreference.com/w/cpp/utility/in_place>
