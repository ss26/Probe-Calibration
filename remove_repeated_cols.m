function [check,data] = remove_repeated_cols(data)
% remove_repeated_cols  Removes the repeated columns in a dataset
% INPUTS:
%   "data"  - an array of data
% OUTPUTS:
%   "check" - returns 1 if columns were removed, 0 if no columns were removed
%   "data"  - an array of data after repeating columns are removed

% Get size of data
[m,n] = size(data);
nn = n/3;

% Find columns that are repeated and remove one copy of them
for i=1:nn-1:n
    flag = 0;
    for j=1:nn-1:n
        for k=1:m
            if data(k,j) ~= 0
                check = data(k,j);
                index = k;
                break
            end
        end
        if j ~= i
            if check ~= 0
                if check == data(index,i)
                    flag = 1;
                    break;
                else
                    flag = 0;
                end
            end
        end
    end
    if flag == 1
        break
    end
end
if i ~= n-2
    check = true;
    to_remove = i:i+2;
    data(:,to_remove) = [];
    data = data';
else
    check = false;
    data = data';
end
end
