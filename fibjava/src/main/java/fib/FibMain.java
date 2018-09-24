package fib;

public class FibMain { 
   static {
      System.loadLibrary("fib"); 
   }
 
   private native int fib(int n);
 
   public static void main(String[] args) {
   	  int n = Integer.parseInt(args[0]);
   	  int value = new FibMain().fib(Integer.parseInt(args[0]));
      System.out.println("fib(" + n + ") = " + value);
   }
}
