function tip_start_CRF = tip_wrt_CRF(start_markers_CRF,curr_markers_CRF,curr_tip)
% tip_wrt_CRF Finds the location of the tool tip with respect to the start (or initial) co-ordinate reference frame
%             described by start_markers_CRF.
% INPUTS:
%   "start_markers_CRF" - the initial co-ordinate reference frame
%   "curr_markers_CRF"  - the current co-ordinate reference frame
%   "curr_tip"          - the current location of the tool tip
% OUTPUTS:
%   "tip_CRF"           - the location of the tool tip with respect to the start (initial) co-ordinate reference frame

[~,n] = size(start_markers_CRF);
[R,t] = registration(curr_markers_CRF,start_markers_CRF,ones(1,n));
tip_start_CRF = R*curr_tip + t;
end
