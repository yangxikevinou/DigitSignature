function np = npath(path,L)
% input
% path: dxn arrary
% output
% np: dxn arrary
%
% normalize path so that continuous part of total variation is L
% the last coordinate indicate jumps

% total variation including jumps
np=sum(sqrt(sum(diff(path(1:end-1,:),1,2).^2,1)),2);

% jump part of total variation
jump=path(1:end-1,(path(end,:)==1));
jump=jump(:,2:end-1);
jump=jump(:,1:2:end)-jump(:,2:2:end);
jump=sum(sqrt(sum(jump.^2,1)),2);

% normalize
jump=np-jump;
np=path;
np(1:end-1,:)=np(1:end-1,:)/jump*L;

end