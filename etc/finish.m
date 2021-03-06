%=============================================================================
% Copyright (c) 2018-present Allan CORNET (Nelson)
%
% This file is released under the 3-clause BSD license. See COPYING-BSD.
%=============================================================================
% remove C/C++ gateway
MODULE_NAME = 'module_skeleton';
removegateway([fileparts(nfilename('fullpath')), '/../builtin/', [MODULE_NAME, '_builtin'], getdynlibext()]);
%=============================================================================
% remove C/C++ code associated to the previous gateway
run([fileparts(nfilename('fullpath')), '/../src/unloader.m']);
%=============================================================================
% remove macros
rmpath([fileparts(nfilename('fullpath')), '/../functions']);
%=============================================================================
clear('MODULE_NAME');
%=============================================================================