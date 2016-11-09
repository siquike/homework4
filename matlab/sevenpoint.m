function [ F ] = sevenpoint( pts1, pts2, M )
% sevenpoint:
%   pts1 - Nx2 matrix of (x,y) coordinates
%   pts2 - Nx2 matrix of (x,y) coordinates
%   M    - max (imwidth, imheight)

% Q2.2 - Todo:
%     Implement the eightpoint algorithm
%     Generate a matrix F from some '../data/some_corresp.mat'
%     Save recovered F (either 1 or 3 in cell), M, pts1, pts2 to q2_2.mat

%     Write recovered F and display the output of displayEpipolarF in your writeup
% hpts1 = [pts1 ones(size(pts1,1),1)];
% hpts2 = [pts2 ones(size(pts2,1),1)];

% norm1 = repmat(sqrt(sum(abs(pts1).^2,2)),1,2);
% norm2 = repmat(sqrt(sum(abs(pts2).^2,2)),1,2);
% 
% pts1 = pts1./norm1;
% pts2 = pts2./norm2;

pts1 = pts1(1,:)/M(2);
pts1 = pts1(2,:)/M(1);

pts2 = pts2(1,:)/M(2);
pts2 = pts2(2,:)/M(1);

U = [pts2(1,:)*pts1(1,:) pts2(1,:)*pts1(2,:) pts2(1,:) pts2(2,:)*pts1(1,:) pts2(2,:)*pts1(2,:) pts1(1,:) pts1(2,:) ones(size(pts1,1),1)];

[~,~,V] = svd(U);

F = V(:,end);

F = reshape(F,3,3)';

end

