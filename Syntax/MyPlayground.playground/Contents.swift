import UIKit

var greeting = "Hello, playground"


var a = 5
var b = 10

print(a, b, greeting)
print("helo", a)

struct mystruct {
    let color_1  = "red"
    let color_2  = "green"
}

let my = mystruct();
var arr = Array<Int>()

arr = [1,2,3]

print(my.color_1, my.color_2)
if my.color_1 == "red" {
    print("color is red")
} else {
    print("color is not red")
}

switch my.color_2 {
case "red":
    print("red ok")
default:
    print("no red")
}

for i in arr {
    print(i)
}
arr = [2, 3, 4]
for i in arr {
    print(i)
}
