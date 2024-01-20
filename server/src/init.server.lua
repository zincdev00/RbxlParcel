local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Parcel = require(ReplicatedStorage.common.packages.Parcel)



local directories = {
	ReplicatedStorage.common.packages,
	ReplicatedStorage.common.source,
	ServerStorage.server.packages,
	ServerStorage.server.source,
}
Parcel:Init(directories)

game:BindToClose(function()
	Parcel:Exit(directories)
end)

