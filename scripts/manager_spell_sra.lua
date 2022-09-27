local getActionAbilityBonusOriginal;

function onInit()
    -- check first if we want to rather use Kelrugem's SpellManager implementation
    if CompManagerSRA.EXTENSIONS["Full OverlayPackage"] then
        return;
    end

	getActionAbilityBonusOriginal = SpellManager.getActionAbilityBonus;
	SpellManager.getActionAbilityBonus = getActionAbilityBonus;
end

function getActionAbilityBonus(nodeAction)
	local nodeSpellClass = nodeAction.getChild(".......");

	if not nodeSpellClass then
		return 0;
	end
	local nodeCreature = nodeSpellClass.getChild("...");
	local sAbility = DB.getValue(nodeSpellClass, "dc.ability", "");
	local rActor = ActorManager.resolveActor(nodeCreature);
	return ActorManager35E.getAbilityBonus(rActor, sAbility);
end
