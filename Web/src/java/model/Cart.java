/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class Cart {
    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    private Item getItemById(int id){
        for(Item i:items){
            if(i.getP().getId()==id){
                return i;
            }
        }
        return null;
    }
    
    public int getNumById(int id){
        return getItemById(id).getNum();
    }
    public void addItems(Item t){
        if(getItemById(t.getP().getId())!=null){
            Item m = getItemById(t.getP().getId());
            m.setNum(m.getNum()+t.getNum()); 
        } else{
            items.add(t);
        }
    }
    
    public void removeItem(int id){
        if(getItemById(id)!=null){
            items.remove(getItemById(id));
        }
    }
    
    public int getTotalMoney(){
        int t = 0;
        for(Item i:items){
            t += i.getNum()*i.getPrice();
        }
        return t;
    }
}
