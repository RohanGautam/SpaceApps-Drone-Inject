# SpaceApps-Drone-Inject
An app to edit and inject code into a drone (or a UAV).  Winner (Singapore), NASA SpaceApps challenge, 2019.

The challenge we tackled is [here](https://2019.spaceappschallenge.org/challenges/planets-near-and-far/out-world/details).

## Developed alongside `SpaceApps-Drone-Control`, located [here](https://github.com/RohanGautam/SpaceApps-Drone-Control).

# Working Demo:
[![Code injection](https://i.ibb.co/yWmXMQy/https-i-ytimg-com-vi-o-E0-ZFWDUZx-Q-maxresdefault.jpg)](https://www.youtube.com/watch?v=oE0ZFWDUZxQ&feature=youtu.be "Code injection")

> Communication is done via websockets between the flutter application(client) and the RPi(server), so make sure you change HOST (both in `pythonServer.py` and `clientWebSocket.dart`) to your particular private IP address, and ensure both the Pi and the flutter mobile app are connected to the same network.