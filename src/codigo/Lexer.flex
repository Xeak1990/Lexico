package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t\r\n]+
%{
    public String lexeme;
%}

%%

"P_R_O_G"     { lexeme = yytext(); return Inicio_Programa; }
"E_N_D"       { lexeme = yytext(); return Fin_Programa; }

"clase"       { lexeme = yytext(); return Palabra_Clase; }
"funcion"     { lexeme = yytext(); return Palabra_Funcion; }

"entero"      { lexeme = yytext(); return Tipo_Entero; }
"decimal"     { lexeme = yytext(); return Tipo_Decimal; }
"cadena"      { lexeme = yytext(); return Tipo_Cadena; }
"booleano"    { lexeme = yytext(); return Tipo_Booleano; }

"si"          { lexeme = yytext(); return Palabra_Si; }
"sino si"     { lexeme = yytext(); return Palabra_Sino_Si; }
"sino"        { lexeme = yytext(); return Palabra_Sino; }

"devolver"    { lexeme = yytext(); return Palabra_Devolver; }

"<=" | ">="   { lexeme = yytext(); return Operador_Relacional; }
"<" | ">"     { lexeme = yytext(); return Operador_Relacional; }

"="           { lexeme = yytext(); return Igual; }
"+"           { lexeme = yytext(); return Operador_Suma; }
"-"           { lexeme = yytext(); return Operador_Resta; }
"*"           { lexeme = yytext(); return Operador_Multiplicacion; }
"/"           { lexeme = yytext(); return Operador_Division; }

"("           { lexeme = yytext(); return Parentesis_Apertura; }
")"           { lexeme = yytext(); return Parentesis_Cierre; }
"{"           { lexeme = yytext(); return Llave_Apertura; }
"}"           { lexeme = yytext(); return Llave_Cierre; }
","           { lexeme = yytext(); return Coma; }
";"           { lexeme = yytext(); return PuntoYComa; }

\"[a-zA-Z0-9_áéíóúÁÉÍÓÚñÑ ]+\" {
    lexeme = yytext();
    return Cadena;
}

{L}({L}|{D})* {
    lexeme = yytext();
    return Identificador;
}

"-"?{D}+ {
    lexeme = yytext();
    return Numero;
}

{espacio} { /* ignorar espacios */ }
"//".*     { /* ignorar comentarios */ }

. {
    lexeme = yytext();
    return ERROR;
}
