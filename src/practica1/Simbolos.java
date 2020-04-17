package practica1;

public class Simbolos {
	public String sim;
	public String tipo;
	
	public Simbolos(String sym,String tipo) {
		this.sim=sym;
		this.tipo=tipo;
	}
	
	public void  Mostrar_Simbolo() {
		System.out.println("Lexema: "+this.sim+" TIpo: "+this.tipo);
	}
}	
