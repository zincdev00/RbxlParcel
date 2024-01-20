game.Loaded:Wait()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parcel = require(ReplicatedStorage.common.packages.Parcel)



local directories = {
	ReplicatedStorage.common.packages,
	ReplicatedStorage.common.source,
	ReplicatedStorage.client.packages,
	ReplicatedStorage.client.source,
}
Parcel:Init(directories)

