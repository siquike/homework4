function [ F ] = eightpoint( pts1, pts2, M )
% eightpoint:
%   pts1 - Nx2 matrix of (x,y) coordinates
%   pts2 - Nx2 matrix of (x,y) coordinates
%   M    - max (imwidth, imheight)

% Q2.1 - Todo:
%     Implement the eightpoint algorithm
%     Generate a matrix F from some '../data/some_corresp.mat'
%     Save F, M, pts1, pts2 to q2_1.mat

%     Write F and display the output of displayEpipolarF in your writeup
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

F = refineF(F,pts1,pts2);

end

