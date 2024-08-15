function  [X, W] =  QWNNM( Y, C, NSig, m)
    n = size(Y,1);
    tempY = Y;
    Y = zeros(size(Y,1),size(Y,2),4);
    Y(1:n,:,2:4) = tempY;
%     Y = qexpand(Y,Dx1,Dy1);
    rY = qm2erm(Y);
    [U,SigmaY,V] =   svd(full(rY),'econ');    
    PatNum       = size(Y,2);
    TempC  = C*sqrt(PatNum)*2*NSig^2;
    [SigmaX,svp] = ClosedQWNNM(SigmaY,TempC,eps);  
    rX =  U(:,1:svp)*diag(SigmaX)*V(:,1:svp)';     
    X = qm2erm(rX,'inverse');
    X = X(1:n,:,2:4);
    X = real(X)+m;
    
    if svp==size(Y,1)
        wei = 1/size(Y,1);
    else
        wei = (size(Y,1)-svp)/size(Y,1);
    end
    W = wei*ones(size(X));
    X = X.*wei;
return;
