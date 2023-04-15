import Foundation
import Capacitor
import CoreMotion

@objc(DeviceMotionPlugin)
public class DeviceMotionPlugin: CAPPlugin {
    
    enum CallType {
        case watch
    }
    private var callQueue: [String: CallType] = [:]
    
    var motionManager = CMMotionManager()
    var motionQueue = OperationQueue()
    
    @objc func watchDeviceShake(_ call: CAPPluginCall) {
        call.keepAlive = true
        callQueue[call.callbackId] = .watch
        
        var xInPositiveDirection = 0.0
        var xInNegativeDirection = 0.0
        
        motionManager.deviceMotionUpdateInterval = 0.02
        motionManager.startDeviceMotionUpdates(to: motionQueue) { (data: CMDeviceMotion?, error: Error?) in
            guard let data = data else {
                print("Error: \(error!)")
                return
            }
            
            if data.userAcceleration.x > 1.0 || data.userAcceleration.x < -1.0 {
                if data.userAcceleration.x > 1.0 {
                    xInPositiveDirection = data.userAcceleration.x
                }
                
                if data.userAcceleration.x < -1.0 {
                    xInNegativeDirection = data.userAcceleration.x
                }
                
                if xInPositiveDirection != 0.0 && xInNegativeDirection != 0.0 {
                    xInPositiveDirection = 0.0
                    xInNegativeDirection = 0.0
                    
                    DispatchQueue.main.async {
                        call.resolve()
                    }
                }
            }
        }
    }
    
}
