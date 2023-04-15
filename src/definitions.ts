export type CallbackID = string;

export interface DeviceMotionPlugin {
  watchDeviceShake(
    callback: WatchShakeCallback,
  ): Promise<CallbackID>;
}

export type WatchShakeCallback = (
  shaked: boolean | null,
  err?: any,
) => void;