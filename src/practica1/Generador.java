package practica1;

//import java.io.BufferedReader;
import java.io.File;
// java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.LinkedList;


public class Generador {
	 public static Analizador_Lexico lexico;
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path="C:\\Users\\Mujo\\eclipse-workspace\\practica1\\src\\practica1\\lexico.jflex";
		File lexF=new File(path);
		jflex.Main.generate(lexF);
		
		
		/*path="C:\\Users\\Mujo\\Desktop\\prueba.txt";
		File lexL=new File(path);
		String salida="";
		
		 try {
             FileReader leer=new FileReader(lexL);
             String entrada="";
             int valor=leer.read();
             while(valor!=-1){
                 entrada=entrada+(char)valor;
                 valor=leer.read();
             }
             
             leer.close();
             salida=entrada;
         } catch (Exception e) {
         }
		
		
       
		
        lexico=new Analizador_Lexico((new StringReader(salida)));
        try {
        	
        	
			lexico.yylex();
			LinkedList<Tabla_Errores> error_le=lexico.Error_Lex;
			LinkedList<Simbolos> sim=lexico.table_sym; 
			
			if(!error_le.isEmpty()) {
				Ver_Error(error_le);
				Ver_Simbolos(sim);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
        
	}
	public static void Ver_Error(LinkedList<Tabla_Errores> E_lex) {
		for(Tabla_Errores tb:E_lex){
            tb.VerInformacion();
		   }
			}
			
			public static void Ver_Simbolos(LinkedList<Simbolos> sym) {
				for(Simbolos tb:sym){
		            tb.Mostrar_Simbolo();
				 }*/
			}

		}
		            