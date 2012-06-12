package blog.omarello

import org.apache.commons.collections.list.LazyList;
import org.apache.commons.collections.FactoryUtils;

class Contact {

    static constraints = {
        firstName(blank:false)
        lastName(blank:false)
    }
    
    String firstName
    String lastName
    String nickName
    
    List phones = new ArrayList()
    static hasMany = [ phones:Phone ]
    
    static mapping = {
        phones cascade:"all-delete-orphan"
    }
    
    def getPhonesList() {
        return LazyList.decorate(
              phones,
              FactoryUtils.instantiateFactory(Phone.class))
    }
    
    def String toString() {
        return "${lastName}, ${firstName}"
    }
}
