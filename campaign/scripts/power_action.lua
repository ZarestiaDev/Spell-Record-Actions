-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function onInit()
	registerMenuItem(Interface.getString("power_menu_actiondelete"), "deletepointer", 4);
	registerMenuItem(Interface.getString("list_menu_deleteconfirm"), "delete", 4, 3);
	
	updateDisplay();
	
	local node = getDatabaseNode();
	
	-- Zarestia adding safety clause for checking whether the spell is on a charsheet
	local sNodeName = node.getNodeName()
	if string.match(sNodeName, "charsheet") then
		windowlist.setOrder(node);
	end

	local sNode = getDatabaseNode().getPath();
	DB.addHandler(sNode, "onChildUpdate", onDataChanged);
	onDataChanged();
end

function onClose()
	if super and super.onClose then
        super.onClose();
    end
end

function onMenuSelection(selection, subselection)
	if super and super.onMenuSelection then
        super.onMenuSelection();
    end
end

function highlight(bState)
	if super and super.highlight then
        super.highlight();
    end
end

function updateDisplay()
	if super and super.updateDisplay then
        super.updateDisplay();
    end
end

function updateViews()
	if super and super.updateViews then
        super.updateViews();
    end
end

function onDataChanged()
	if super and super.onDataChanged then
        super.onDataChanged();
    end
end

function onCastChanged()
	if super and super.onCastChanged then
        super.onCastChanged();
    end
end

function onDamageChanged()
	if super and super.onDamageChanged then
        super.onDamageChanged();
    end
end

function onHealChanged()
	if super and super.onHealChanged then
        super.onHealChanged();
    end
end

function onEffectChanged()
	if super and super.onEffectChanged then
        super.onEffectChanged();
    end
end