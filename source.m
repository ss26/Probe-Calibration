% This is used to call probecalibration function to calibrate a probe's tip
% The inputs passed are data and weights
% Pass the dataset as a .txt file to the variable 'data'
% Any repeated columns of coordinate points are removed

clear all;

% Getting dataset
data = readtable('dataset.txt');
data = table2array(data);
[~,n] = size(data);
data = data(:,3:n); % first two columns are unnecessary (SI number and time)
[~,data] = remove_repeated_cols(data);

% Calculate nfids and create a weights vector. Change this weights vector
% if necessary. 
[m,n] = size(data);
nfids = m/3;
weights=ones(1,nfids);

% Call probecalibration
[tip,markers,tiperror,FLE] = probecalibration(data,weights);

% Additionally, find the current tip given current marker locations and its
% deviation from the calculated tip
current_markers = [data(1:3,40),data(4:6,40),data(7:9,40)]; % example rows and columns used
currtip = currenttip(tip,markers,current_markers);
dev_tip_currtip = tip-currtip;
