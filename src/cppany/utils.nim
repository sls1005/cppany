{.push header: "<utility>".}
type TInPlaceType*[T] {.importcpp: "std::in_place_type_t<'0>".} = object

proc inPlaceType*[T](t: typedesc[T]): TInPlaceType[T] {.importcpp: "(std::in_place_type<'*0>)".}
{.pop.}
