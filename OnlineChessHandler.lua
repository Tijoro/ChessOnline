local rem = game:GetService("ReplicatedStorage"):WaitForChild("Online")
local GraveYards = script.Parent.Parent:WaitForChild("GraveYards")
local plrs = game:GetService("Players")
local rep = game:GetService("ReplicatedStorage")

local Chars = {"a", "b", "c", "d", "e", "f", "g", "h"}

local function charstonum(char)
	for i, v in ipairs(Chars) do
		if v == char then
			return i
		end
	end
end

rem.OnClientEvent:Connect(function(displayname, name, text)
	if text == "Accept" then
		local Sounds = rep:WaitForChild("Sounds")
		local Sound = Sounds:WaitForChild("StartGame")
		local Debris = game:GetService("Debris")
		local SoundClone = Sound:Clone()
		SoundClone.Parent = workspace
		Sound:Play()
		Debris:AddItem(SoundClone, SoundClone.TimeLength)
		local Board = script.Parent:Clone()
		Board.Turn.LocalScript.Disabled = false
		Board.LocalScript:Destroy()
		Board.Parent = script.Parent.Parent
		Board.Name = "Board"
		script.Parent.Parent.Opponent.Value = name
		script.Parent.Parent.Names.Visible = true
		local Opponentplr = plrs:FindFirstChild(name)
		if Opponentplr then
			local userId = Opponentplr.UserId
			local thumbType = Enum.ThumbnailType.HeadShot
			local thumbSize = Enum.ThumbnailSize.Size420x420
			local content, isReady = plrs:GetUserThumbnailAsync(userId, thumbType, thumbSize)
			script.Parent.Parent.Names.Opponent.ImageLabel.Image = content
		end
		local userId = plrs.LocalPlayer.UserId
		local thumbType = Enum.ThumbnailType.HeadShot
		local thumbSize = Enum.ThumbnailSize.Size420x420
		local content, isReady = plrs:GetUserThumbnailAsync(userId, thumbType, thumbSize)
		script.Parent.Parent.Names.You.ImageLabel.Image = content
		script.Parent.Parent.Names.Visible = true
		script.Parent.Parent.X.Visible = true
		for i, v in pairs(GraveYards:GetDescendants()) do
			if v:IsA("ImageButton") and v.Name ~= "Killed" then
				v:Destroy()
			end
		end
		local rnd = math.random(1,2)
		if rnd == 1 then
			rem:FireServer(name, "Black")
			script.Parent.Parent.Parent.Parent.ScrollingFrame.Visible = false
			script.Parent.Parent.Players.Visible = false
			script.Parent.Parent.Title.Visible = false
			Board.Color.Value = "White"
			script.Parent.Parent.Names.You.Clock.TimeVal.Value = 600
			script.Parent.Parent.Names.You.Clock.BoolVal.Value = true
			for i, v in pairs(script.Parent.Parent.Parent.PressAndPlay:GetChildren()) do
				if v:IsA("ImageLabel") and v.Visible == true then
					v:Destroy()
				end
			end
			Board.Rotation = 0
			for i, v in pairs(Board:GetDescendants()) do
				if v:IsA("ImageButton") then
					v.Rotation = 0
				end
			end
			script.Parent.Parent.GraveYards.Black.Position = UDim2.new(0.192, 0,-0.01, 0)
			script.Parent.Parent.GraveYards.White.Position = UDim2.new(0.192, 0,0.839, 0)
			Board.Visible = true
		else
			rem:FireServer(name, "White")
			script.Parent.Parent.Parent.Parent.ScrollingFrame.Visible = false
			script.Parent.Parent.Players.Visible = false
			script.Parent.Parent.Title.Visible = false
			Board.Color.Value = "Black"
			script.Parent.Parent.Names.Opponent.Clock.TimeVal.Value = 600
			script.Parent.Parent.Names.Opponent.Clock.BoolVal.Value = true
			for i, v in pairs(script.Parent.Parent.Parent.PressAndPlay:GetChildren()) do
				if v:IsA("ImageLabel") and v.Visible == true then
					v:Destroy()
				end
			end
			Board.Rotation = 180
			for i, v in pairs(Board:GetDescendants()) do
				if v:IsA("ImageButton") then
					v.Rotation = 180
				end
			end
			script.Parent.Parent.GraveYards.Black.Position = UDim2.new(0.192, 0,0.839, 0)
			script.Parent.Parent.GraveYards.White.Position = UDim2.new(0.192, 0,-0.01, 0)
			Board.Image = "rbxassetid://13432550961"
			Board.Visible = true
		end
	elseif text == "Black" then
		local Sounds = rep:WaitForChild("Sounds")
		local Sound = Sounds:WaitForChild("StartGame")
		local Debris = game:GetService("Debris")
		local SoundClone = Sound:Clone()
		SoundClone.Parent = workspace
		Sound:Play()
		Debris:AddItem(SoundClone, SoundClone.TimeLength)
		script.Parent.Parent.Names.Opponent.Clock.TimeVal.Value = 600
		script.Parent.Parent.Names.Opponent.Clock.BoolVal.Value = true
		script.Parent.Parent.Title.Visible = false
		script.Parent.Parent.Names.Visible = true
		script.Parent.Parent.X.Visible = true
		local Board = script.Parent:Clone()
		Board.Turn.LocalScript.Disabled = false
		Board.Parent = script.Parent.Parent
		Board.Name = "Board"
		script.Parent.Parent.Opponent.Value = name
		local Opponentplr = plrs:FindFirstChild(name)
		if Opponentplr then
			local userId = Opponentplr.UserId
			local thumbType = Enum.ThumbnailType.HeadShot
			local thumbSize = Enum.ThumbnailSize.Size420x420
			local content, isReady = plrs:GetUserThumbnailAsync(userId, thumbType, thumbSize)
			script.Parent.Parent.Names.Opponent.ImageLabel.Image = content
		end
		local userId = plrs.LocalPlayer.UserId
		local thumbType = Enum.ThumbnailType.HeadShot
		local thumbSize = Enum.ThumbnailSize.Size420x420
		local content, isReady = plrs:GetUserThumbnailAsync(userId, thumbType, thumbSize)
		script.Parent.Parent.Names.You.ImageLabel.Image = content
		for i, v in pairs(GraveYards:GetDescendants()) do
			if v:IsA("ImageButton") and v.Name ~= "Killed" then
				v:Destroy()
			end
		end
		script.Parent.Parent.Parent.Parent.ScrollingFrame.Visible = false
		script.Parent.Parent.Players.Visible = false
		Board.Color.Value = "Black"
		for i, v in pairs(script.Parent.Parent.Parent.PressAndPlay:GetChildren()) do
			if v:IsA("ImageLabel") and v.Visible == true then
				v:Destroy()
			end
		end
		Board.Rotation = 180
		for i, v in pairs(Board:GetDescendants()) do
			if v:IsA("ImageButton") then
				v.Rotation = 180
			end
		end
		script.Parent.Parent.GraveYards.Black.Position = UDim2.new(0.192, 0,0.839, 0)
		script.Parent.Parent.GraveYards.White.Position = UDim2.new(0.192, 0,-0.01, 0)
		Board.Image = "rbxassetid://13432550961"
		Board.Visible = true
	elseif text == "White" then
		local Sounds = rep:WaitForChild("Sounds")
		local Sound = Sounds:WaitForChild("StartGame")
		local Debris = game:GetService("Debris")
		local SoundClone = Sound:Clone()
		SoundClone.Parent = workspace
		Sound:Play()
		Debris:AddItem(SoundClone, SoundClone.TimeLength)
		script.Parent.Parent.Names.You.Clock.TimeVal.Value = 600
		script.Parent.Parent.Names.You.Clock.BoolVal.Value = true
		script.Parent.Parent.Title.Visible = false
		script.Parent.Parent.Names.Visible = true
		script.Parent.Parent.X.Visible = true
		local Board = script.Parent:Clone()
		Board.Turn.LocalScript.Disabled = false
		Board.Parent = script.Parent.Parent
		Board.Name = "Board"
		script.Parent.Parent.Opponent.Value = name
		local Opponentplr = plrs:FindFirstChild(name)
		if Opponentplr then
			local userId = Opponentplr.UserId
			local thumbType = Enum.ThumbnailType.HeadShot
			local thumbSize = Enum.ThumbnailSize.Size420x420
			local content, isReady = plrs:GetUserThumbnailAsync(userId, thumbType, thumbSize)
			script.Parent.Parent.Names.Opponent.ImageLabel.Image = content
		end
		local userId = plrs.LocalPlayer.UserId
		local thumbType = Enum.ThumbnailType.HeadShot
		local thumbSize = Enum.ThumbnailSize.Size420x420
		local content, isReady = plrs:GetUserThumbnailAsync(userId, thumbType, thumbSize)
		script.Parent.Parent.Names.You.ImageLabel.Image = content
		for i, v in pairs(GraveYards:GetDescendants()) do
			if v:IsA("ImageButton") and v.Name ~= "Killed" then
				v:Destroy()
			end
		end
		script.Parent.Parent.Parent.Parent.ScrollingFrame.Visible = false
		script.Parent.Parent.Players.Visible = false
		Board.Color.Value = "White"
		for i, v in pairs(script.Parent.Parent.Parent.PressAndPlay:GetChildren()) do
			if v:IsA("ImageLabel") and v.Visible == true then
				v:Destroy()
			end
		end
		Board.Rotation = 0
		for i, v in pairs(Board:GetDescendants()) do
			if v:IsA("ImageButton") then
				v.Rotation = 0
			end
		end
		script.Parent.Parent.GraveYards.Black.Position = UDim2.new(0.192, 0,-0.01, 0)
		script.Parent.Parent.GraveYards.White.Position = UDim2.new(0.192, 0,0.839, 0)
		Board.Visible = true
	elseif text:split('Move=')[2] ~= nil then
		local Board = script.Parent.Parent:WaitForChild("Board")
		local MainMove = Board:WaitForChild("Move")
		if text:split('Move=')[2]:split('-')[1]:split('/')[1] == "King" and math.abs((charstonum(text:split('Move=')[2]:split('-')[1]:split('/')[2]) - charstonum(text:split('Move=')[2]:split('-')[2]:split('/')[2]))) == 2 then
			local Board = script.Parent.Parent:WaitForChild("Board")
			local Turn = Board:WaitForChild("Turn")
			local AntiTurn = Turn.Value
			if Board.Color.Value == "White" then
				AntiTurn = "Black"
			else
				AntiTurn = "White"
			end
			local Piece = Board[AntiTurn][text:split('Move=')[2]:split('-')[1]]
			if Piece then
				local Sounds = rep:WaitForChild("Sounds")
				local Sound = Sounds:WaitForChild("Move")
				local Debris = game:GetService("Debris")
				local SoundClone = Sound:Clone()
				SoundClone.Parent = workspace
				Sound:Play()
				Debris:AddItem(SoundClone, SoundClone.TimeLength)
				Piece.Name = text:split('Move=')[2]:split('-')[2]
				local MainMove1 = MainMove:Clone()
				MainMove1.Name = "HighLight"
				MainMove1.Parent = Board
				MainMove1.Position = Piece.Position
				MainMove1.Visible = true
				Piece.Position = UDim2.new((charstonum(Piece.Name:split('/')[2]) - 1)/8,0,1 - tonumber(Piece.Name:split('/')[3])/8,0)
				local MainMove2 = MainMove:Clone()
				MainMove2.Name = "HighLight"
				MainMove2.Parent = Board
				MainMove2.Position = Piece.Position
				MainMove2.Visible = true
			end
		else
			local Board = script.Parent.Parent:WaitForChild("Board")
			local Turn = Board:WaitForChild("Turn")
			local AntiTurn = Turn.Value
			if Board.Color.Value == "White" then
				AntiTurn = "Black"
			else
				AntiTurn = "White"
			end
			Turn.Value = Board.Color.Value
			local Piece = Board[AntiTurn][text:split('Move=')[2]:split('-')[1]]
			if Piece then
				local Sounds = rep:WaitForChild("Sounds")
				local Sound = Sounds:WaitForChild("Move")
				local Debris = game:GetService("Debris")
				local SoundClone = Sound:Clone()
				SoundClone.Parent = workspace
				Sound:Play()
				Debris:AddItem(SoundClone, SoundClone.TimeLength)
				if Piece.Name:split('/')[1] == "Pawn" and ((text:split('Move=')[2]:split('-')[2]:split('/')[3] == "8" and AntiTurn == "White") or (text:split('Move=')[2]:split('-')[2]:split('/')[3] == "1" and AntiTurn == "Black")) then
					Piece.Name = "Queen" .. "/" .. text:split('Move=')[2]:split('-')[2]:split('/')[2] .. "/" .. text:split('Move=')[2]:split('-')[2]:split('/')[3]
					Piece.Image = "rbxassetid://13411488345"
				else
					Piece.Name = text:split('Move=')[2]:split('-')[2]
				end
				for i, v in pairs(Board:GetChildren()) do
					if v.Name == "HighLight" then
						v:Destroy()
					end
				end
				local MainMove1 = MainMove:Clone()
				MainMove1.Name = "HighLight"
				MainMove1.Parent = Board
				MainMove1.Position = Piece.Position
				MainMove1.Visible = true
				Piece.Position = UDim2.new((charstonum(Piece.Name:split('/')[2]) - 1)/8,0,1 - tonumber(Piece.Name:split('/')[3])/8,0)
				local MainMove2 = MainMove:Clone()
				MainMove2.Name = "HighLight"
				MainMove2.Parent = Board
				MainMove2.Position = Piece.Position
				MainMove2.Visible = true
			end
		end
	elseif text:split('Kill=')[2] ~= nil then
		local Board = script.Parent.Parent:WaitForChild("Board")
		local MainMove = Board:WaitForChild("Move")
		local Board = script.Parent.Parent:WaitForChild("Board")
		local Turn = Board:WaitForChild("Turn")
		local AntiTurn = Turn.Value
		if Board.Color.Value == "White" then
			AntiTurn = "Black"
		else
			AntiTurn = "White"
		end
		Turn.Value = Board.Color.Value
		local Piece = Board[AntiTurn][text:split('Kill=')[2]:split('-')[1]]
		if Piece then
			local Sounds = rep:WaitForChild("Sounds")
			local Sound = Sounds:WaitForChild("Capture")
			local Debris = game:GetService("Debris")
			local SoundClone = Sound:Clone()
			SoundClone.Parent = workspace
			Sound:Play()
			Debris:AddItem(SoundClone, SoundClone.TimeLength)
			if Piece.Name:split('/')[1] == "Pawn" and ((text:split('Kill=')[2]:split('-')[2]:split('/')[3] == "8" and AntiTurn == "White") or (text:split('Kill=')[2]:split('-')[2]:split('/')[3] == "1" and AntiTurn == "Black")) then
				Piece.Name = "Queen" .. "/" .. text:split('Kill=')[2]:split('-')[2]:split('/')[2] .. "/" .. text:split('Kill=')[2]:split('-')[2]:split('/')[3]
				Piece.Image = "rbxassetid://13411488345"
			else
				Piece.Name = text:split('Kill=')[2]:split('-')[2]
			end
			for i, v in pairs(Board:GetChildren()) do
				if v.Name == "HighLight" then
					v:Destroy()
				end
			end
			local MainMove1 = MainMove:Clone()
			MainMove1.Name = "HighLight"
			MainMove1.Parent = Board
			MainMove1.Position = Piece.Position
			MainMove1.Visible = true
			Piece.Position = UDim2.new((charstonum(Piece.Name:split('/')[2]) - 1)/8,0,1 - tonumber(Piece.Name:split('/')[3])/8,0)
			local MainMove2 = MainMove:Clone()
			MainMove2.Name = "HighLight"
			MainMove2.Parent = Board
			MainMove2.Position = Piece.Position
			MainMove2.Visible = true
			for i, v in pairs(Board[Turn.Value]:GetChildren()) do
				if v.Name:split('/')[2] == Piece.Name:split('/')[2] and v.Name:split('/')[3] == Piece.Name:split('/')[3] then
					local Killed = GraveYards:FindFirstChild(AntiTurn):FindFirstChild("Killed"):Clone()
					Killed.Image = v.Image
					Killed.Name = v.Name
					Killed.Visible = true
					Killed.Parent = GraveYards:FindFirstChild(AntiTurn)
					v:Destroy()
				end
			end
		end
	end
end)


