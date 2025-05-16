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
int |
if |
else |
entero |
while {
    lexeme = yytext();
    return Reservadas;
}

{espacio} { /* ignore */ }
"//".* { /* ignore */ }

"=" { lexeme = yytext(); return Igual; }
"+" { lexeme = yytext(); return Suma; }
"-" { lexeme = yytext(); return Resta; }
"*" { lexeme = yytext(); return Multiplicacion; }
"/" { lexeme = yytext(); return Division; }
";" { lexeme = yytext(); return PuntoComa; }

{L}({L}|{D})* {
    lexeme = yytext();
    return Identificador;
}

("(-"{D}+")")|{D}+ {
    lexeme = yytext();
    return Numero;
}

. {
    lexeme = yytext();
    return ERROR;
}
