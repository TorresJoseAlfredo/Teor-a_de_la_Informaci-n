function [matsuma,matresta,matmult,matdiv] = F_00_matGF(p)

%Creamos A
vec=[0:p];
tamvec=length(vec);
indices=[];

%Creamos un vector de Indices
for k=1:p 
indices=[indices vec];
end

%Matriz de Suma
matsuma=zeros(tamvec,tamvec);
for i=1:tamvec
    matsuma(i,:)=circshift(vec,-i+1);
end 
 
%Matriz de Resta
vecn=[p:-1:0];
matresta=zeros(tamvec,tamvec);
for i=1:tamvec
    matresta(i,:)=circshift(vecn,i);
end 

%Matriz de multiplicación
matmult=zeros(tamvec,tamvec);
for i=1:tamvec
    for j=1:tamvec
        indice= (vec(i)*vec(j))+1;
        matmult(i,j)=indices(indice);
    end 
end 

%Matriz de división
matdiv=zeros(tamvec,tamvec);
for i=1:tamvec
    for j=1:tamvec
        div= find(matmult(j,:)==i-1);
        tamdiv=length(div);
        if tamdiv > 1 || tamdiv == 0
            matdiv(i,j)= NaN;
        else
            matdiv(i,j)= div-1;
        end 
    end 
end 


end