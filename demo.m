% large demo
load digit_tra; load digit_tes; load char_ds;
ds=char_ds(isstrprop(char_ds.char,'digit'),:);

% compute signature
N=10; % degree of tensors
L=20; % normalization factor
trun=@(y)y(1:end-1,:);
tra=cell2mat(cellfun(@(x)sig(trun(npath(x,L)),N)',digit_tra.path,'UniformOutput',false));
tes=cell2mat(cellfun(@(x)sig(trun(npath(x,L)),N)',digit_tes.path,'UniformOutput',false));
X=cell2mat(cellfun(@(x)sig(trun(npath(x,L)),N)',ds.path,'UniformOutput',false));

% visualization (general and pathological)
c='0';
temp=ds(ds.char==c,:);
hold on;
for i=1:4
    plot(temp.path{i}(1,:),temp.path{i}(2,:));
end
hold off;

for i=1:10
    clf;writedigit(digit_tes.path{i},0.1);pause(0.1);
end

clf;writedigit(digit_tes.path{100},0.1);pause(0.1);

c='1';
temp=ds(ds.char==c,:);
for i=1:4
    clf;writedigit(temp.path{i},0.1);pause(0.1);
end

% experimental classification
for ord=2.^([10,6:-1:3]+1)-1
    Mdl=fitcdiscr(tra(:,2:ord),digit_tra.char);
    cl=predict(Mdl,tes(:,2:ord));
    disp([{'order'},{'resub error'},{'test error'};{round(log2(ord))-1},{resubLoss(Mdl)},{mean(cl~=digit_tes.char)}]);
    disp([[{'true\pred'};num2cell(0:9)'],num2cell([0:9;confusionmat(digit_tes.char,cl)])]);
end