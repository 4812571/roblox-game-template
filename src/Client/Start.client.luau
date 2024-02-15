local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")

local Packages = ReplicatedStorage:WaitForChild("Packages")
local Client = StarterPlayer.StarterPlayerScripts:WaitForChild("Client")

local Loader = require(Packages.Loader)

local modules = Loader.LoadDescendants(Client, Loader.MatchesName("Controller$"))

Loader.SpawnAll(modules, "Init"):andThen(function()
    Loader.SpawnAll(modules, "Start")
end)