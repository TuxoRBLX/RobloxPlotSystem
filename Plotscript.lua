local players = game:GetService("Players")
local plotModule = require(script.PlotModule) -- < Change this to your module path

players.PlayerAdded:Connect(function(player : Player)
	plotModule.GivePlot(player) -- Use: Local Plot = plotModule.GivePlot(player) to get the plot folder.
end)

players.PlayerRemoving:Connect(function(player : Player)
	plotModule.ClearPlot(player) -- Use: plotModule.ClearPlot(player) to clear the plot folder.
end)

-- Functions:
-- plotModule.GivePlot(player) -- < Give plot to player
-- plotModule.ClearPlot(player) -- < Clear plot from player
-- plotModule.IsOwner(plot, player) -- < Check if player is owner of plot returns true or false
-- plotModule.GetPlot(player) -- < Get plot from player
-- You can use the functions in every server script connected with the module.

-- Setup:
-- 1. Put this script in ServerScriptService.
-- 2. Make a Plots folder in Workspace.
-- 3. Make a plot folder in Plots folder.
-- 4. Make a owner attribute (String) in plot folder.
-- 5. Use require(YourModulePath.PlotModule) in the scripts you want to use plot functions.
-- 6. Enjoy and change the module to your needs.
