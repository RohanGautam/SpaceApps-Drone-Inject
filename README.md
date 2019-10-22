# SpaceApps-Drone-Inject
An app to edit and inject code into a drone (or a UAV).  Winner (Singapore), NASA SpaceApps challenge, 2019.

The challenge we tackled is [here](https://2019.spaceappschallenge.org/challenges/planets-near-and-far/out-world/details).

## Developed alongside `SpaceApps-Drone-Control`, located [here](https://github.com/RohanGautam/SpaceApps-Drone-Control).

# Working Demo:
[![Injecting code from app to the pi](https://i.ibb.co/8X5Vffv/https-i-ytimg-com-vi-7-Pb-V9-To-Y97w-maxresdefault.jpg)](https://www.youtube.com/watch?v=7PbV9ToY97w&feature=youtu.be "Injecting code from app to the pi")

> Communication is done via websockets between the flutter application(client) and the RPi(server), so make sure you change HOST (both in `pythonServer.py` and `clientWebSocket.dart`) to your particular private IP address, and ensure both the Pi and the flutter mobile app are connected to the same network.