function [salidas] = F_01_imp_convolucional(u,g,p)
%Codigo convolucional individual
%   Detailed explanation goes here

% p=2;
% u=[1 0 1 1];
% g=[0 1 1];

%k=4;
length(u);
% 1  x x^2

s=zeros(1,length(g));
%n_e=1;
n_s=1;

%entradas=zeros(n_e,1);


n_E=length(g)-1;%%%
estado=zeros(1,n_E);%%%
u_relleno=[u estado];%%%
salidas=zeros(length(u_relleno),n_s);
trayectoria_estados=zeros(length(u_relleno),length(estado));

for i=1:length(u_relleno)
    for l=length(g):-1:1
            if l== 1
                
               s(l)= u_relleno(i)*g(l);
            else
                
                s(l)=g(l)*estado(l-1);
            end
    end
    for j=n_E:-1:1   
        if j == 1
         estado(j) = u_relleno(i);
        else 
            estado(j)=estado(j-1);
        end 
    end 
    trayectoria_estados(i,:)= estado;
   salidas(i)=mod(sum(s),p);
    
end 


for i=1:length(u_relleno)
disp([num2str(u_relleno(i)) ' | ' num2str(trayectoria_estados(i,:)) ' | ' num2str(salidas(i,:))])
end 
end