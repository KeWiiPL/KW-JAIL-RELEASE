AddCSLuaFile("cl_init.lua")
AddCSLuaFile( "shared.lua" )
include('shared.lua')
include("jailrelease/sh/jail_config.lua")


//
//	Initalize
//

function ENT:Initialize()
	self.Entity:SetModel(KWJAIL.NPC.MODEL)
	self:SetHullType( HULL_HUMAN )
	self:SetHullSizeNormal( )
	self:SetNPCState( NPC_STATE_SCRIPT )
	self:SetSolid( SOLID_BBOX )
	self:CapabilitiesAdd( CAP_ANIMATEDFACE )
	self:SetUseType( SIMPLE_USE )
	self:DropToFloor()
end

function ENT:Use(ply)
	if table.HasValue(KWJAIL.NPC.POLICE, ply:Team()) then
		net.Start("KWJAIL.NOTIFY")
		net.WriteInt(2,16)
		net.Send(ply)
		return false
	end
	if ply:isArrested() then
		if ply:getDarkRPVar("money") >= KWJAIL.NPC.COST then
			ply:addMoney(-KWJAIL.NPC.COST)
			ply:unArrest()
			net.Start("KWJAIL.NOTIFY")
			net.WriteInt(4,16)
			net.Send(ply)
			return false
		else
			net.Start("KWJAIL.NOTIFY")
			net.WriteInt(3,16)
			net.Send(ply)
			return false
		end
	else
		net.Start("KWJAIL.NOTIFY")
		net.WriteInt(1,16)
		net.Send(ply)
		return false
	end
end