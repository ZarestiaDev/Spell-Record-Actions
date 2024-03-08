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
	actions_iedit.setVisible(not bReadOnlyNew);

	if bReadOnlyNew then
		actions_iedit.setValue(0);
	end
end
