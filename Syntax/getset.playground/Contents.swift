//get set;
var _members:Int = 5
var members:Int {
    get {
        return _members
    }
    set (newVal) {
        if (newVal < 1){
            print("직원수는 한명보다 작을 수 없습니다.")
        }else{
            _members = newVal
        }
    }
}
var teamDinnerCost:Int {
    get {
        return _members * 10000
    }
    set(value) {
        _members = value / 10000
    }
}
print(_members)
print(teamDinnerCost)
teamDinnerCost = 80000
print(_members)
members = 3
print(_members)
class Test {
    internal var internalProperty: Int = 32
}
var test = Test()
print(test.internalProperty)
