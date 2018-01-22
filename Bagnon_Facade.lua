--[[
Copyright 2011-2017 João Cardoso
Bagnon Facade is distributed under the terms of the GNU General Public License (Version 3).
As a special exception, the copyright holders of this addon do not give permission to
redistribute and/or modify it.

This addon is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with the addon. If not, see <http://www.gnu.org/licenses/gpl-3.0.txt>.

This file is part of Bagnon Facade.
--]]

local Masque = LibStub('Masque')
for i, frameID in ipairs {'inventory', 'bank', 'guildbank', 'voidstorage'} do
	Masque:Group('Bagnon', frameID .. ' - items')
	Masque:Group('Bagnon', frameID .. ' - bags')
end

local Item, Bag = Bagnon.ItemSlot, Bagnon.Bag
local NewItem, FreeItem = Item.New, Item.Free
local NewBag = Bag.New

function Item:New(...)
	local button = NewItem(self, ...)
	local name = button:GetName()

	Masque:Group('Bagnon', button:GetFrameID() .. ' - items'):AddButton(button, {
		Count = button.Count or _G[name .. 'Count'],
		Icon = button.icon or _G[name .. 'IconTexture'],

		Normal = button:GetNormalTexture(),
		Highlight = button:GetHighlightTexture(),
		Pushed = button:GetPushedTexture(),

		Cooldown = button.Cooldown,
		Border = button.Border,
	})

	return button
end

function Item:Free()
	if self:GetFrameID() then
		Masque:Group('Bagnon', self:GetFrameID() .. ' - items'):RemoveButton(self)
	end

	FreeItem(self)
end

function Bag:New(...)
	local button = NewBag(self, ...)

	Masque:Group('Bagnon', button:GetFrameID() .. ' - bags'):AddButton(button, {
		Count = button.Count,
		Icon = button.Icon,

		Normal = button:GetNormalTexture(),
		Highlight = button:GetHighlightTexture(),
		Pushed = button:GetPushedTexture(),
		Checked = button:GetCheckedTexture(),
	})

	return button
end
