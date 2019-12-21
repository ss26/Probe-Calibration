function current_tip = currenttip(tip,markers,current_markers)
% currenttip  Finds the location of the tip currently, used for tracking purposes.
% INPUTS:
%   "tip"             - location of the tip after probe calibration is performed
%   "markers"         - location of the markers after probe calibration is performed
%   "current_markers" - location of the current markers
% OUTPUTS:
%   "current_tip"     - location of the current tip

[~,n] = size(markers);
[R,t,~] = registration(markers,current_markers,ones(1,n));
current_tip = R*tip + t;
end
