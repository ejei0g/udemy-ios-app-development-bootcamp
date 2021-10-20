class Value {
    var x: Int = 0
}

func changeValue(variable: Value) {
    var otherValue = variable
    otherValue.x = 100
    print(otherValue.x)
}

var rootInstance: Value = Value()
print(rootInstance.x)
changeValue(variable: rootInstance)
print(rootInstance.x)

struct NotChangeValue {
    var x: Int = 0
}

func notChangeValuef(variable: NotChangeValue) {
    var v = variable
    v.x = 100
    print(v.x)
}

var structValue = NotChangeValue()
print(structValue.x)

notChangeValuef(variable: structValue)
print(structValue.x)

var a = Value()
var b = a

if (a == b) {
    print("same")
}
