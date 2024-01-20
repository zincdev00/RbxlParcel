# Parcel
A simple module initialization library to allow consistent loading order.

## Installation
To install:
1. [Install the dependencies](#dependencies)
2. [Build the project](#building)
3. Import `build/ParcelClient.rbxm` into `DataModel/ReplicatedFirst`
3. Import `build/ParcelServer.rbxm` into `DataModel/ServerScriptService`
4. Import `build/Parcel.rbxm` into `DataModel/ReplicatedStorage/common/packages`

## Dependencies
1. `Class`

## Building
Run the `Build` task or `./build.ps1`

## Usage
To make a module init or exit:
1. Create a `<Module>:Init()`/`<Module>:Exit()` method
2. Set the attribute `InitEnabled`/`ExitEnabled` on the instance to `true`
3. Set the attribute `InitOrder`/`ExitOrder` on the instance to the desired value

Modules are initialized from least `InitOrder` to greatest, and exited in the opposite direction. In general, libraries will use orders from around 0 to 100.

`Module/init.lua`:
```lua
...
local Module = Class:create()

function Module:Init()
	print("Module initialized")
end

function Module:Exit()
	print("Module exited")
end

return Module
```

`Module/init.meta.json` (if using Rojo):
```json
{
	"attributes": {
		"InitEnabled": { "Bool": true },
		"InitOrder": { "Float64": 101 },

		"ExitEnabled": { "Bool": true },
		"ExitOrder": { "Float64": 101 }
	}
}
```