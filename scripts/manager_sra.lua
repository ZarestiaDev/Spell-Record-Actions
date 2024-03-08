function addSRA(nodeSpell)
	local sSpellDur = DB.getValue(nodeSpell, "duration", "");
	local aDurWords = StringManager.parseWords(sSpellDur);
	
	local i = 1;
	if StringManager.isNumberString(aDurWords[i]) then
	i = i + 1;
		if StringManager.isWord(aDurWords[i], { "round", "rounds", "min", "minute", "minutes", "hour", "hours", "day", "days"}) then
			local nodeActions = DB.createChild(nodeSpell, "actions");
			if not nodeActions then
				return nil;
			end
			
			local nodeAction = DB.createChild(nodeActions);
			if not nodeAction then
				return nil;
			end
			
			DB.setValue(nodeAction, "type", "string", "effect");
			changeSRA(nodeSpell, nodeAction);
		end
	end
end

function changeSRA(nodeSpell, nodeAction)
	local sEffect = DB.getValue(nodeSpell, "effect", ""):lower();
	local sRange = DB.getValue(nodeSpell, "range", ""):lower();
	local sName = DB.getValue(nodeSpell, "name", "");
	
	DB.setValue(nodeAction, "label", "string", sName);
	
	if sEffect:match("personal") or sRange:match("personal") then
		DB.setValue(nodeAction, "targeting", "string", "self");
	end
	
	local sSpellDur = DB.getValue(nodeAction, "...duration", "");
	local aDurWords = StringManager.parseWords(sSpellDur);
	
	i = 1;
	if StringManager.isNumberString(aDurWords[i]) then
		local nSpellDur = tonumber(aDurWords[i]);
		i = i + 1;
		
		local sUnits = nil;
		if StringManager.isWord(aDurWords[i], { "round", "rounds" }) then
			sUnits = "";
		elseif StringManager.isWord(aDurWords[i], { "min", "minute", "minutes" }) then
			sUnits = "minute";
		elseif StringManager.isWord(aDurWords[i], { "hour", "hours" }) then
			sUnits = "hour";
		elseif StringManager.isWord(aDurWords[i], { "day", "days" }) then
			sUnits = "day";
		end
		
		if sUnits then
			i = i + 1;
			local sStat = "cl";
			
			-- Zarestia - could be still enhanced here
			if StringManager.isWord(aDurWords[i], "per") then
				i = i + 1;
				if StringManager.isWord(aDurWords[i], "two") then
					i = i + 1;
					sStat = "oddcl";
				elseif StringManager.isWord(aDurWords[i], "three") then
					i = i + 1;
				end
			end
			
			local bUseCL = false;
			if StringManager.isWord(aDurWords[i], { "level", "levels" }) then
				bUseCL = true;
			end
			
			if bUseCL then
				DB.setValue(nodeAction, "durmult", "number", nSpellDur);
				DB.setValue(nodeAction, "durstat", "string", sStat);
			else
				DB.setValue(nodeAction, "durmod", "number", nSpellDur);
			end
			DB.setValue(nodeAction, "durunit", "string", sUnits);
		end
	end
end