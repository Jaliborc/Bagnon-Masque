--[[
	Copyright 2011-2026 João Cardoso
	All Rights Reserved
--]]

local Masque = LibStub('Masque')
local Addon = Bagnon or Bagnonium
if not Addon then return end

for i, frameID in ipairs {'inventory', 'bank', 'guildbank', 'voidstorage'} do
	Masque:Group(Addon.Name, frameID .. ' - items')
	Masque:Group(Addon.Name, frameID .. ' - bags')
end


--[[ Overrides ]]--

local Item, Bag = Addon.Item, Addon.Bag
local NewItem, UpdateBorder = Item.New, Item.UpdateBorder
local NewBag = Bag.New

function Item:New(...)
	local b = NewItem(self, ...)
	local name = b:GetName()

	Masque:Group(Addon.Name, b:GetFrameID() .. ' - items'):AddButton(b, {
		Normal = b:GetNormalTexture(),
		Pushed = b:GetPushedTexture(),
		Highlight = b:GetHighlightTexture(),
		Count = b.Count or _G[name .. 'Count'],
		Icon = b.icon or _G[name .. 'IconTexture'],
		IconBorder  = b.IconGlow,
		Cooldown = b.Cooldown,
	})
	
	return b
end

function Item:UpdateBorder()
	UpdateBorder(self)
	self.IconBorder:SetAlpha(0)
end

function Bag:New(...)
	local b = NewBag(self, ...)

	Masque:Group(Addon.Name, b:GetFrameID() .. ' - bags'):AddButton(b, {
		Count = b.Count,
		Icon = b.Icon,

		Normal = b:GetNormalTexture(),
		Highlight = b:GetHighlightTexture(),
		Pushed = b:GetPushedTexture(),
		Checked = b:GetCheckedTexture(),
	})

	return b
end
