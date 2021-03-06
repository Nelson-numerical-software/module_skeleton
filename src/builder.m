%=============================================================================
% Copyright (c) 2018-present Allan CORNET (Nelson)
%
% This file is released under the 3-clause BSD license. See COPYING-BSD.
%=============================================================================
currentpath = fileparts(nfilename('fullpathext'));
[status, message] = dlgeneratemake(currentpath, ...
        MODULE_NAME, ...
        [currentpath, '/cpp/cpp_sum.cpp'], ...
        [currentpath, '/include']);
if ~status
  error(message);
end
dlgeneratecleaner(currentpath);
dlgenerateloader(currentpath, MODULE_NAME);
dlgenerateunloader(currentpath, MODULE_NAME);
%=============================================================================
[status, message] = dlmake(currentpath);
if ~status
  error(message);
end
%=============================================================================
clear('status');
clear('message');
clear('currentpath');
%=============================================================================
