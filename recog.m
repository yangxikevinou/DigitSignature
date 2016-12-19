load digit_tra;

% compute signature
N=10; % degree of tensors
L=20; % normalization factor
trun=@(y)y(1:end-1,:);
tra=cell2mat(cellfun(@(x)sig(trun(npath(x,L)),N)',digit_tra.path,'UniformOutput',false));

% feature set
fs1 = 2:(2^7-1);

classf = @(xtrain,ytrain,xtest,ytest) ...
             sum(ytest~=classify(xtest,xtrain,ytrain,'linear'));

% training

% kfold
tenfoldCVP = cvpartition(digit_tra.char,'kfold',10);
[fsCVfor30,historyCV] = sequentialfs(classf,tra(:,fs1),digit_tra.char,...
    'cv',tenfoldCVP,'Nf',30);

% resubstitution
[fsResubfor30,historyResub] = sequentialfs(classf,tra(:,fs1),...
     digit_tra.char,'cv','resubstitution','Nf',30);

% analysis by plots
plot(historyCV.Crit,'o');
xlabel('Number of Features');
ylabel('CV MCE');
title('Forward Sequential Feature Selection with cross-validation');

plot(1:30, historyCV.Crit,'bo',1:30, historyResub.Crit,'r^');
xlabel('Number of Features');
ylabel('MCE');
legend({'10-fold CV MCE' 'Resubstitution MCE'},'location','NE');

[orderCV,ignore] = find( [historyCV.In(1,:); diff(historyCV.In(1:30,:) )]');
disp(fs1(orderCV));

[orderResub,ignore] = find( [historyResub.In(1,:); diff(historyResub.In(1:30,:) )]');
disp(fs1(orderResub));

% test dataset
load digit_tes;
tes=cell2mat(cellfun(@(x)sig(trun(npath(x,L)),N)',digit_tes.path,'UniformOutput',false));

nCV=30;
nResub=30;
testMCECVfor30 = classf(tra(:,fs1(orderCV(1:nCV))),digit_tra.char,tes(:,fs1(orderCV(1:nCV))),digit_tes.char)/numel(digit_tes.char);
testMCEResubfor30 = classf(tra(:,fs1(orderResub(1:nResub))),digit_tra.char,tes(:,fs1(orderResub(1:nResub))),digit_tes.char)/numel(digit_tes.char);
testFirst30 = classf(tra(:,fs1(1:30)),digit_tra.char,tes(:,fs1(1:30)),digit_tes.char)/numel(digit_tes.char);