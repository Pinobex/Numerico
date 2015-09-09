%Sergio Afonso Baptista Junior 7987219 
%Danilo Barbosa Porto 7547142
clc;
clear;
%Declarando o polinimo como um vetor.
P = [63 -27 53 -27 -10];
DP = polyder(P);
%A função polyder() resulta na derivada do poliniomio.
MAXITER = 1000;
E = 10^-6;
XA = 1;
SAIDA = [1 2 3 4 5];
for I = 1:MAXITER
    %Calculando xk a partir da formula.
    XK = XA - (polyval(P,XA)/(polyval(DP,XA)));
    %Variavel auxiliar para salvar em um arquivo.
    AUX = [I XK polyval(P,XK) polyval(DP,XK) abs(XK-XA)];
    SAIDA = [SAIDA;AUX];
    %Verificando se o erro é menor que o requisito.
    %se for sai do loop com a raiz.
    if E*max(1,XK) > abs(XK-XA)
        break
    end
    %Caso não seja encontrado a raiz, o XAnterior recebe o XK.
    XA=XK;
end
if I == 1000
    disp('maximo de iterações atingido');
end
XK
save newton_saida1.dat SAIDA -ascii
