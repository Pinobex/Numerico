%Sergio Afonso Baptista Junior 7987219 
%Danilo Barbosa Porto 7547142
clc;
clear;
%declarando o polinimio como um vetor.
P = [63 -27 53 -27 -10];
A=0;
B=1;
E=10^-6;
MAXITER = 1000;
SAIDA = [1 2 3 4]; 
for I = 2:MAXITER
    %Calculando xk a partir da formula.
    XK = (polyval(P,B)*A-polyval(P,A)*B)/(polyval(P,B)-polyval(P,A));
    %Variaveis auxilires para salvar no arquivo.
    AUX = [I XK polyval(P,XK) abs(XK-B)];
    SAIDA = [SAIDA;AUX];
    %verificando se o erro é menor que o requiitado.
    if E*max(1,XK) > abs(XK-B)
        break
    end
    %caso não seja encontrado o valor proximo passa para o anterior
    A=B;
    B=XK;
end
if I == 1000
    disp('maximo de iterações atingido');
end
save secante_saida1.dat SAIDA -ascii
XK