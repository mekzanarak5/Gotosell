/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author INT303
 */
public class Util {
    public static boolean isNumber(String x ){
        try{
            Integer.parseInt(x);
        }
        catch(Exception e){
            return false;
        }
        return true;
    }
}
