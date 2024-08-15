function res = qm2erm(varargin)
if nargin == 1
    M = varargin{1};
    type = 'forward';
elseif nargin == 2
    M = varargin{1};
    type = varargin{2};
end
% if strcmp(type, 'forward') == 1
%     res = [M(:,:,1),M(:,:,2),M(:,:,3),M(:,:,4);
%            -M(:,:,2),M(:,:,1),-M(:,:,4),M(:,:,3);
%            -M(:,:,3),M(:,:,4),M(:,:,1),-M(:,:,2);
%            -M(:,:,4),-M(:,:,3),M(:,:,2),M(:,:,1)];
% elseif strcmp(type, 'inverse') == 1
%     [h, w] = size(M);
%     res = zeros(h/4,w/4,4);
%     res(:,:,1) = M(1:h/4,1:w/4);
%     res(:,:,2) = M(1:h/4,1+w/4:w/2);
%     res(:,:,3) = M(1:h/4,1+w/2:3*w/4);
%     res(:,:,4) = M(1:h/4,1+3*w/4:w);
% end
if strcmp(type, 'forward') == 1
   res = [M(:,:,1);
          -M(:,:,2);
          -M(:,:,3);
          -M(:,:,4);
          M(:,:,2);
          M(:,:,1);
          M(:,:,4);
          -M(:,:,3);
          M(:,:,3);
          -M(:,:,4);
          M(:,:,1);
          M(:,:,2);
          M(:,:,4);
          M(:,:,3);
          -M(:,:,2);
          M(:,:,1)];
elseif strcmp(type, 'inverse') == 1
    [h, w] = size(M);
    res = zeros(h/16,w,4);
    res(:,:,1) = M(1:h/16,:);
    res(:,:,2) = -M(h/16+1:h/8,:);
    res(:,:,3) = -M(h/8+1:3*h/16,:);
    res(:,:,4) = -M(3*h/16+1:h/4,:);
end
end