local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Class = require(ReplicatedStorage.common.packages.Class)

local Parcel = Class:create()


function Parcel:Init(directories)
	local instances = {}
	for _, directory in pairs(directories) do
		for _, instance in pairs(directory:GetDescendants()) do
			if instance:IsA("ModuleScript") and instance:GetAttribute("InitEnabled") then
				table.insert(instances, instance)
			end
		end
	end
	table.sort(instances, function(a, b)
		return (a:GetAttribute("InitOrder") or 0) < (b:GetAttribute("InitOrder") or 0)
	end)
	for _, instance in pairs(instances) do
		local module = require(instance)
		if module.Init then
			module:Init()
		end
	end
end

function Parcel:Exit(directories)
	local instances = {}
	for _, directory in pairs(directories) do
		for _, instance in pairs(directory:GetDescendants()) do
			if instance:IsA("ModuleScript") and instance:GetAttribute("ExitEnabled") then
				table.insert(instances, instance)
			end
		end
	end
	table.sort(instances, function(a, b)
		return (a:GetAttribute("ExitOrder") or 0) > (b:GetAttribute("ExitOrder") or 0)
	end)
	for _, instance in pairs(instances) do
		local module = require(instance)
		if module.Exit then
			module:Exit()
		end
	end
end


return Parcel