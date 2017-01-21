function F=writedigit(digit,varargin)
% input
% digit: 3 x n array, pendigit data in order, indicator of jump in 3rd dim
% t: optional, nonnegative real, t between frame, default 0.01
% output
% F
% movie frame


% retrieve time between frame
if numel(varargin)==1
    t=varargin{1};
else
    t=0.01;
end

% positioning axis
m=min(digit(1:2,:),[],2);
M=max(digit(1:2,:),[],2);
c=(m+M)/2; r=0.53*max(M-m);
axis(reshape([c-r,c+r]',1,4));

hold on;
% set movie frame
m=size(digit,2);
F(m)=struct('cdata',[],'colormap',[]);
for k=1:m-1
    % check jumps and set pen-down pen-up marks
    if digit(3,k)~=0
        if digit(3,k+1)==0
            plot(digit(1,k),digit(2,k),'gv','MarkerFaceColor','g');
            h=animatedline;
        else
            plot(digit(1,k),digit(2,k),'r^','MarkerFaceColor','r');
        end
    else % continuous part
        addpoints(h,digit(1,k),digit(2,k));
    end    
    pause(t);
    drawnow;
    F(k)=getframe;
end

% final pen-up mark
plot(digit(1,m),digit(2,m),'r^','MarkerFaceColor','r');
F(m)=getframe;

hold off;

end