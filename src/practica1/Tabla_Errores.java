package practica1;

public class Tabla_Errores {
	

	     String lexema,tipo,descripcion;
	    int line,columna;
	    
	    public Tabla_Errores(String le,String tipo,String des,int lin,int col){
	        this.lexema=le;
	        this.tipo=tipo;
	        this.descripcion=des;
	        this.line=lin;
	        this.columna=col;
	    
	    }
	    
	    public void VerInformacion() {
	    	System.out.println("Error: "+this.lexema+" Tipo: "+this.tipo);
	    
	    }
	    
	    	
  

	    public String getLexema() {
	        return lexema;
	    }

	    public String getTipo() {
	        return tipo;
	    }

	    public String getDescripcion() {
	        return descripcion;
	    }

	    public int getLine() {
	        return line;
	    }

	    public int getColumna() {
	        return columna;
	    
	    }
	    
	    
}

