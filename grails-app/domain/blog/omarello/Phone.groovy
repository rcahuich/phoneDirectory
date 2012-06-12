package blog.omarello

class Phone {

    public enum PhoneType{
        H("Home"),
        M("Mobile"),
        W("Work")

        final String value;
        
        PhoneType(String value) {
            this.value = value;
        }
        
        String toString(){
            value;
        }
        
        String getKey(){
            name()
        }

        static list() {
            [H, M, W]
        }

    }

    static constraints = {
        index(blank:false, min:0)
        number(blank:false)
        type(blank:false, inList:PhoneType.list(), minSize:1, maxSize:1)
    }
    
    int index
    String number
    PhoneType type
    boolean deleted
    
    static transients = [ 'deleted' ]
    
    static belongsTo = [ contact:Contact ]
    
    def String toString() {
        return "($index) ${number} - ${type.value}"
    }
}
