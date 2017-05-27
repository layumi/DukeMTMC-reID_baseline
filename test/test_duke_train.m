%netStruct = load('../data/resnet52_2stream_drop0.9_baseline_batch32_duke_gan24000/net-epoch-60.mat') ;
netStruct = load('../data/res52_drop0.75_duke_batch32_baseline/net-epoch-50.mat');
net = dagnn.DagNN.loadobj(netStruct.net) ;
net.addLayer('lrn_test',dagnn.LRN('param',[4096,0,1,0.5]),{'pool5'},{'pool5n'},{});
net.mode = 'test' ;
net.move('gpu') ;
net.conserveMemory = true;
im_mean = net.meta(1).normalization.averageImage;
%im_mean = imresize(im_mean,[224,224]);
p = dir('/data/uts521/zzd/DukeMTMC/bounding_box_train/*jpg');
ff = [];
%%------------------------------
for i = 1:200:numel(p)
    disp(i);
    oim = [];
    for j=1:min(200,numel(p)-i+1)
        str = strcat('/data/uts521/zzd/DukeMTMC/bounding_box_train/',p(i+j-1).name);
        imt = imresize(imread(str),[256,256]);
        oim = cat(4,oim,imt);
    end
    f = getFeature2(net,oim,im_mean,'data','pool5n');
    f = sum(sum(f,1),2);
    f2 = getFeature2(net,fliplr(oim),im_mean,'data','pool5n');
    f2 = sum(sum(f2,1),2);
    f = f+f2;
    size4 = size(f,4);
    f = reshape(f,[],size4)';
    s = sqrt(sum(f.^2,2));
    dim = size(f,2);
    s = repmat(s,1,dim);
    f = f./s;
    ff = cat(1,ff,f);
end
file_name = [{p.name}];
save('resnet_train.mat','ff','file_name','-v7.3');

