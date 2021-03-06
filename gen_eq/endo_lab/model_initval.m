%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'model_initval';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('model_initval.log');
M_.exo_names = 'junk';
M_.exo_names_tex = 'junk';
M_.exo_names_long = 'junk';
M_.endo_names = 'r';
M_.endo_names_tex = 'r';
M_.endo_names_long = 'r';
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, 'l');
M_.endo_names_long = char(M_.endo_names_long, 'l');
M_.endo_names = char(M_.endo_names, 'etau_l');
M_.endo_names_tex = char(M_.endo_names_tex, 'etau\_l');
M_.endo_names_long = char(M_.endo_names_long, 'etau_l');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_partitions = struct();
M_.param_names = 'cbeta';
M_.param_names_tex = 'cbeta';
M_.param_names_long = 'cbeta';
M_.param_names = char(M_.param_names, 'cdelta');
M_.param_names_tex = char(M_.param_names_tex, 'cdelta');
M_.param_names_long = char(M_.param_names_long, 'cdelta');
M_.param_names = char(M_.param_names, 'calpha');
M_.param_names_tex = char(M_.param_names_tex, 'calpha');
M_.param_names_long = char(M_.param_names_long, 'calpha');
M_.param_names = char(M_.param_names, 'cgamma');
M_.param_names_tex = char(M_.param_names_tex, 'cgamma');
M_.param_names_long = char(M_.param_names_long, 'cgamma');
M_.param_names = char(M_.param_names, 'clambda');
M_.param_names_tex = char(M_.param_names_tex, 'clambda');
M_.param_names_long = char(M_.param_names_long, 'clambda');
M_.param_names = char(M_.param_names, 'csigma');
M_.param_names_tex = char(M_.param_names_tex, 'csigma');
M_.param_names_long = char(M_.param_names_long, 'csigma');
M_.param_names = char(M_.param_names, 'cpsi');
M_.param_names_tex = char(M_.param_names_tex, 'cpsi');
M_.param_names_long = char(M_.param_names_long, 'cpsi');
M_.param_names = char(M_.param_names, 'cnu');
M_.param_names_tex = char(M_.param_names_tex, 'cnu');
M_.param_names_long = char(M_.param_names_long, 'cnu');
M_.param_names = char(M_.param_names, 'cG_0');
M_.param_names_tex = char(M_.param_names_tex, 'cG\_0');
M_.param_names_long = char(M_.param_names_long, 'cG_0');
M_.param_names = char(M_.param_names, 'etau_k');
M_.param_names_tex = char(M_.param_names_tex, 'etau\_k');
M_.param_names_long = char(M_.param_names_long, 'etau_k');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 8;
M_.param_nbr = 10;
M_.orig_endo_nbr = 8;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 0;
erase_compiled_function('model_initval_static');
erase_compiled_function('model_initval_dynamic');
M_.orig_eq_nbr = 8;
M_.eq_nbr = 8;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 2 10;
 0 3 11;
 0 4 0;
 0 5 0;
 1 6 0;
 0 7 0;
 0 8 12;
 0 9 0;]';
M_.nstatic = 4;
M_.nfwrd   = 3;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 1;
M_.ndynamic   = 4;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(8, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(10, 1);
M_.NNZDerivatives = [34; 72; 176];
load params;
load xinit;
load policy;
M_.params( 1 ) = params(1);
cbeta = M_.params( 1 );
M_.params( 2 ) = params(2);
cdelta = M_.params( 2 );
M_.params( 3 ) = params(3);
calpha = M_.params( 3 );
M_.params( 4 ) = params(4);
cgamma = M_.params( 4 );
M_.params( 5 ) = params(5);
clambda = M_.params( 5 );
M_.params( 6 ) = params(6);
csigma = M_.params( 6 );
ctheta = params(7);
M_.params( 8 ) = params(8);
cnu = M_.params( 8 );
M_.params( 7 ) = params(9);
cpsi = M_.params( 7 );
M_.params( 9 ) = params(10);
cG_0 = M_.params( 9 );
M_.params( 10 ) = policy(1);
etau_k = M_.params( 10 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 7 ) = xinit(1);
oo_.steady_state( 6 ) = xinit(2);
oo_.steady_state( 5 ) = xinit(3);
oo_.steady_state( 2 ) = xinit(4);
oo_.steady_state( 1 ) = xinit(5);
oo_.steady_state( 3 ) = xinit(6);
oo_.steady_state( 8 ) = xinit(7);
oo_.steady_state( 4 ) = policy(2);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
resid(1);
oo_.dr.eigval = check(M_,options_,oo_);
options_.k_order_solver = 1;
options_.irf = 0;
options_.order = 3;
var_list_ = char();
info = stoch_simul(var_list_);
save('model_initval_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('model_initval_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('model_initval_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('model_initval_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('model_initval_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('model_initval_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('model_initval_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
disp('Note: 1 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
