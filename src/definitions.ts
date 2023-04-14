export interface DeviceMotionPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
