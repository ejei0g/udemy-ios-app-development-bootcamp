import UIKit

var greeting = "Hello, playground"


struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

var resolution = Resolution()
let videomode = VideoMode()
let videoRef = videomode

resolution = videomode.resolution

print(videomode.resolution.height)
videomode.resolution.height = 10
print(videomode.resolution.height)
print(videoRef.resolution.height)
// 클래스 안에 구조체가 존재해도 클래스는 ref이므로 당연히 구조체의 값도 함께 바뀐다.

print(resolution.height)
//단 클래스 내부의 구조체를 전달할 경우 값타입으로 넘어가기 때문에 깊은복사가 된다.
