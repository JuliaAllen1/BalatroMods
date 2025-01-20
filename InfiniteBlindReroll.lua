--- STEAMODDED HEADER
--- MOD_NAME: Retcon
--- MOD_ID: RETCON
--- MOD_AUTHOR: [saltedjules_]
--- MOD_DESCRIPTION: Adds Retcon Voucher to all runs
---
----------------------------------------------
------------MOD CODE -------------------------

local MOD_ID = "DCUT"

function SMODS.INIT.DirectorsCutMod()
  G.localization.descriptions["Stake"]["stake_white"] = {
    name = "White Stake",
    text = {
      "Starts with {C:attention,T:v_retcon}Retcon Voucher{}"
    }
  }
end

local Backapply_to_runRef_stake = Back.apply_to_run
-- new effects

function Back.apply_to_run(arg)
  Backapply_to_runRef_stake(arg)

  local applied_voucher = 'v_retcon'
  if G.GAME.stake >= 0 then
    G.GAME.used_vouchers[applied_voucher] = true
    Card.apply_to_run(nil, G.P_CENTERS[applied_voucher])
  end
end
