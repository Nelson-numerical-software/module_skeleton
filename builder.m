%=============================================================================
% Copyright (c) 2018-present Allan CORNET (Nelson)
%
% This file is released under the 3-clause BSD license. See COPYING-BSD.
%=============================================================================
MODULE_NAME = 'module_skeleton';
%=============================================================================
if ismodule(MODULE_NAME)
  error(_('Module already loaded.'));
end
%=============================================================================
if ~havecompiler()
  error(_('Please install and configure a C/C++ compiler'));
end
%=============================================================================
fprintf(_('Building ''%s'' dependencies.\n'), MODULE_NAME);
nmm_build_dependencies(fileparts(nfilename('fullpath')));
%=============================================================================
fprintf(_('Building ''%s'' sources.\n'), MODULE_NAME);
run([fileparts(nfilename('fullpath')), '/src/builder.m']);
%=============================================================================
fprintf(_('Building ''%s'' builtin.\n'), MODULE_NAME);
run([fileparts(nfilename('fullpath')), '/builtin/builder.m']);
%=============================================================================
fprintf(_('Building ''%s'' loader.\n'), MODULE_NAME);
nmm_build_loader(MODULE_NAME, fileparts(nfilename('fullpath')));
%=============================================================================
nmm_build_help(MODULE_NAME, fileparts(nfilename('fullpath')));
%=============================================================================
clear('MODULE_NAME');
%=============================================================================