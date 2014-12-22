--[[
Copyright 2011-2013 João Cardoso
Bagnon Facade is distributed under the terms of the GNU General Public License (or the Lesser GPL).
This file is part of Bagnon Facade.

Bagnon Facade is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Bagnon Facade is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Bagnon Facade. If not, see <http://www.gnu.org/licenses/>.
--]]

local Masque = LibStub('Masque')
Masque:Group('Bagnon', 'inventory')
Masque:Group('Bagnon', 'bank')
Masque:Group('Bagnon', 'guildbank')
Masque:Group('Bagnon', 'voidstorage')

local ItemSlot = Bagnon.ItemSlot
local SetParent = ItemSlot.SetParent

function ItemSlot:SetParent(parent)
	if self:GetFrameID() then
		Masque:Group('Bagnon', self:GetFrameID()):RemoveButton(self)
	end

	local name = self:GetName()
	SetParent(self, parent)
	
	if self:GetFrameID() then
		Masque:Group('Bagnon', self:GetFrameID()):AddButton(self, {
			Count = self.Count or _G[name .. 'Count'],
			Icon = self.icon or _G[button:GetName() .. 'IconTexture'],
			
			Normal = self:GetNormalTexture(),
			Highlight = self:GetHighlightTexture(),
			Pushed = self:GetPushedTexture(),
			
			Cooldown = self.Cooldown,
			Border = self.Border,
		})
	end
end