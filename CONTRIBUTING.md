```markdown id="x9n4qa"
# Contributing to AirSupportPro

Thank you for your interest in contributing to **AirSupportPro (ASP)**.

ASP is designed to be a community-driven, open-source helicopter aviation framework for FiveM. Contributions are welcome from developers, testers, server owners, and aviation enthusiasts.

---

# Getting Started

Before contributing, please:

1. Read the README.
2. Review the existing code structure.
3. Check open issues.
4. Test changes before submitting them.

Repository:

```

https://github.com/aidenharvey21-beep/ASP

```

---

# Development Environment

Recommended tools:

## Required

- Visual Studio Code
- Lua Language Server
- FiveM test server
- Git


## Recommended Extensions

- Lua Language Server
- GitHub Pull Requests
- EditorConfig
- Better Comments

---

# Project Structure

ASP uses a modular architecture.

```

AirSupportPro/

├── client/
│   ├── main.lua
│   ├── controls.lua
│   ├── camera.lua
│   ├── orbit.lua
│   └── tracking.lua
│
├── server/
│   └── server.lua
│
├── shared/
│   └── helpers.lua
│
├── html/
│   ├── index.html
│   ├── style.css
│   └── app.js
│
├── config.lua
└── fxmanifest.lua

````

---

# Coding Guidelines

## Lua Style

Follow these standards:

- Use 4 spaces for indentation.
- Avoid global variables.
- Use local variables whenever possible.
- Comment complex logic.
- Keep functions focused on one task.
- Avoid unnecessary loops.

Example:

Good:

```lua
local speed = GetEntitySpeed(vehicle)
````

Avoid:

```lua
speed = GetEntitySpeed(vehicle)
```

---

# Naming Convention

## Variables

Use camelCase:

```lua
local targetVehicle
local orbitRadius
```

---

## Functions

Use PascalCase for public functions:

```lua
ASP.Client.StartOrbit()
```

---

## Constants

Use uppercase:

```lua
MAX_ORBIT_RADIUS
```

---

# Adding Features

Before adding a new system:

1. Create a design plan.
2. Discuss the approach in an issue.
3. Ensure compatibility with existing modules.
4. Add configuration options.
5. Document the feature.

Avoid adding hard-coded values.

Use:

```lua
Config.Orbit.DefaultRadius
```

Instead of:

```lua
local radius = 175
```

---

# Pull Requests

When submitting a pull request:

## Title Format

Use:

```
[type] Description
```

Examples:

```
[Feature] Add FLIR camera modes

[Fix] Correct orbit altitude calculations

[Optimization] Reduce tracking thread usage
```

---

# Pull Request Requirements

A pull request should include:

* Clear description of changes.
* Reason for the change.
* Testing information.
* Screenshots/videos when applicable.
* Any configuration changes.

---

# Commit Messages

Use clear commit messages.

Recommended:

```
Add helicopter camera framework
```

```
Fix orbit controller target prediction
```

```
Optimize FLIR update loop
```

Avoid:

```
update stuff
```

```
fixed
```

---

# Testing Requirements

Before submitting:

Test:

* Resource starts without errors.
* Server console has no warnings.
* Client console has no errors.
* Feature works with OneSync enabled.
* Feature works with a clean FiveM installation.

---

# Performance Standards

ASP prioritizes performance.

Contributors should avoid:

* Unlimited loops.
* Constant native calls.
* Unnecessary entity searches.
* Excessive network events.

Target performance:

Idle:

```
0.00-0.02 ms
```

Active systems:

```
Under 0.10 ms
```

---

# Third-Party Code

If adding third-party code:

You must:

* Verify the license.
* Preserve attribution.
* Document the source.
* Ensure license compatibility.

---

# Reporting Bugs

When reporting a bug, include:

## Description

What happened?

## Expected Behavior

What should happen?

## Steps To Reproduce

1.
2.
3.

## Environment

Include:

* FiveM artifact version.
* Server framework.
* OneSync status.
* Installed resources.
* Console errors.

---

# Feature Requests

Feature requests should explain:

* The problem being solved.
* How the feature would work.
* Why it benefits ASP users.

---

# Code of Conduct

All contributors are expected to:

* Be respectful.
* Provide constructive feedback.
* Help maintain a professional community.

---

# License

By contributing to AirSupportPro, you agree that your contributions will be released under the project's MIT License unless otherwise specified.

```
```
