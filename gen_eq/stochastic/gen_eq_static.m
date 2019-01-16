function [residual, g1, g2, g3] = gen_eq_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 5, 1);

%
% Model equations
%

T35 = params(3)^2;
T38 = y(3)^params(3);
lhs =1/y(1)*params(1)*(1+y(5)*(1-x(1))-params(2));
rhs =(1+y(4))/y(1);
residual(1)= lhs-rhs;
lhs =y(2);
rhs =y(1)+(1+y(4))*y(3)-y(3)*(1-params(2));
residual(2)= lhs-rhs;
lhs =y(5);
rhs =y(3)^(params(3)-1)*T35;
residual(3)= lhs-rhs;
lhs =y(2);
rhs =T38;
residual(4)= lhs-rhs;
lhs =y(4);
rhs =(params(4)-1)*params(5)*(T38*(params(3)-1)*params(5)*params(6))^(params(6)/(1-params(6)));
residual(5)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(5, 5);

  %
  % Jacobian matrix
  %

T65 = getPowerDeriv(y(3),params(3),1);
  g1(1,1)=(1+y(5)*(1-x(1))-params(2))*params(1)*(-1)/(y(1)*y(1))-(-(1+y(4)))/(y(1)*y(1));
  g1(1,4)=(-(1/y(1)));
  g1(1,5)=1/y(1)*params(1)*(1-x(1));
  g1(2,1)=(-1);
  g1(2,2)=1;
  g1(2,3)=(-(1+y(4)-(1-params(2))));
  g1(2,4)=(-y(3));
  g1(3,3)=(-(T35*getPowerDeriv(y(3),params(3)-1,1)));
  g1(3,5)=1;
  g1(4,2)=1;
  g1(4,3)=(-T65);
  g1(5,3)=(-((params(4)-1)*params(5)*(params(3)-1)*params(5)*params(6)*T65*getPowerDeriv(T38*(params(3)-1)*params(5)*params(6),params(6)/(1-params(6)),1)));
  g1(5,4)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],5,25);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],5,125);
end
end
end
end