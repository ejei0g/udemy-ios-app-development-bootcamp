import UIKit

func calculator(n1: Int, n2: Int, oper:(Int, Int) -> Int) -> Int {
    return oper(n1, n2)
}

func add(n1: Int, n2: Int) -> Int {
    return n1 + n2
}



calculator(n1: 12, n2: 3, oper: add(n1:n2:))

var result = calculator(n1: 1, n2: 1111) { $0 * $1}
 
print(result)
//(Int , Int) -> Int

let array = [1,2,3,4]

func addOne(num: Int) -> Int {
    return num + 1
}

array.map(addOne(num:))

var res = array.map{$0 + 1}

print(res)

func closure() -> Int {
    print("hello world")
    return 0
}

var test: () = {
    print("hello world")
}()


