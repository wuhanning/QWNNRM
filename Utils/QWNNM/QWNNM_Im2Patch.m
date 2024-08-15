function  Y  =  QWNNM_Im2Patch( E_Img,par )
TotalPatNum = (size(E_Img,1)-par.patsize+1)*(size(E_Img,2)-par.patsize+1);                  %Total Patch Number in the image
Y           =   zeros(par.patsize*par.patsize, TotalPatNum, size(E_Img,3), 'single');                      %Current Patches
k           =   0;

for i  = 1:par.patsize
    for j  = 1:par.patsize
              k     =  k+1;
        E_patch     =  E_Img(i:end-par.patsize+i,j:end-par.patsize+j, :);    
        Y(k,:,:)      =  reshape(E_patch, [1 size(E_patch,1)*size(E_patch,2) 3]);
    end
end