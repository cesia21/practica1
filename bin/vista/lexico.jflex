/*-------------- 1 area de importaciones y paquetes------*/


package practica1;
import java_cup.runtime.*;
import java.util.*; //es para poder usar Linkelist
import java.io.File;



/**------------- area de declaraciones, codigo usuario -----------------*/

%%
%{
    /*
        se declaran variables y metodos que nos puedan servir
        por ejemplo la pila para los token
        lista de errores y otras
    */

    String cadena="";  // sirve para poder llevar el contro de cadenas, en lugar de hacer una expresion regular
    
    public void Imprimir(String cadena){
    	 System.out.println(cadena);
    }
    
    
    public static LinkedList<Tabla_Errores> Le=new LinkedList<Tabla_Errores>();
    
    public static LinkedList<Simbolos> table_sym=new LinkedList<Simbolos>();
%}



//Directivas jflex 
%public //clase publica
%class Analizador_Lexico //nombre
%type void
%char //acepte char
%line //control de linea
%column //control de columnas
%full
%unicode
%ignorecase //sensitive mayus y minus
%8bit


//----------> Area de expresiones regulares 

numero=[0-9]+
Letra =[a-zA-ZñÑ]
decimal=[0-9]+["."][0-9]+

cadena=[\"][^\"\n]*[\"\n]

iden ={Letra}({Letra}|{numero})*

idenClass = ("class")("_"){iden}

idenfunciones = ("_")("_"){iden}
idenmetodo = ("_"){iden}
salida = ("system.out.println")

espacio=\t|\r|\n|\f|" "

//----> estados para realizar un analisis asi como a manita

%state STR
%state STR1

%%


/*-------------------------- AREA DE REGLAS LEXICAS ------------*/

/*--- como los espacios no los usamos los ignoramos*/





{espacio}   {/*ignorar*/}


<YYINITIAL> {numero}   {
                System.out.println("Reconocido: <<"+yytext()+">>, numero");
               // return new Symbol(simbolos.Numero,yycolumn,yyline,yytext());
                  Simbolos sim=new Simbolos(yytext(),"Numero");
                  table_sym.add(sim);
                } 
                

<YYINITIAL> {decimal} {
                System.out.println("Reconocido: <<"+yytext()+">>, decimal");
               // return new Symbol(simbolos.Decimal,yycolumn,yyline,yytext());
                }    
                
<YYINITIAL>		{cadena} {
                System.out.println("Reconocido: <<"+yytext()+">>, cadena");
               // return new Symbol(simbolos.Cadena,yycolumn,yyline,yytext());
               Simbolos sim=new Simbolos(yytext(),"Cadena");
               table_sym.add(sim);
                } 


/* palabras reservadas */

<YYINITIAL> "public"    {
                        System.out.println("Reconocido: <<"+yytext()+">>, public");
                       // return new Symbol(simbolos.Tk_public,yycolumn,yyline,yytext());
                       Simbolos sim=new Simbolos(yytext(),"Palabra reservada");
                        table_sym.add(sim);
                        }
<YYINITIAL> "void"    {
                        System.out.println("Reconocido: <<"+yytext()+">>, void");
                       // return new Symbol(simbolos.Tk_public,yycolumn,yyline,yytext());
                       Simbolos sim=new Simbolos(yytext(),"Palabra reservada");
                        table_sym.add(sim);
                        }

<YYINITIAL> "static"    {
                        System.out.println("Reconocido: <<"+yytext()+">>, static");
                       // return new Symbol(simbolos.Tk_public,yycolumn,yyline,yytext());
                       Simbolos sim=new Simbolos(yytext(),"Palabra reservada");
                        table_sym.add(sim);
                        }
                        
<YYINITIAL> "class"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, class");
                        
                        //return new Symbol(simbolos.Tk_class,yycolumn,yyline,yytext());
                        Simbolos sim=new Simbolos(yytext(),"Palabra reservada");
                        table_sym.add(sim);
                        }


<YYINITIAL> "int"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, int");
                       // return new Symbol(simbolos.Tk_int,yycolumn,yyline,yytext());
                       Simbolos sim=new Simbolos(yytext(),"Palabra reservada");
                        table_sym.add(sim);
                        }


<YYINITIAL> "string"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, string");
                      // return new Symbol(simbolos.Tk_string,yycolumn,yyline,yytext());
                      Simbolos sim=new Simbolos(yytext(),"Palabra reservada");
                        table_sym.add(sim);
                        }

<YYINITIAL> "boolean"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, boolean");
                       // return new Symbol(simbolos.Tk_boolean,yycolumn,yyline,yytext());
                       Simbolos sim=new Simbolos(yytext(),"Palabra reservada");
                        table_sym.add(sim);
                        }

<YYINITIAL> "char"     {
                       System.out.println("Reconocido: <<"+yytext()+">>, char");
                       // return new Symbol(simbolos.Tk_char,yycolumn,yyline,yytext());
                       Simbolos sim=new Simbolos(yytext(),"Palabra reservada");
                        table_sym.add(sim);
                        }

<YYINITIAL> "float"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, float");
                       // return new Symbol(simbolos.Tk_float,yycolumn,yyline,yytext());
                       Simbolos sim=new Simbolos(yytext(),"float");
                        table_sym.add(sim);
                        }

<YYINITIAL> "if"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, if");
                       // return new Symbol(simbolos.Tk_if,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"if");
                        table_sym.add(sim);
                        }

<YYINITIAL> "else"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, else");
                       // return new Symbol(simbolos.Tk_else,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"else");
                        table_sym.add(sim);
                        }


