% Data = V(:, 1:57);
% Data = Data';
% Traindata = [];
% Trainlabel = [];
% Testlabel = [];
% Testdata = [];
% for i = 1: max(gnd)
%     %%%get 5 picture for each person as train data
%     index = find(gnd==i);
%     l = length(index);
%     l_pick = randsample(1:l, 5);
%     index_test = index(l_pick);
%     index_train = setdiff(index, index_test);
%     Testdata = [Testdata, Data(:,index_test)];
%     Testlabel = [Testlabel, gnd(index_test)'];
%     Traindata = [Traindata, Data(:, index_train)];
%     Trainlabel = [Trainlabel, gnd(index_train)'];
% end
%     
% %Gender 
% gendertrainlabel= [];
% for i = 1:length(Trainlabel)
%     B = intersect(Trainlabel(i), [5, 15,22,27, 28, 32, 34, 37]);
%     gendertrainlabel = [gendertrainlabel, size(B, 2)];
% end
% 
% gendertestlabel = [];
% for i = 1: length(Testlabel)
%     B = intersect(Testlabel(i), [5, 15,22,27, 28, 32, 34, 37]);
%     gendertestlabel = [gendertestlabel, size(B,2)];
% end
% 
% 
% 
% % 
% % 
% % 
% % 
% %%Naive Bayes
% Traindata = Traindata';
% Testdata = Testdata';
% % 
%  nb = fitcnb(Traindata, Trainlabel);
%  k = loss(nb, Traindata, Trainlabel);%0.8858
%  k2 = 1- loss(nb, Testdata, Testlabel)%0.81
% 
% nb = fitcnb(Traindata, gendertrainlabel);
% k2 =1-  loss(nb, Testdata, gendertestlabel)%0.8209
% 
% % %%KNN
%  md2 = fitcknn(Traindata, Trainlabel, 'NumNeighbors', 3);
%  k2 = 1- loss(md2, Testdata, Testlabel) %0.868
%  md2 = fitcknn(Traindata, Trainlabel, 'NumNeighbors', 5);
%  k3 = 1- loss(md2, Testdata, Testlabel)%0.879
%  md2 = fitcknn(Traindata, Trainlabel, 'NumNeighbors', 10);
%  k4 = 1- loss(md2, Testdata, Testlabel)%0.858
% md2 = fitcknn(Traindata, gendertrainlabel, 'NumNeighbors', 3);
% k5 = 1- loss(md2, Testdata, gendertestlabel) %0.973
% md2 = fitcknn(Traindata, gendertrainlabel, 'NumNeighbors', 5);
% k6 = 1- loss(md2, Testdata, gendertestlabel) %0.976
% md2 = fitcknn(Traindata, gendertrainlabel, 'NumNeighbors', 10);
% k7 = 1- loss(md2, Testdata, gendertestlabel) %0.973
% %%
% %%%projection
% md3 = classify(Testdata, Traindata, Trainlabel);
% sum((md3 - Testlabel')==0)/ length(md3)%0.79
% md3 = classify(Testdata, Traindata, gendertrainlabel);
% sum((md3 - gendertestlabel')==0)/ length(md3)%0.7789
% %%%Support vector machine
% md4 = fitcecoc(Traindata, Trainlabel);
% k4 = 1- loss(md4, Testdata, Testlabel); %0.5358
% md6 = fitcsvm(Traindata, gendertrainlabel);
% k5 = 1 - loss(md6, Testdata, gendertestlabel)%0.7887
% 
% %%%%
% md5 = fitctree(Traindata, Trainlabel);
% k5 = 1 - loss(md5, Testdata, Testlabel);%52.05
% md7 = fitctree(Traindata, gendertrainlabel);
% k7 = 1- loss(md7, Testdata, gendertestlabel)%8365


%%%%kmeans
% [idx, C] = kmeans(Data', 9);
for i = 1:9
    subplot(3,3,i);
    r = 57;%10 is reasonable quality
    B= U(:, 1:r) * Sigma(1:r, 1:r) *C(i,:)';
     pcolor(flipud(reshape(B, 32, 32))); shading interp
    colormap(gray)
    axis off;
end

