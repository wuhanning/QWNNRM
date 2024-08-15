function  [par]=QWNNM_ParSet(nSig)
par.nSig      =   nSig;                                 % Variance of the noise image
par.SearchWin =   10;                                   % Non-local patch searching window
par.c         =   0.1;                           % Constant num for the weight vector
par.patsize       =   7;                            % Patch size
par.patnum        =   30;                           % Initial Non-local Patch number
par.Iter          =   1;                            % total iter numbers
par.step      =   floor(par.patsize-1);                 
% Blockmatching and perform WNNM algorithm on all the patches in the image
% is time consuming, we just perform the blockmatching and WNNM on parts of
% patches in the image (we call these patches keypatch in explanatory notes)
% par.step is the step between each keypatch, smaller step will further
% improve the denoisng result