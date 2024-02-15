local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local Packages = ReplicatedStorage:WaitForChild("Packages")
local Server = ServerScriptService:WaitForChild("Server")

local Loader = require(Packages.Loader)

local modules = Loader.LoadDescendants(Server, Loader.MatchesName("Service$"))

Loader.SpawnAll(modules, "Init"):andThen(function()
    Loader.SpawnAll(modules, "Start")
end)