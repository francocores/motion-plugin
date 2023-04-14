import Foundation

@objc public class DeviceMotion: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
