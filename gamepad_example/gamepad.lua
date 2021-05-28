local gamepad = {}

gamepad.update_stick = function(self, stick_name)
    
    local delta_move = 15
    local new_pos = self.stick_values[stick_name] * delta_move
    
    gui.set_position(self.gui_tree["gamepad_template/" .. stick_name], new_pos)    
    
end

gamepad.update_button = function(self, pad_name)
    
    for k,v in pairs({"left", "right", "up", "down"}) do
        local id = "buttons_" .. pad_name .. "_" .. v
        local gui_n = self.gui_tree["gamepad_template/" .. id]
        
        local v = self.pad_values[pad_name][v]
        if (v > 0) then
            gui.set_color(gui_n, vmath.vector4(1,0,0,0.6))
        else
            gui.set_color(gui_n, vmath.vector4(1,0,0,0))
        end
        
    end
    
end

gamepad.update_buttons = function(self, btns)
    for k, v in pairs(self.btns) do
        if (v.value > 0) then
            gui.set_color(self.gui_tree["gamepad_template/"..k], vmath.vector4(1,0,0,0.6))
        else
            gui.set_color(self.gui_tree["gamepad_template/"..k], vmath.vector4(0.38,0.38,0.38,1))
        end
    end
end

gamepad.update_triggers = function(self, btns)
    for k, v in pairs(self.triggers) do
        if (v.value > 0) then
            gui.set_color(self.gui_tree["gamepad_template/"..k], vmath.vector4(1,0,0,v.value))
        else
            gui.set_color(self.gui_tree["gamepad_template/"..k], vmath.vector4(0.38,0.38,0.38,1))
        end
    end
end

gamepad.new = function(gui_tree, index, name)

    gui.set_text(gui_tree["gamepad_template/name"], name)
    local gp = {}
    gp.gui_tree = gui_tree
    gp.stick_default_pos = {
        stick_left = gui.get_position(gui_tree["gamepad_template/stick_left"]),
        stick_right = gui.get_position(gui_tree["gamepad_template/stick_right"])
    }
    gp.stick_values = {
        stick_left = vmath.vector3(0, 0, 0),
        stick_right = vmath.vector3(0, 0, 0)
    }
    gp.pad_values = {
        right = { 
            left = 0, 
            right = 0, 
            up = 0, 
            down = 0},
            left = { 
                left = 0, 
                right = 0, 
                up = 0,
                down = 0
            }
    }
    gp.btns = {
        lstick_btn = {action_id = hash("GAMEPAD_LSTICK_CLICK"), value = 0},
        rstick_btn = {action_id = hash("GAMEPAD_RSTICK_CLICK"), value = 0},
        rshoulder_btn = {action_id = hash("GAMEPAD_RSHOULDER"), value = 0},
        lshoulder_btn = {action_id = hash("GAMEPAD_LSHOULDER"), value = 0},
        guide = {action_id = hash("GAMEPAD_GUIDE"), value = 0},
        start = {action_id = hash("GAMEPAD_START"), value = 0},
        back = {action_id = hash("GAMEPAD_BACK"), value = 0},
    }

    gp.triggers = {
        ltrigger_btn = {action_id = hash("GAMEPAD_LTRIGGER"), value = 0},
        rtrigger_btn = {action_id = hash("GAMEPAD_RTRIGGER"), value = 0},
    }
    
    gp.on_input = function(self, action_id, action)
        if (index == action.gamepad) then
            
            if (action_id == hash("GAMEPAD_LSTICK_LEFT")) then
                self.stick_values.stick_left.x = -action.value
            elseif (action_id == hash("GAMEPAD_LSTICK_RIGHT")) then
                self.stick_values.stick_left.x = action.value
            elseif (action_id == hash("GAMEPAD_LSTICK_UP")) then
                self.stick_values.stick_left.y = action.value
            elseif (action_id == hash("GAMEPAD_LSTICK_DOWN")) then
                self.stick_values.stick_left.y = -action.value
            end
            
            if (action_id == hash("GAMEPAD_RSTICK_LEFT")) then
                self.stick_values.stick_right.x = -action.value
            elseif (action_id == hash("GAMEPAD_RSTICK_RIGHT")) then
                self.stick_values.stick_right.x = action.value
            elseif (action_id == hash("GAMEPAD_RSTICK_UP")) then
                self.stick_values.stick_right.y = action.value
            elseif (action_id == hash("GAMEPAD_RSTICK_DOWN")) then
                self.stick_values.stick_right.y = -action.value
            end

            for k, v in pairs(self.triggers) do
                if (action_id == v.action_id) then
                    v.value = action.value
                end
            end
            
            local p_value = 1
            if (action.released or action.value < 1) then
                p_value = 0
            end
            
            if (action_id == hash("GAMEPAD_RPAD_LEFT")) then
                self.pad_values.right.left = p_value
            elseif (action_id == hash("GAMEPAD_RPAD_RIGHT")) then
                self.pad_values.right.right = p_value
            elseif (action_id == hash("GAMEPAD_RPAD_UP")) then
                self.pad_values.right.up = p_value
            elseif (action_id == hash("GAMEPAD_RPAD_DOWN")) then
                self.pad_values.right.down = p_value
            end
            
            if (action_id == hash("GAMEPAD_LPAD_LEFT")) then
                self.pad_values.left.left = p_value
            elseif (action_id == hash("GAMEPAD_LPAD_RIGHT")) then
                self.pad_values.left.right = p_value
            elseif (action_id == hash("GAMEPAD_LPAD_UP")) then
                self.pad_values.left.up = p_value
            elseif (action_id == hash("GAMEPAD_LPAD_DOWN")) then
                self.pad_values.left.down = p_value
            end
            
            for k, v in pairs(self.btns) do
                if (action_id == v.action_id) then
                    v.value = p_value
                end
            end
            
            gamepad.update_stick(self, "stick_left")
            gamepad.update_stick(self, "stick_right")
            gamepad.update_button(self, "left")
            gamepad.update_button(self, "right")
            gamepad.update_buttons(self)
            gamepad.update_triggers(self)
        end
    end
    
    return gp

end

return gamepad