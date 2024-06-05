
import java.util.ArrayList;
import java.util.List;

public class Counter {
    
    private int id = 0;
    private List<Integer> idBase = new ArrayList<Integer>();
    
    public Counter() {
    }

    public void add(){
        id =+ 1;
        idBase.add(id);
    }
    
}
