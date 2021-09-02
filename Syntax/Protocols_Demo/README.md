## 개념

> [https://docs.swift.org/swift-book/LanguageGuide/Protocols.html](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

```swift
protocol MyProtocol {
}
```

swift에서 struct는 상속이 불가능, protocol은 사용가능

- 프로토콜은 구현은 상대방에게 맡긴다.
- 기본적으로 프로토콜에 있는 함수는 구현해야하지만 optional 옵션을 통해 선택할 수 있다.
- protocol은 struct에서 사용가능하다.
- protocol은 데이터 타입으로 사용가능하다.
    - 특정 프로토콜을 갖춘 객체만 argument로 사용하도록 강제할 수 있다.
- 객체에게 "특정 자격을 준다"라는 의미로 이해해보자
- 다중 ~~상속~~ 채택이 가능하다. can multiple.

- interface와 살짝 비슷한데?

> 차이점

[Swift 프로토콜(protocol)과 Java 인터페이스(interface) 차이](https://dongkyprogramming.tistory.com/11)

## 왜?

inheritance의 문제점(?)은 상속받는 자식클래스는 부모의 모든 것을 물려받고 비록 사용하지 않을지라도 사용가능하다.

프로토콜도 마찬가지로 전부 구현해야하는 것 아닌가?

→ 옵셔널을 사용한다면 구현하지 않은 함수들은 사용할 수 없다.

그래서 특정 클래스의 기능중 몇가지만 사용하고 싶을 때?? 프로토콜로 해당 함수를 뺄 수 있다.

#언제?

뭔가 공통의 것을 물려받는데, 특정 행위들은 공유하지 않을 때

해당 함수들을 프로토콜로 빼내어서 구현할 수 있다.

여러 객체들이 동일한 함수들을 필요로 할 때, 해당 함수들과 관련된 프로토콜을 만들어주어서 관리

예를들면, 일반 직업 > 중간 직업 > 전문 직업의 관계로 상속관계가 형성이 되었을 때,

특정 직업끼리 겹치는 함수들이 존재할 때 (의사, 간호사, 약사는 의료기기에 대한 함수가 공통적이다)

해당 함수들을 프로토콜로 빼내어서 해당 직업들이 사용할 수 있도록 해준다.

## #ref

[https://docs.swift.org/swift-book/LanguageGuide/Protocols.html](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

[https://dongkyprogramming.tistory.com/11](https://dongkyprogramming.tistory.com/11)

[https://medium.com/@jgj455/오늘의-swift-상식-protocol-f18c82571dad](https://medium.com/@jgj455/%EC%98%A4%EB%8A%98%EC%9D%98-swift-%EC%83%81%EC%8B%9D-protocol-f18c82571dad)
