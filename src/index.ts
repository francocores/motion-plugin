import { registerPlugin } from '@capacitor/core';

import type { DeviceMotionPlugin } from './definitions';

const DeviceMotion = registerPlugin<DeviceMotionPlugin>('DeviceMotion', {
  web: () => import('./web').then(m => new m.DeviceMotionWeb()),
});

export * from './definitions';
export { DeviceMotion };