<YYINITIAL> "switch"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, switch");
                       // return new Symbol(simbolos.Tk_switch,yycolumn,yyline,yytext());
                        Simbolos sim=new Simbolos(yytext(),"switch");
                        table_sym.add(sim);
                        }

<YYINITIAL> "for"      {
                        System.out.println("Reconocido: <<"+yytext()+">>, for");
                       // return new Symbol(simbolos.Tk_for,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"for");
                        table_sym.add(sim);
                        }

<YYINITIAL> "while"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, while");
                       // return new Symbol(simbolos.Tk_while,yycolumn,yyline,yytext());
                        Simbolos sim=new Simbolos(yytext(),"while");
                        table_sym.add(sim);
                        }

<YYINITIAL> "do"       {
                        System.out.println("Reconocido: <<"+yytext()+">>, do");
                       // return new Symbol(simbolos.Tk_do,yycolumn,yyline,yytext());
                        Simbolos sim=new Simbolos(yytext(),"do");
                        table_sym.add(sim);
                        }


<YYINITIAL> "{"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, LlaveA");
                        //return new Symbol(simbolos.Tk_LlaveA,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"LlaveA");
                        table_sym.add(sim);
                        }

<YYINITIAL> "}"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, LlaveC");
                        //return new Symbol(simbolos.Tk_LlaveC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"LlaveC");
                        table_sym.add(sim);
                        }

<YYINITIAL> "("     {
                        System.out.println("Reconocido: <<"+yytext()+">>, ParA");
                       // return new Symbol(simbolos.Tk_ParA,yycolumn,yyline,yytext());
                        Simbolos sim=new Simbolos(yytext(),"ParA");
                        table_sym.add(sim);
                        }

<YYINITIAL> ")"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, ParC");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"ParC");
                        table_sym.add(sim);
                        }


<YYINITIAL> "+"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, suma+");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"suma");
                        table_sym.add(sim);
                        }

<YYINITIAL> "-"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, menos-");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                        Simbolos sim=new Simbolos(yytext(),"menos");
                        table_sym.add(sim);
                        }
        
        
<YYINITIAL> "/"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, division/");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"division");
                        table_sym.add(sim);
                        }                
                        
<YYINITIAL> "*"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, multilicacion*");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"multiplicacion");
                        table_sym.add(sim);
                        }     

<YYINITIAL> ";"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, punto y coma;");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"punto y coma");
                        table_sym.add(sim);
                        }     

<YYINITIAL> ","     {
                        System.out.println("Reconocido: <<"+yytext()+">>, coma,");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"coma");
                        table_sym.add(sim);
                        }     

<YYINITIAL> "&&"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, AND &&");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"AND");
                        table_sym.add(sim);
                        }     
<YYINITIAL> "||"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, OR ||");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"OR");
                        table_sym.add(sim);
                        }     

<YYINITIAL> "."     {
                        System.out.println("Reconocido: <<"+yytext()+">>, punto .");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"punto");
                        table_sym.add(sim);
                        }     
 <YYINITIAL> "<"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, menor<");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"menor");
                        table_sym.add(sim);
                        }                            
 <YYINITIAL> ">"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, mayor>");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"mayor");
                        table_sym.add(sim);
                        }     
                        
<YYINITIAL> "="     {
                        System.out.println("Reconocido: <<"+yytext()+">>, igual=");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"igual");
                        table_sym.add(sim);
                        }     
                        
<YYINITIAL> "<="     {
                        System.out.println("Reconocido: <<"+yytext()+">>, menor igual <=");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"menor igual");
                        table_sym.add(sim);
                        }     
<YYINITIAL> ">="     {
                        System.out.println("Reconocido: <<"+yytext()+">>, mayor igual >=");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                        Simbolos sim=new Simbolos(yytext(),"mayor igual");
                        table_sym.add(sim);
                        }   
<YYINITIAL> "["     {
                        System.out.println("Reconocido: <<"+yytext()+">>, corchete");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                          Simbolos sim=new Simbolos(yytext(),"corchete");
                        table_sym.add(sim);
                        }                      
<YYINITIAL> "]"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, corchete");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"corchete");
                        table_sym.add(sim);
                        }     
                        
<YYINITIAL> "a++"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, contador a++");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"contador");
                        table_sym.add(sim);
                        }   
                        
<YYINITIAL> "a--"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, contador a--");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"contador");
                        table_sym.add(sim);
                        }   
                        
<YYINITIAL> {idenClass}  {
                        System.out.println("Reconocido: <<"+yytext()+">>, identificador de clase");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"identificador de clase");
                        table_sym.add(sim);
                        }     
                        
<YYINITIAL> "=="     {
                        System.out.println("Reconocido: <<"+yytext()+">>, igual igual ==");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"igual igual");
                        table_sym.add(sim);
                        }   
<YYINITIAL> "idenfunciones"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, idenfunciones");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"idenfunciones");
                        table_sym.add(sim);
                        } 
<YYINITIAL> "idenmetodo"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, idenmetodos");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"idenmetodos");
                        table_sym.add(sim);
                        } 
<YYINITIAL> "salida"     {
                        System.out.println("Reconocido: <<"+yytext()+">>, salida");
                       // return new Symbol(simbolos.Tk_ParC,yycolumn,yyline,yytext());
                         Simbolos sim=new Simbolos(yytext(),"salida");
                        table_sym.add(sim);
                        } 
                        
                          
  
/*Recoleccion de errores*/

.       {
        Tabla_Errores datos =new Tabla_Errores(yytext(), "ERROR LEXICO","Simbolo no existe en el lenguaje", (yyline+1),(yycolumn+1));
        Error_Lex.add(datos);
         System.out.println("Error Lexico: <<"+yytext()+">> ["+yyline+" , "+yycolumn+"]");
         
         }