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

pts1 = pts1(1,:)/M;
pts1 = pts1(2,:)/M;

pts2 = pts2(1,:)/M;
pts2 = pts2(2,:)/M;

U = [pts2(1,:)*pts1(1,:) pts2(1,:)*pts1(2,:) pts2(1,:) pts2(2,:)*pts1(1,:) pts2(2,:)*pts1(2,:) pts1(1,:) pts1(2,:) ones(size(pts1,1),1)];

[U1,S1,V1] = svd(U);

F = V1(:,end);

F = reshape(F,3,3)';

% do svd of F and then make last eigenvalue 0 and multiply everything back.

[U2,S2,V2] = svd(F);

S2(:,end) = zeros(size(S2,1),1);

F = U2*S2*V2';

F = refineF(F,pts1,pts2);

nM = [M 0 0;
      0 M 0;
      0 0 1];
  
F = nM'*F*nM;

% To scale back construct the matrix from the lecture



end

