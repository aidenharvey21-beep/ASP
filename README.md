````markdown
# 🚁 AirSupportPro (ASP)

![FiveM](https://img.shields.io/badge/FiveM-Compatible-blue)
![Lua](https://img.shields.io/badge/Lua-5.4-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Development-orange)

**AirSupportPro (ASP)** is an advanced standalone helicopter aviation suite designed for FiveM servers.

ASP is designed to provide realistic helicopter operations for:

- Law Enforcement
- EMS
- Search & Rescue
- Military
- Civil Aviation
- News Aviation

The goal of ASP is to create a high-quality, optimized, open-source alternative to existing helicopter resources.

---

# ✈️ Features

## Current Features

### Core Framework
- ✅ Standalone operation
- ✅ vMenu compatible
- ✅ OneSync compatible
- ✅ ACE permission support
- ✅ Modular architecture
- ✅ Configuration-driven design


## Planned Features

### Helicopter Camera System
- FLIR camera
- Thermal imaging
- Night vision
- Camera stabilization
- Variable zoom
- Target tracking


### Orbit Autopilot
- Vehicle orbit
- Player orbit
- Waypoint orbit
- Coordinate orbit
- Adjustable radius
- Altitude hold
- Moving target prediction
- Automatic heading correction


### Flight Assistance
- Hover hold
- Position stabilization
- Altitude management
- Search patterns


### Tracking
- Vehicle tracking
- Ped tracking
- Speed estimation
- Distance calculation
- Heading information


### Aviation HUD
- Altitude
- Airspeed
- Heading
- Target information
- Orbit information
- Camera status


### Spotlight System
- Target tracking
- Smooth movement
- Observer control support

---

# 📦 Installation

## Requirements

- FiveM Server
- OneSync enabled
- Lua 5.4 support


## Installation Steps

### 1. Download ASP

Clone the repository:

```bash
git clone https://github.com/aidenharvey21-beep/ASP.git
````

### 2. Add Resource

Place the folder inside:

```
server-data/resources/
```

Your structure should look like:

```
resources/
└── AirSupportPro/
    ├── fxmanifest.lua
    ├── config.lua
    ├── client/
    ├── server/
    └── shared/
```

### 3. Add to server.cfg

Add:

```cfg
ensure AirSupportPro
```

### 4. Restart Your Server

ASP will initialize automatically.

---

# ⚙️ Configuration

All user settings are located in:

```
config.lua
```

Examples:

```lua
Config.Debug = false

Config.Orbit.DefaultRadius = 175.0

Config.Camera.DefaultFOV = 45.0
```

---

# 🎮 Default Controls

| Action                | Key       |
| --------------------- | --------- |
| Toggle Camera         | E         |
| Toggle Orbit          | O         |
| Lock Target           | L         |
| Toggle Hover          | H         |
| Increase Orbit Radius | Page Up   |
| Decrease Orbit Radius | Page Down |

Controls can be changed through:

```
config.lua
```

or:

```
FiveM Settings → Key Bindings
```

---

# 🚁 Recommended Vehicles

ASP works with any helicopter, but these are recommended:

## Law Enforcement

* Airbus H135
* Airbus H145
* Bell 407
* Bell 429
* MD 500

## EMS

* Airbus H145 EMS
* EC135

## Military

* UH-60 Black Hawk
* MH-60
* UH-1 Huey

Recommended first aircraft:

**Airbus H145**

Reason:

* Modern aviation platform
* Large camera mounting options
* Real-world law enforcement use
* Excellent visibility

---

# 🛠 Development Roadmap

## Version 0.1

* [x] Project structure
* [x] Configuration system
* [x] Client/server framework
* [x] Permission system

## Version 0.2

* [ ] Camera framework
* [ ] Camera controls
* [ ] Observer system

## Version 0.3

* [ ] FLIR
* [ ] Night vision
* [ ] Target tracking

## Version 0.4

* [ ] Orbit autopilot
* [ ] Hover system

## Version 0.5

* [ ] HUD
* [ ] Radar
* [ ] Spotlight

## Version 1.0

* Stable public release

---

# 🧩 Developer Information

ASP uses a modular architecture.

Example:

```
client/
├── camera.lua
├── orbit.lua
├── flir.lua
├── tracking.lua
└── hud.lua
```

Modules communicate through:

```lua
ASP.Client.State
```

and:

```lua
ASP.Utils
```

---

# 🔌 Exports

Future resources can communicate with ASP using:

```lua
exports.AirSupportPro:IsAirSupportActive()
```

```lua
exports.AirSupportPro:GetCurrentTarget()
```

```lua
exports.AirSupportPro:StartOrbit()
```

```lua
exports.AirSupportPro:StopOrbit()
```

---

# 🤝 Contributing

Contributions are welcome.

Before submitting changes:

1. Follow existing coding style.
2. Document new features.
3. Test changes on a FiveM server.
4. Submit a pull request.

See:

```
CONTRIBUTING.md
```

for more information.

---

# 📄 License

AirSupportPro is released under the MIT License.

See:

```
LICENSE
```

for details.

---

# 📡 Project Links

GitHub:

https://github.com/aidenharvey21-beep/ASP

---

# Credits

Created by:

**Aiden Harvey**

Built for the FiveM community.

Special thanks to all open-source developers who contribute to improving FiveM resources.

```
```
