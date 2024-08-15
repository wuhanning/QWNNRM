function E_Img = QWNNM_DeNoising(N_Img, Par)
E_Img           = N_Img;                                                        % Estimated Image
[Height, Width, Depth]  = size(E_Img);   


[Neighbor_arr, Num_arr, Self_arr] =	QWNNM_NeighborIndex(N_Img, Par);                  % PreCompute the all the patch index in the searching window 
            NL_mat              =   zeros(Par.patnum,length(Num_arr));          % NL Patch index matrix     
      
for iter = 1 : Par.Iter        
    CurPat 	=	QWNNM_Im2Patch( E_Img, Par );                      % image to patch and estimate local noise variance            
    Par.patnum = max(Par.patnum-10,10);                                             % Lower Noise level, less NL patches
    NL_mat  =  QWNNM_Block_matching(CurPat, Par, Neighbor_arr, Num_arr, Self_arr);% Caculate Non-local similar patches for each     
    [EPat, W]  =  QWNNM_PatEstimation( NL_mat, Self_arr, CurPat, Par );   % Estimate all the patches
    E_Img      =  QWNNM_Patch2Im( EPat, W, Par.patsize, Height, Width, Depth );             
end
end