/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.xml.registry.infomodel.User;
import model.Users;

/**
 *
 * @author Epen
 */
public class ModelStatic {
    public static Users useRumbler = new Users();

    public void setUseRumbler(Users useRumbler) {
        this.useRumbler = useRumbler;
    }

    public Users getUseRumbler() {
        return useRumbler;
    }
    
}
