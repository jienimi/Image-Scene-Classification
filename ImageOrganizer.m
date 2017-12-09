%%
% Image Organizer
% 
% Uses existing training labels to copy and sort images
% into their respective folders to help with ML training.
% 
% Tausif S

%% Save Labels to .mat
% picTrainLabels = xlsread('train.csv');
% picTrainLabels = picTrainLabels(:, 2);
% save('picTrainLabels.mat', 'picTrainLabels');

%% Image Organizer: Creates .mat file and categorizes pics if required
trainLabels = xlsread('train.csv');
trainDir = 'D:/CSC_A3/train/';
trainExt = '.jpg';

imgNum = 1;

for i = 1:7000
    if(imgNum < 10)
        imgPre = '0000';
    elseif((imgNum >= 10) && (imgNum < 100))
        imgPre = '000';
    elseif((imgNum >= 100) && (imgNum < 1000))
        imgPre = '00';
    elseif(imgNum >= 1000)
        imgPre = '0';
    end
    
   
        newDir = 'D:/CSC_A3/val_gray/';
        imgNumStr = num2str(imgNum);
        currentImg = strcat('D:/CSC_A3/val/', imgPre, imgNumStr, trainExt);
        tempPic = rgb2gray(imread(currentImg));
        newDirPic = strcat('D:/CSC_A3/val_gray/', imgPre, imgNumStr, trainExt);
        imwrite(tempPic, newDirPic);
    
    imgNum = imgNum + 1;
end

% save('picTrainImages.mat', 'picTrainImages');

