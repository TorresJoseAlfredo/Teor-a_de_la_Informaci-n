function [salidas] = F_02_convolucionalUnaEntrada(u,g_x,p)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

%%%%%%%%%%%%%%%%%%%%%%%%
[tg_y, tg_x] = size(g_x);
ct=cell2mat(g_x(1));
n_E=length(ct)-1;%%%
estado=zeros(1,n_E);
u_relleno=[u estado];%%%
salidas=zeros(length(u_relleno),tg_x);
trayectoria_estados=zeros(length(u_relleno),length(estado));



 
       

for i = 1:tg_y
    for j = 1:tg_x
        g=cell2mat(g_x(i,j)) ;

        for i1=1:length(u_relleno)
            for l=length(g):-1:1
                    if l== 1
                        
                       s(l)= u_relleno(i1)*g(l);
                    else
                        
                        s(l)=g(l)*estado(l-1);
                    end
            end
            for j2=n_E:-1:1   
                if j2 == 1
                 estado(j2) = u_relleno(i1);
                else 
                    estado(j2)=estado(j2-1);
                end 
            end 
            trayectoria_estados(i1,:)= estado;
           salidas(i1,j)=mod(sum(s),p);
            
        end 
      
       
    end
end

for i=1:length(u_relleno)
disp([num2str(u_relleno(i)) ' | ' num2str(trayectoria_estados(i,:)) ' | ' num2str(salidas(i,:))])
end 

salidas = reshape(salidas.', 1, []);
end