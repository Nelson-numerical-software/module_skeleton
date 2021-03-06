%=============================================================================
% Copyright (c) 2018-present Allan CORNET (Nelson)
%
% This file is released under the 3-clause BSD license. See COPYING-BSD.
%=============================================================================
currentpath = fileparts(nfilename('fullpathext'));
dlgeneratecleaner(currentpath);
dlgenerategateway([currentpath, '/cpp/'], 'module_skeleton', {{'cpp_sum', 1, 2}})
[status, message] = dlgeneratemake(currentpath, ...
        [MODULE_NAME, '_builtin'], ...
        {[currentpath, '/cpp/cpp_sumBuiltin.cpp'], [currentpath, '/cpp/Gateway.cpp']}, ...
         [{[currentpath, '/include']; [currentpath, '/../src/include']}; dlgetnelsonincludes()], ...
         [], ...
         [dlgetnelsonlibraries(); [currentpath, '/../src/', MODULE_NAME]]);
if ~status
  error(message);
end
dlgenerateloader(currentpath, 'module_skeleton');
dlgenerateunloader(currentpath, 'module_skeleton');
[status, message] = dlmake(currentpath);
if ~status
  error(message);
end
%=============================================================================
clear('status');
clear('message');
clear('currentpath');
%=============================================================================
