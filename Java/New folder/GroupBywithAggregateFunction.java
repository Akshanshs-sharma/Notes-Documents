import java.util.*;



public class GroupBywithAggregateFunction {
     
    public void groupBywithAggregateFunction(String a,double value )
    {
        Map<String,Double> sum = new HashMap<>();

        if(sum.containsKey(a))
        {
           double v = value + sum.get(a);
           sum.put(a,v);
        }
    }
}
