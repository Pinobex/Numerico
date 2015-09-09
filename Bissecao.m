%Sergio Afonso Baptista Junior 7987219 
%Danilo Barbosa Porto 7547142
clc;
clear;
format long;
%Declarando o polinimo como um vetor.
P = [63 -27 53 -27 -10];
A = 0;
B = 1;
E = 10^-6;
%Declarando maximo de iterações possivel como 1000.
MAXITER = 1000;
X0 = A;
SAIDA = [1 2 3 4 5 6]; 
for I = 1:MAXITER
    %verificando se os extremos são raizes
    if polyval(P,A) == 0
        break;
    end
    if polyval(P,B) == 0
        break;      
    end 
    % Caso a multiplicação seja positiva, algo está errado e para de
    % calcular.
    if 0 < polyval(P,A)*polyval(P,B)
        disp('Erro');
        break;
    end
    % Calculando a media entre os dois pontos.
    XK = (A+B)/2;
    %Variavel auxiliar para salvar em um arquivo.
    AUX = [I A B XK polyval(P,XK) abs(XK-X0)];
    SAIDA = [SAIDA;AUX];
    %Verificando se o ponto xk é raiz ou se ele é menor que o erro
    if polyval(P,XK) == 0  || abs(XK-X0) < E*(max(1,XK))
        break;
    end
    
    %Verificando pra qual lado apartir do meio do intervalo a a raiz está.
    if 0 > polyval(P,A)*polyval(P,XK)     
        B=XK;
    end
    if 0 > polyval(P,B)*polyval(P,XK)
        A=XK;
    end
    %caso a raiz nao seja encontrada o x0 vira o xk.
    X0 = XK;
end
if I == 1000
    disp('Maximo de iterações atingido');
end
XK
save bissecao_saida1.dat SAIDA -ascii