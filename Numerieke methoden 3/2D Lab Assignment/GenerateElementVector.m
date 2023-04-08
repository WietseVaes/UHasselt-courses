% Module for element mass matrix for reactive term
%
% Output: felem  ====== vector of two components
%
% felem(1), felem(2) to be computed in this routine.

clear felem

combinations = {[1,2] , [1,3], [2,3]};
for index1 = 1:3
    points = combinations{index1};
    for index2 = 1:length(wells)
        Delta_wells(index1,index2) = abs(det([1 xc(points(1)) yc(points(1));1 xc(points(2)) yc(points(2));1 wells(index2,1) wells(index2,2)])/2); 
    end
end
Sum_Delta_W = sum(Delta_wells)';

if all(Sum_Delta_W >= Delta + eps)
    for index1 = 1:topology
        global_index = elmat(i,index1);
        felem(index1) = 0;
    end
else
    felem = zeros(topology,1);
    points = wells(Sum_Delta_W < Delta + eps,:);
    for index1 = 1:size(points,1)
        felem = felem + ([1 points(index1, 1), points(index1, 2)] * B_mat)';
    end
    felem = -extract_rate*felem;
end