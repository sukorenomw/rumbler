/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.Set;
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

    /*public ArrayList makeArray(Class<?> cls) {
        ArrayList arr = new ArrayList();
        for (cls obj : arr) {
            arr.add(obj);
        }
        return null;
    }*/
}
