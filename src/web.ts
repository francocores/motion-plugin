import { WebPlugin } from '@capacitor/core';

import type { DeviceMotionPlugin, WatchShakeCallback } from './definitions';

export class DeviceMotionWeb extends WebPlugin implements DeviceMotionPlugin {
    watchDeviceShake(callback: WatchShakeCallback): Promise<string> {
        throw new Error('Method not implemented.');
    }
}
