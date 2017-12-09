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
    
    
%   Use this to create .mat file of image data in grayscale    
%     imgNumStr = num2str(imgNum);
%     currentImg = strcat(trainDir, imgPre, imgNumStr, trainExt);
%     picTrainImages(:,:,i) = rgb2gray(imread(currentImg));
    
%   Use this to copy files into categorized folders if required
%     if(trainLabels(i, 2) == 1)
%         newDir = 'D:/CSC_A3/train_cat_gray/1_structures/';
%         imgNumStr = num2str(imgNum);
%         currentImg = strcat(trainDir, imgPre, imgNumStr, trainExt);
%         %copyfile(currentImg, newDir);
%         tempPic = rgb2gray(imread(currentImg));
%         newDirPic = strcat(newDir, imgPre, imgNumStr, trainExt);
%         imwrite(tempPic, newDirPic);
        
%     elseif(trainLabels(i, 2) == 2)
%         newDir = 'D:/CSC_A3/train_cat_gray/2_indoor/';
%         imgNumStr = num2str(imgNum);
%         currentImg = strcat(trainDir, imgPre, imgNumStr, trainExt);
%         %copyfile(currentImg, newDir);
%         tempPic = rgb2gray(imread(currentImg));
%         newDirPic = strcat(newDir, imgPre, imgNumStr, trainExt);
%         imwrite(tempPic, newDirPic);
%         
%     elseif(trainLabels(i, 2) == 3)
%         newDir = 'D:/CSC_A3/train_cat_gray/3_people/';
%         imgNumStr = num2str(imgNum);
%         currentImg = strcat(trainDir, imgPre, imgNumStr, trainExt);
%         %copyfile(currentImg, newDir);
%         tempPic = rgb2gray(imread(currentImg));
%         newDirPic = strcat(newDir, imgPre, imgNumStr, trainExt);
%         imwrite(tempPic, newDirPic);
%         
%     elseif(trainLabels(i, 2) == 4)
%         newDir = 'D:/CSC_A3/train_cat_gray/4_animals/';
%         imgNumStr = num2str(imgNum);
%         currentImg = strcat(trainDir, imgPre, imgNumStr, trainExt);
%         %copyfile(currentImg, newDir);
%         tempPic = rgb2gray(imread(currentImg));
%         newDirPic = strcat(newDir, imgPre, imgNumStr, trainExt);
%         imwrite(tempPic, newDirPic);
%         
%     elseif(trainLabels(i, 2) == 5)
%         newDir = 'D:/CSC_A3/train_cat_gray/5_plant_life/';
%         imgNumStr = num2str(imgNum);
%         currentImg = strcat(trainDir, imgPre, imgNumStr, trainExt);
%         %copyfile(currentImg, newDir);
%         tempPic = rgb2gray(imread(currentImg));
%         newDirPic = strcat(newDir, imgPre, imgNumStr, trainExt);
%         imwrite(tempPic, newDirPic);
%         
%     elseif(trainLabels(i, 2) == 6)
%         newDir = 'D:/CSC_A3/train_cat_gray/6_food/';
%         imgNumStr = num2str(imgNum);
%         currentImg = strcat(trainDir, imgPre, imgNumStr, trainExt);
%         %copyfile(currentImg, newDir);
%         tempPic = rgb2gray(imread(currentImg));
%         newDirPic = strcat(newDir, imgPre, imgNumStr, trainExt);
%         imwrite(tempPic, newDirPic);
%         
%     elseif(trainLabels(i, 2) == 7)
%         newDir = 'D:/CSC_A3/train_cat_gray/7_car/';
%         imgNumStr = num2str(imgNum);
%         currentImg = strcat(trainDir, imgPre, imgNumStr, trainExt);
%         %copyfile(currentImg, newDir);
%         tempPic = rgb2gray(imread(currentImg));
%         newDirPic = strcat(newDir, imgPre, imgNumStr, trainExt);
%         imwrite(tempPic, newDirPic);
%         
%     elseif(trainLabels(i, 2) == 8)
%         newDir = 'D:/CSC_A3/train_cat_gray/8_sea/';
%         imgNumStr = num2str(imgNum);
%         currentImg = strcat(trainDir, imgPre, imgNumStr, trainExt);
%         %copyfile(currentImg, newDir);
%         tempPic = rgb2gray(imread(currentImg));
%         newDirPic = strcat(newDir, imgPre, imgNumStr, trainExt);
%         imwrite(tempPic, newDirPic);
%     end
%     
    imgNum = imgNum + 1;
end

% save('picTrainImages.mat', 'picTrainImages');

