import java.util.*;
import java.util.concurrent.*;

public class Synchronus {
    public static void main(String[] args) {

        Object lock = new Object();

        synchronized (lock) {
            System.out.println("hello");
        }
    }
}