#!/bin/bash
[*] Enable loadable module support  --->  [CONFIG_MODULES]

Bus options (PCI etc.)  --->
  [*] PCI support                         [CONFIG_PCI]

Device Drivers  --->
  I2C support --->
    <*/M> I2C device interface            [CONFIG_I2C_CHARDEV]
    I2C Hardware Bus support  --->
      <M> (configure all of them as modules)
  <*/M> Hardware Monitoring support  ---> [CONFIG_HWMON]
    <M> (configure all of them as modules)
