function [ EPat, W ] = QWNNM_PatEstimation( NL_mat, Self_arr, CurPat, Par )
    d = size(CurPat, 3);
    EPat = zeros(size(CurPat));
    W    = zeros(size(CurPat));
    for  i      =  1 : length(Self_arr)                                 % For each keypatch group
        Temp    =   CurPat(:, NL_mat(1:Par.patnum,i),:);                  % Non-local similar patches to the keypatch
        M_Temp  =   repmat(mean( Temp, 2 ),1,Par.patnum);
        Temp    =   Temp-M_Temp;

        [E_Temp, W_Temp] 	=   QWNNM( Temp, Par.c, Par.nSig, M_Temp); % WNNM Estimation
        EPat(:,NL_mat(1:Par.patnum,i),:)  = EPat(:,NL_mat(1:Par.patnum,i),:)+E_Temp;      
        W(:,NL_mat(1:Par.patnum,i),:)     = W(:,NL_mat(1:Par.patnum,i),:)+W_Temp;
    end
end

