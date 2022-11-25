-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function onInit()
	registerMenuItem(Interface.getString("power_menu_actiondelete"), "deletepointer", 4);
	registerMenuItem(Interface.getString("list_menu_deleteconfirm"), "delete", 4, 3);
	
	self.updateDisplay();
	
	local node = getDatabaseNode();
	
	-- Zarestia adding safety clause for checking whether the spell is on a charsheet
	local sNodeName = node.getNodeName();
	if string.match(sNodeName, "charsheet") and windowlist.getName() == "actions" then
		windowlist.setOrder(node);
	end

	local sNode = getDatabaseNode().getPath();
	DB.addHandler(sNode, "onChildUpdate", onDataChanged);
	self.onDataChanged();
end
