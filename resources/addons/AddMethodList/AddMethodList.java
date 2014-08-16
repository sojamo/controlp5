import controlP5.*;
import java.util.*;
import java.text.*;
import java.io.*;

import static controlP5.ControlP5Legacy.*;

public class AddMethodList {

  public static void main(String ... args) {

    if(args.length==1) {

        String[] path = args[0].split("/");
        String example = path[path.length-1];
        int len = "ControlP5".length();
        String c = example.substring(len);
        c = Character.toUpperCase(c.charAt(0)) + c.substring(1);
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        println();
        println(c,dateFormat.format(date),"\nAdding Methods to:",args[0]);
        try {
          File f = new File(args[0]+example+".pde");
          BufferedReader reader = new BufferedReader(new FileReader(f));
          StringBuffer buffer = new StringBuffer();
          String line;

          while((line = reader.readLine()) != null ) {
            if(!line.startsWith("a list of all methods")) {
              buffer.append(line).append("\n");
            } else {
              break;
            }
          }

          Class<?> cls = Class.forName("controlP5."+c);

          buffer.append("a list of all methods available for the " + cls.getSimpleName( ) + " Controller\n");
		      buffer.append("use ControlP5.printPublicMethodsFor(" + cls.getSimpleName( ) + ".class);\n");
    		  buffer.append("to print the following list into the console.\n\n");
          buffer.append("You can find further details about class " + cls.getSimpleName( ) + " in the javadoc.\n\n");
          buffer.append("Format:\n");
          buffer.append("ClassName : returnType methodName(parameter type)\n\n\n");

          Set set = ControlP5.getPublicMethodsFor(cls);
          for(Object o:set) {
            buffer.append(o.toString());
            buffer.append("\n");
          }

          buffer.append("\ncreated: ");
          buffer.append(dateFormat.format(date));
          buffer.append("\n\n*/\n\n");
          PrintWriter out = new PrintWriter(f);
          out.println(buffer.toString());
          out.close();
          println("OK ",args[0] );

        } catch (Exception e) {
          println(e);
          println("ERROR.");
        }
    }

  }

}
