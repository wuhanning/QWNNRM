function [SigmaX,svp]=ClosedQWNNM(SigmaY,C,oureps)
if size(SigmaY,1)~=1 && size(SigmaY,2)~=1
    SigmaY = diag(SigmaY);
end
temp=(SigmaY-oureps).^2-4*(C-oureps*SigmaY);
ind=find (temp>0);
svp=length(ind);
SigmaX=max(SigmaY(ind)-oureps+sqrt(temp(ind)),0)/2;
end