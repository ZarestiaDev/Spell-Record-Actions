-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function onInit()
	onSummaryChanged();
	update();
end

function onSummaryChanged()
	if super and super.onSummaryChanged then
        super.onSummaryChanged();
    end
end

function updateControl(sControl, bReadOnly, bForceHide)
	if super and super.updateControl then
        super.updateControl();
    end
end

function update()
	if super and super.update then
        super.update();
    end

	-- Zarestia adding handling for new labels and buttons
	local bReadOnlyNew = WindowManager.getReadOnlyState(getDatabaseNode());
	action_label_add.setVisible(not bReadOnlyNew);
	action_label_add_cast.setVisible(not bReadOnlyNew);
	action_label_add_damage.setVisible(not bReadOnlyNew);
	action_label_add_heal.setVisible(not bReadOnlyNew);
	action_label_add_effect.setVisible(not bReadOnlyNew);
	action_label_clear.setVisible(not bReadOnlyNew);
	action_label_parse.setVisible(not bReadOnlyNew);
	actionlist.update();
end

-- Zarestia adding function for Spell Record Actions
function createAction(sType)
	local nodePower = getDatabaseNode();
	if nodePower then
		local nodeActions = nodePower.createChild("actions");
		if nodeActions then
			local nodeAction = nodeActions.createChild();
			if nodeAction then
				DB.setValue(nodeAction, "type", "string", sType);
			end
		end
	end
end
