local PlotModule = {}

local plotFolder = workspace:WaitForChild("Plots")

function PlotModule.GivePlot(player : Player)
	local playerId = player.UserId
	for _, plot in pairs(plotFolder:GetChildren()) do
		if plot:IsA("Folder") then
			if plot:GetAttribute("owner") ~= "" then continue end -- < Plot is already taken
			plot:SetAttribute("owner", playerId) -- < Set owner
			return plot
		end
	end
end

function PlotModule.ClearPlot(player : Player)
	local playerId = player.UserId
	for _, plot in pairs(plotFolder:GetChildren()) do
		if plot:IsA("Folder") then
			if plot:GetAttribute("owner") == playerId then
				plot:SetAttribute("owner", "") -- < Clear owner
			end
		end
	end
end

function PlotModule.IsOwner(plot : Folder, player : Player) -- Check if player is owner of plot
	if not plot or not player then
		warn("Plot or Player does not exist.") -- < you can change the warn or remove it
		return false
	end
	return plot:GetAttribute("owner") == player.UserId
end

function PlotModule.GetPlot(player : Player)
	local playerId = player.UserId
	for _, plot in pairs(plotFolder:GetChildren()) do
		if plot:IsA("Folder") then
			if plot:GetAttribute("owner") == playerId then
				return plot
			end
		end
	end
end

return PlotModule
