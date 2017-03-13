function sig = sig(path,N)
% input
% path: dxn arrary
% N: natural number (may be zero), degree
% output
% sig: 1+d+d^2+...+d^N column vector, in each grade permutation of words in
% increasing order
%
% return the N-th degree truncated signature of path


% differential
path=diff(path,1,2);

% initialize
[d,D]=size(path);
pre=ones(1,D);
sig=1;
D=1;

for i=1:N
    pre=cumsum(repmat(pre,[d,1]).*kron(path,ones(D,1)),2);
    D=D*d;
    sig=[sig;pre(:,end)];
end

end