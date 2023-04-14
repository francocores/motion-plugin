import { WebPlugin } from '@capacitor/core';

import type { DeviceMotionPlugin } from './definitions';

export class DeviceMotionWeb extends WebPlugin implements DeviceMotionPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
