/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author SIT
 */
public class NumberFunction {
    public static boolean isNumber(String x) {
        boolean b = true ;
        try {
            Integer.parseInt(x);
        } catch (Exception e) {
            b = false;
        }
        return b;
    }
}
