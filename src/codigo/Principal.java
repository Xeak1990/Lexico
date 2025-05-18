package codigo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.IOException;

public class Principal {
    public static void main(String[] args) {
        System.out.println("Escribe el texto a analizar. Escribe 'exit' para salir.");
        try (BufferedReader br = new BufferedReader(new InputStreamReader(System.in))) {
            StringBuilder texto = new StringBuilder();
            String linea;

            while (true) {
                linea = br.readLine();
                if (linea == null || linea.equalsIgnoreCase("exit")) break;
                texto.append(linea).append("\n");
            }

            // Crear el analizador léxico
            Lexer lexer = new Lexer(new StringReader(texto.toString()));

            Tokens token;
            int contador = 1;
            while ((token = lexer.yylex()) != null) {
                System.out.println("Token " + contador + ": " + lexer.lexeme + " = " + token);
                contador++;
            }

        } catch (IOException e) {
            System.err.println("Error al leer desde la terminal: " + e.getMessage());
        }
    }
}
