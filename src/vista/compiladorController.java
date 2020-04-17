package vista;

import java.io.IOException;
import java.io.StringReader;
import java.util.LinkedList;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TextArea;
import practica1.Analizador_Lexico;
import practica1.Simbolos;
import practica1.Tabla_Errores;
import javafx.event.ActionEvent;

public class compiladorController {
	
	@FXML
	private Button btnAnalizador;
	
	  @FXML
	    private TextArea texto_area;
	  
		 @FXML
	 	    private TableColumn<?, ?> Tabla_error;
			

	  @FXML
	    private TableColumn<?, ?> Tabla_simbolo;
	  
	  @FXML
	    void tipo(ActionEvent event) {

	    }

	    @FXML
	    void definicion(ActionEvent event) {

	    }

	// Event Listener on Button[#btnAnalizador].onAction
	@FXML
	public void click(ActionEvent event) {
		//vamos a obtener el contenido
    	String salida=texto_area.getText();
    	System.out.println(texto_area.getText());
    	
    	 Analizador_Lexico lexico;
    	 
       lexico=new Analizador_Lexico((new StringReader(salida)));
       try {
			lexico.yylex();
			LinkedList<Tabla_Errores> error_le=lexico.Le;
			LinkedList<Simbolos> sim=lexico.table_sym;
			
			Ver_Error(error_le);
			Ver_Simbolos(sim);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
    	
	  }

    public  void Ver_Error(LinkedList<Tabla_Errores> E_lex) {
		for(Tabla_Errores tb:E_lex){
            tb.VerInformacion();
            
     
        }
	}
	
	public  void Ver_Simbolos(LinkedList<Simbolos> sym) {
		for(Simbolos tb:sym){
            tb.Mostrar_Simbolo();
        }
	
     }
	

    }
		
	






