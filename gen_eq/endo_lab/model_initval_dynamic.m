function [residual, g1, g2, g3] = model_initval_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(8, 1);
T44 = params(3)^2;
T59 = (params(3)-1)*params(5)*params(6);
T63 = params(6)/(1-params(6));
T71 = params(7)*y(4)^params(8);
T73 = T71/y(9);
T208 = 1/(1+y(3));
T213 = y(1)*T208/y(4);
T214 = T208*T213;
T219 = (y(4)*T208)^(1-params(3));
T220 = (y(1)*T208)^params(3);
T224 = T59*T214^params(3);
T229 = (1-params(3))*T208^(1-params(3));
T230 = T213^params(3);
lhs =(1+y(10)*(1-params(10))-params(2))*params(1)*1/(y(12)*(1+y(11)));
rhs =(1+y(11))/y(8);
residual(1)= lhs-rhs;
lhs =y(7);
rhs =y(8)+y(6)-(1-params(2))*y(1)*T208;
residual(2)= lhs-rhs;
lhs =y(2);
rhs =T44*T214^(params(3)-1);
residual(3)= lhs-rhs;
lhs =y(7);
rhs =T219*T220;
residual(4)= lhs-rhs;
lhs =y(3);
rhs =(params(4)-1)*params(5)*T224^T63;
residual(5)= lhs-rhs;
lhs =1/y(8);
rhs =T73*(1-y(5));
residual(6)= lhs-rhs;
lhs =y(9);
rhs =T229*T230;
residual(7)= lhs-rhs;
lhs =params(9);
rhs =y(9)*y(4)*y(5)+y(2)*params(10)*y(1)*T208;
residual(8)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(8, 13);

  %
  % Jacobian matrix
  %

T240 = (-1)/((1+y(3))*(1+y(3)));
T244 = y(1)*T240/y(4);
T247 = T213*T240+T208*T244;
T248 = getPowerDeriv(T214,params(3)-1,1);
T253 = getPowerDeriv(y(4)*T208,1-params(3),1);
T255 = getPowerDeriv(y(1)*T208,params(3),1);
T261 = getPowerDeriv(T214,params(3),1);
T264 = getPowerDeriv(T224,T63,1);
T268 = getPowerDeriv(T208,1-params(3),1);
T270 = (1-params(3))*T240*T268;
T271 = getPowerDeriv(T213,params(3),1);
T288 = (-(y(1)*T208))/(y(4)*y(4));
T289 = T208*T288;
T297 = T59*T261*T289;
T302 = params(7)*getPowerDeriv(y(4),params(8),1);
T303 = T302/y(9);
T316 = T208/y(4);
T317 = T208*T316;
  g1(1,10)=(1-params(10))*params(1)*1/(y(12)*(1+y(11)));
  g1(1,11)=(1+y(10)*(1-params(10))-params(2))*params(1)*(-y(12))/(y(12)*(1+y(11))*y(12)*(1+y(11)))-1/y(8);
  g1(1,8)=(-((-(1+y(11)))/(y(8)*y(8))));
  g1(1,12)=(1+y(10)*(1-params(10))-params(2))*params(1)*(-(1+y(11)))/(y(12)*(1+y(11))*y(12)*(1+y(11)));
  g1(2,3)=(1-params(2))*y(1)*T240;
  g1(2,1)=(1-params(2))*T208;
  g1(2,6)=(-1);
  g1(2,7)=1;
  g1(2,8)=(-1);
  g1(3,2)=1;
  g1(3,3)=(-(T44*T247*T248));
  g1(3,4)=(-(T44*T248*T289));
  g1(3,1)=(-(T44*T248*T317));
  g1(4,3)=(-(T220*y(4)*T240*T253+T219*y(1)*T240*T255));
  g1(4,4)=(-(T220*T208*T253));
  g1(4,1)=(-(T219*T208*T255));
  g1(4,7)=1;
  g1(5,3)=1-(params(4)-1)*params(5)*T59*T247*T261*T264;
  g1(5,4)=(-((params(4)-1)*params(5)*T264*T297));
  g1(5,1)=(-((params(4)-1)*params(5)*T264*T59*T261*T317));
  g1(6,4)=(-((1-y(5))*T303));
  g1(6,5)=T73;
  g1(6,8)=(-1)/(y(8)*y(8));
  g1(6,9)=(-((1-y(5))*(-T71)/(y(9)*y(9))));
  g1(7,3)=(-(T230*T270+T229*T244*T271));
  g1(7,4)=(-(T229*T271*T288));
  g1(7,1)=(-(T229*T271*T316));
  g1(7,9)=1;
  g1(8,2)=(-(params(10)*y(1)*T208));
  g1(8,3)=(-(y(2)*params(10)*y(1)*T240));
  g1(8,4)=(-(y(9)*y(5)));
  g1(8,5)=(-(y(4)*y(9)));
  g1(8,1)=(-(y(2)*params(10)*T208));
  g1(8,9)=(-(y(4)*y(5)));

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(72,3);
T354 = y(12)*(1+y(11))*y(12)*(1+y(11))*y(12)*(1+y(11))*y(12)*(1+y(11));
T356 = params(1)*(-((-y(12))*(y(12)*y(12)*(1+y(11))+y(12)*y(12)*(1+y(11)))))/T354;
T370 = params(1)*((-(y(12)*(1+y(11))*y(12)*(1+y(11))))-(-(1+y(11)))*(y(12)*y(12)*(1+y(11))+y(12)*y(12)*(1+y(11))))/T354;
T377 = params(1)*(-((-(1+y(11)))*((1+y(11))*y(12)*(1+y(11))+(1+y(11))*y(12)*(1+y(11)))))/T354;
T382 = (1+y(3)+1+y(3))/((1+y(3))*(1+y(3))*(1+y(3))*(1+y(3)));
T389 = y(1)*T382/y(4);
T392 = T240*T244+T213*T382+T240*T244+T208*T389;
T393 = getPowerDeriv(T214,params(3)-1,2);
T394 = T247*T393;
T401 = (-(y(1)*T240))/(y(4)*y(4));
T404 = T240*T288+T208*T401;
T415 = (-((-(y(1)*T208))*(y(4)+y(4))))/(y(4)*y(4)*y(4)*y(4));
T416 = T208*T415;
T422 = T240/y(4);
T425 = T240*T316+T208*T422;
T432 = (-T208)/(y(4)*y(4));
T433 = T208*T432;
T444 = getPowerDeriv(y(4)*T208,1-params(3),2);
T445 = y(4)*T240*T444;
T452 = getPowerDeriv(y(1)*T208,params(3),2);
T453 = y(1)*T240*T452;
T485 = getPowerDeriv(T214,params(3),2);
T486 = T247*T485;
T491 = getPowerDeriv(T224,T63,2);
T492 = T59*T247*T261*T491;
T546 = params(7)*getPowerDeriv(y(4),params(8),2);
T547 = T546/y(9);
T564 = getPowerDeriv(T208,1-params(3),2);
T565 = T240*T564;
T569 = (1-params(3))*(T268*T382+T240*T565);
T573 = getPowerDeriv(T213,params(3),2);
T574 = T244*T573;
  v2(1,1)=1;
  v2(1,2)=140;
  v2(1,3)=(1-params(10))*params(1)*(-y(12))/(y(12)*(1+y(11))*y(12)*(1+y(11)));
  v2(2,1)=1;
  v2(2,2)=128;
  v2(2,3)=  v2(1,3);
  v2(3,1)=1;
  v2(3,2)=141;
  v2(3,3)=(1+y(10)*(1-params(10))-params(2))*T356;
  v2(4,1)=1;
  v2(4,2)=102;
  v2(4,3)=(-((-1)/(y(8)*y(8))));
  v2(5,1)=1;
  v2(5,2)=138;
  v2(5,3)=  v2(4,3);
  v2(6,1)=1;
  v2(6,2)=99;
  v2(6,3)=(-((-((-(1+y(11)))*(y(8)+y(8))))/(y(8)*y(8)*y(8)*y(8))));
  v2(7,1)=1;
  v2(7,2)=153;
  v2(7,3)=(1-params(10))*params(1)*(-(1+y(11)))/(y(12)*(1+y(11))*y(12)*(1+y(11)));
  v2(8,1)=1;
  v2(8,2)=129;
  v2(8,3)=  v2(7,3);
  v2(9,1)=1;
  v2(9,2)=154;
  v2(9,3)=(1+y(10)*(1-params(10))-params(2))*T370;
  v2(10,1)=1;
  v2(10,2)=142;
  v2(10,3)=  v2(9,3);
  v2(11,1)=1;
  v2(11,2)=155;
  v2(11,3)=(1+y(10)*(1-params(10))-params(2))*T377;
  v2(12,1)=2;
  v2(12,2)=29;
  v2(12,3)=(1-params(2))*y(1)*T382;
  v2(13,1)=2;
  v2(13,2)=3;
  v2(13,3)=(1-params(2))*T240;
  v2(14,1)=2;
  v2(14,2)=27;
  v2(14,3)=  v2(13,3);
  v2(15,1)=3;
  v2(15,2)=29;
  v2(15,3)=(-(T44*(T248*T392+T247*T394)));
  v2(16,1)=3;
  v2(16,2)=42;
  v2(16,3)=(-(T44*(T289*T394+T248*T404)));
  v2(17,1)=3;
  v2(17,2)=30;
  v2(17,3)=  v2(16,3);
  v2(18,1)=3;
  v2(18,2)=43;
  v2(18,3)=(-(T44*(T289*T289*T393+T248*T416)));
  v2(19,1)=3;
  v2(19,2)=3;
  v2(19,3)=(-(T44*(T317*T394+T248*T425)));
  v2(20,1)=3;
  v2(20,2)=27;
  v2(20,3)=  v2(19,3);
  v2(21,1)=3;
  v2(21,2)=4;
  v2(21,3)=(-(T44*(T317*T289*T393+T248*T433)));
  v2(22,1)=3;
  v2(22,2)=40;
  v2(22,3)=  v2(21,3);
  v2(23,1)=3;
  v2(23,2)=1;
  v2(23,3)=(-(T44*T317*T317*T393));
  v2(24,1)=4;
  v2(24,2)=29;
  v2(24,3)=(-(y(4)*T240*T253*y(1)*T240*T255+T220*(T253*y(4)*T382+y(4)*T240*T445)+y(4)*T240*T253*y(1)*T240*T255+T219*(T255*y(1)*T382+y(1)*T240*T453)));
  v2(25,1)=4;
  v2(25,2)=42;
  v2(25,3)=(-(y(1)*T240*T255*T208*T253+T220*(T240*T253+T208*T445)));
  v2(26,1)=4;
  v2(26,2)=30;
  v2(26,3)=  v2(25,3);
  v2(27,1)=4;
  v2(27,2)=43;
  v2(27,3)=(-(T220*T208*T208*T444));
  v2(28,1)=4;
  v2(28,2)=3;
  v2(28,3)=(-(y(4)*T240*T253*T208*T255+T219*(T240*T255+T208*T453)));
  v2(29,1)=4;
  v2(29,2)=27;
  v2(29,3)=  v2(28,3);
  v2(30,1)=4;
  v2(30,2)=4;
  v2(30,3)=(-(T208*T253*T208*T255));
  v2(31,1)=4;
  v2(31,2)=40;
  v2(31,3)=  v2(30,3);
  v2(32,1)=4;
  v2(32,2)=1;
  v2(32,3)=(-(T219*T208*T208*T452));
  v2(33,1)=5;
  v2(33,2)=29;
  v2(33,3)=(-((params(4)-1)*params(5)*(T264*T59*(T261*T392+T247*T486)+T59*T247*T261*T492)));
  v2(34,1)=5;
  v2(34,2)=42;
  v2(34,3)=(-((params(4)-1)*params(5)*(T297*T492+T264*T59*(T289*T486+T261*T404))));
  v2(35,1)=5;
  v2(35,2)=30;
  v2(35,3)=  v2(34,3);
  v2(36,1)=5;
  v2(36,2)=43;
  v2(36,3)=(-((params(4)-1)*params(5)*(T297*T297*T491+T264*T59*(T289*T289*T485+T261*T416))));
  v2(37,1)=5;
  v2(37,2)=3;
  v2(37,3)=(-((params(4)-1)*params(5)*(T59*T261*T317*T492+T264*T59*(T317*T486+T261*T425))));
  v2(38,1)=5;
  v2(38,2)=27;
  v2(38,3)=  v2(37,3);
  v2(39,1)=5;
  v2(39,2)=4;
  v2(39,3)=(-((params(4)-1)*params(5)*(T59*T261*T317*T297*T491+T264*T59*(T317*T289*T485+T261*T433))));
  v2(40,1)=5;
  v2(40,2)=40;
  v2(40,3)=  v2(39,3);
  v2(41,1)=5;
  v2(41,2)=1;
  v2(41,3)=(-((params(4)-1)*params(5)*(T59*T261*T317*T59*T261*T317*T491+T264*T59*T317*T317*T485)));
  v2(42,1)=6;
  v2(42,2)=43;
  v2(42,3)=(-((1-y(5))*T547));
  v2(43,1)=6;
  v2(43,2)=56;
  v2(43,3)=T303;
  v2(44,1)=6;
  v2(44,2)=44;
  v2(44,3)=  v2(43,3);
  v2(45,1)=6;
  v2(45,2)=99;
  v2(45,3)=(y(8)+y(8))/(y(8)*y(8)*y(8)*y(8));
  v2(46,1)=6;
  v2(46,2)=108;
  v2(46,3)=(-((1-y(5))*(-T302)/(y(9)*y(9))));
  v2(47,1)=6;
  v2(47,2)=48;
  v2(47,3)=  v2(46,3);
  v2(48,1)=6;
  v2(48,2)=109;
  v2(48,3)=(-T71)/(y(9)*y(9));
  v2(49,1)=6;
  v2(49,2)=61;
  v2(49,3)=  v2(48,3);
  v2(50,1)=6;
  v2(50,2)=113;
  v2(50,3)=(-((1-y(5))*(-((-T71)*(y(9)+y(9))))/(y(9)*y(9)*y(9)*y(9))));
  v2(51,1)=7;
  v2(51,2)=29;
  v2(51,3)=(-(T270*T244*T271+T230*T569+T270*T244*T271+T229*(T271*T389+T244*T574)));
  v2(52,1)=7;
  v2(52,2)=42;
  v2(52,3)=(-(T270*T271*T288+T229*(T288*T574+T271*T401)));
  v2(53,1)=7;
  v2(53,2)=30;
  v2(53,3)=  v2(52,3);
  v2(54,1)=7;
  v2(54,2)=43;
  v2(54,3)=(-(T229*(T288*T288*T573+T271*T415)));
  v2(55,1)=7;
  v2(55,2)=3;
  v2(55,3)=(-(T270*T271*T316+T229*(T316*T574+T271*T422)));
  v2(56,1)=7;
  v2(56,2)=27;
  v2(56,3)=  v2(55,3);
  v2(57,1)=7;
  v2(57,2)=4;
  v2(57,3)=(-(T229*(T316*T288*T573+T271*T432)));
  v2(58,1)=7;
  v2(58,2)=40;
  v2(58,3)=  v2(57,3);
  v2(59,1)=7;
  v2(59,2)=1;
  v2(59,3)=(-(T229*T316*T316*T573));
  v2(60,1)=8;
  v2(60,2)=28;
  v2(60,3)=(-(params(10)*y(1)*T240));
  v2(61,1)=8;
  v2(61,2)=16;
  v2(61,3)=  v2(60,3);
  v2(62,1)=8;
  v2(62,2)=29;
  v2(62,3)=(-(y(2)*params(10)*y(1)*T382));
  v2(63,1)=8;
  v2(63,2)=56;
  v2(63,3)=(-y(9));
  v2(64,1)=8;
  v2(64,2)=44;
  v2(64,3)=  v2(63,3);
  v2(65,1)=8;
  v2(65,2)=2;
  v2(65,3)=(-(params(10)*T208));
  v2(66,1)=8;
  v2(66,2)=14;
  v2(66,3)=  v2(65,3);
  v2(67,1)=8;
  v2(67,2)=3;
  v2(67,3)=(-(y(2)*params(10)*T240));
  v2(68,1)=8;
  v2(68,2)=27;
  v2(68,3)=  v2(67,3);
  v2(69,1)=8;
  v2(69,2)=108;
  v2(69,3)=(-y(5));
  v2(70,1)=8;
  v2(70,2)=48;
  v2(70,3)=  v2(69,3);
  v2(71,1)=8;
  v2(71,2)=109;
  v2(71,3)=(-y(4));
  v2(72,1)=8;
  v2(72,2)=61;
  v2(72,3)=  v2(71,3);
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),8,169);
if nargout >= 4,
  %
  % Third order derivatives
  %

  v3 = zeros(176,3);
T628 = y(12)*(1+y(11))*y(12)*(1+y(11))*(y(12)*y(12)*(1+y(11))+y(12)*y(12)*(1+y(11)))+y(12)*(1+y(11))*y(12)*(1+y(11))*(y(12)*y(12)*(1+y(11))+y(12)*y(12)*(1+y(11)));
T689 = (2*(1+y(3))*(1+y(3))*(1+y(3))*(1+y(3))-(1+y(3)+1+y(3))*((1+y(3))*(1+y(3))*(1+y(3)+1+y(3))+(1+y(3))*(1+y(3))*(1+y(3)+1+y(3))))/((1+y(3))*(1+y(3))*(1+y(3))*(1+y(3))*(1+y(3))*(1+y(3))*(1+y(3))*(1+y(3)));
T703 = T244*T382+T240*T389+T244*T382+T213*T689+T244*T382+T240*T389+T240*T389+T208*y(1)*T689/y(4);
T707 = getPowerDeriv(T214,params(3)-1,3);
T708 = T247*T707;
T711 = T392*T393+T247*T708;
T727 = T288*T382+T240*T401+T240*T401+T208*(-(y(1)*T382))/(y(4)*y(4));
T744 = T240*T415+T208*(-((-(y(1)*T240))*(y(4)+y(4))))/(y(4)*y(4)*y(4)*y(4));
T766 = (y(4)*y(4)*y(4)*y(4)*(-(2*(-(y(1)*T208))))-(-((-(y(1)*T208))*(y(4)+y(4))))*(y(4)*y(4)*(y(4)+y(4))+y(4)*y(4)*(y(4)+y(4))))/(y(4)*y(4)*y(4)*y(4)*y(4)*y(4)*y(4)*y(4));
T767 = T208*T766;
T782 = T316*T382+T240*T422+T240*T422+T208*T382/y(4);
T795 = T240*T432+T208*(-T240)/(y(4)*y(4));
T842 = getPowerDeriv(y(4)*T208,1-params(3),3);
T843 = y(4)*T240*T842;
T846 = y(4)*T382*T444+y(4)*T240*T843;
T856 = getPowerDeriv(y(1)*T208,params(3),3);
T857 = y(1)*T240*T856;
T860 = y(1)*T382*T452+y(1)*T240*T857;
T936 = getPowerDeriv(T214,params(3),3);
T937 = T247*T936;
T940 = T392*T485+T247*T937;
T948 = getPowerDeriv(T224,T63,3);
T949 = T59*T247*T261*T948;
T952 = T59*(T261*T392+T247*T486)*T491+T59*T247*T261*T949;
T1171 = getPowerDeriv(T213,params(3),3);
T1172 = T244*T1171;
T1175 = T389*T573+T244*T1172;
  v3(1,1)=1;
  v3(1,2)=1830;
  v3(1,3)=(1-params(10))*T356;
  v3(2,1)=1;
  v3(2,2)=1662;
  v3(2,3)=  v3(1,3);
  v3(3,1)=1;
  v3(3,2)=1818;
  v3(3,3)=  v3(1,3);
  v3(4,1)=1;
  v3(4,2)=1831;
  v3(4,3)=(1+y(10)*(1-params(10))-params(2))*params(1)*(T354*(-((-y(12))*(y(12)*y(12)+y(12)*y(12))))-(-((-y(12))*(y(12)*y(12)*(1+y(11))+y(12)*y(12)*(1+y(11)))))*T628)/(T354*T354);
  v3(5,1)=1;
  v3(5,2)=1285;
  v3(5,3)=(-((y(8)+y(8))/(y(8)*y(8)*y(8)*y(8))));
  v3(6,1)=1;
  v3(6,2)=1321;
  v3(6,3)=  v3(5,3);
  v3(7,1)=1;
  v3(7,2)=1789;
  v3(7,3)=  v3(5,3);
  v3(8,1)=1;
  v3(8,2)=1282;
  v3(8,3)=(-((y(8)*y(8)*y(8)*y(8)*(-(2*(-(1+y(11)))))-(-((-(1+y(11)))*(y(8)+y(8))))*(y(8)*y(8)*(y(8)+y(8))+y(8)*y(8)*(y(8)+y(8))))/(y(8)*y(8)*y(8)*y(8)*y(8)*y(8)*y(8)*y(8))));
  v3(9,1)=1;
  v3(9,2)=1999;
  v3(9,3)=(1-params(10))*T370;
  v3(10,1)=1;
  v3(10,2)=1663;
  v3(10,3)=  v3(9,3);
  v3(11,1)=1;
  v3(11,2)=1675;
  v3(11,3)=  v3(9,3);
  v3(12,1)=1;
  v3(12,2)=1819;
  v3(12,3)=  v3(9,3);
  v3(13,1)=1;
  v3(13,2)=1843;
  v3(13,3)=  v3(9,3);
  v3(14,1)=1;
  v3(14,2)=1987;
  v3(14,3)=  v3(9,3);
  v3(15,1)=1;
  v3(15,2)=2000;
  v3(15,3)=(1+y(10)*(1-params(10))-params(2))*params(1)*(T354*((-(y(12)*y(12)*(1+y(11))+y(12)*y(12)*(1+y(11))))-((-(y(12)*y(12)*(1+y(11))+y(12)*y(12)*(1+y(11))))+(-(1+y(11)))*(y(12)*y(12)+y(12)*y(12))))-((-(y(12)*(1+y(11))*y(12)*(1+y(11))))-(-(1+y(11)))*(y(12)*y(12)*(1+y(11))+y(12)*y(12)*(1+y(11))))*T628)/(T354*T354);
  v3(16,1)=1;
  v3(16,2)=1832;
  v3(16,3)=  v3(15,3);
  v3(17,1)=1;
  v3(17,2)=1844;
  v3(17,3)=  v3(15,3);
  v3(18,1)=1;
  v3(18,2)=2012;
  v3(18,3)=(1-params(10))*T377;
  v3(19,1)=1;
  v3(19,2)=1676;
  v3(19,3)=  v3(18,3);
  v3(20,1)=1;
  v3(20,2)=1988;
  v3(20,3)=  v3(18,3);
  v3(21,1)=1;
  v3(21,2)=2013;
  v3(21,3)=(1+y(10)*(1-params(10))-params(2))*params(1)*(T354*(-((-((1+y(11))*y(12)*(1+y(11))+(1+y(11))*y(12)*(1+y(11))))+(-(1+y(11)))*(y(12)*(1+y(11))+y(12)*(1+y(11))+y(12)*(1+y(11))+y(12)*(1+y(11)))))-(-((-(1+y(11)))*((1+y(11))*y(12)*(1+y(11))+(1+y(11))*y(12)*(1+y(11)))))*T628)/(T354*T354);
  v3(22,1)=1;
  v3(22,2)=1845;
  v3(22,3)=  v3(21,3);
  v3(23,1)=1;
  v3(23,2)=2001;
  v3(23,3)=  v3(21,3);
  v3(24,1)=1;
  v3(24,2)=2014;
  v3(24,3)=(1+y(10)*(1-params(10))-params(2))*params(1)*(T354*(-((-(1+y(11)))*((1+y(11))*(1+y(11))+(1+y(11))*(1+y(11)))))-(-((-(1+y(11)))*((1+y(11))*y(12)*(1+y(11))+(1+y(11))*y(12)*(1+y(11)))))*(y(12)*(1+y(11))*y(12)*(1+y(11))*((1+y(11))*y(12)*(1+y(11))+(1+y(11))*y(12)*(1+y(11)))+y(12)*(1+y(11))*y(12)*(1+y(11))*((1+y(11))*y(12)*(1+y(11))+(1+y(11))*y(12)*(1+y(11)))))/(T354*T354);
  v3(25,1)=2;
  v3(25,2)=367;
  v3(25,3)=(1-params(2))*y(1)*T689;
  v3(26,1)=2;
  v3(26,2)=29;
  v3(26,3)=(1-params(2))*T382;
  v3(27,1)=2;
  v3(27,2)=341;
  v3(27,3)=  v3(26,3);
  v3(28,1)=2;
  v3(28,2)=365;
  v3(28,3)=  v3(26,3);
  v3(29,1)=3;
  v3(29,2)=367;
  v3(29,3)=(-(T44*(T392*T394+T248*T703+T392*T394+T247*T711)));
  v3(30,1)=3;
  v3(30,2)=536;
  v3(30,3)=(-(T44*(T394*T404+T289*T711+T394*T404+T248*T727)));
  v3(31,1)=3;
  v3(31,2)=368;
  v3(31,3)=  v3(30,3);
  v3(32,1)=3;
  v3(32,2)=380;
  v3(32,3)=  v3(30,3);
  v3(33,1)=3;
  v3(33,2)=549;
  v3(33,3)=(-(T44*(T404*T289*T393+T289*(T393*T404+T289*T708)+T394*T416+T248*T744)));
  v3(34,1)=3;
  v3(34,2)=381;
  v3(34,3)=  v3(33,3);
  v3(35,1)=3;
  v3(35,2)=537;
  v3(35,3)=  v3(33,3);
  v3(36,1)=3;
  v3(36,2)=550;
  v3(36,3)=(-(T44*(T289*T393*T416+T289*(T393*T416+T289*T289*T707)+T289*T393*T416+T248*T767)));
  v3(37,1)=3;
  v3(37,2)=29;
  v3(37,3)=(-(T44*(T394*T425+T317*T711+T394*T425+T248*T782)));
  v3(38,1)=3;
  v3(38,2)=341;
  v3(38,3)=  v3(37,3);
  v3(39,1)=3;
  v3(39,2)=365;
  v3(39,3)=  v3(37,3);
  v3(40,1)=3;
  v3(40,2)=42;
  v3(40,3)=(-(T44*(T289*T393*T425+T317*(T393*T404+T289*T708)+T394*T433+T248*T795)));
  v3(41,1)=3;
  v3(41,2)=30;
  v3(41,3)=  v3(40,3);
  v3(42,1)=3;
  v3(42,2)=342;
  v3(42,3)=  v3(40,3);
  v3(43,1)=3;
  v3(43,2)=378;
  v3(43,3)=  v3(40,3);
  v3(44,1)=3;
  v3(44,2)=510;
  v3(44,3)=  v3(40,3);
  v3(45,1)=3;
  v3(45,2)=534;
  v3(45,3)=  v3(40,3);
  v3(46,1)=3;
  v3(46,2)=43;
  v3(46,3)=(-(T44*(T289*T393*T433+T317*(T393*T416+T289*T289*T707)+T289*T393*T433+T248*T208*(-((y(4)+y(4))*(-T208)))/(y(4)*y(4)*y(4)*y(4)))));
  v3(47,1)=3;
  v3(47,2)=511;
  v3(47,3)=  v3(46,3);
  v3(48,1)=3;
  v3(48,2)=547;
  v3(48,3)=  v3(46,3);
  v3(49,1)=3;
  v3(49,2)=3;
  v3(49,3)=(-(T44*(T425*T317*T393+T317*(T393*T425+T317*T708))));
  v3(50,1)=3;
  v3(50,2)=27;
  v3(50,3)=  v3(49,3);
  v3(51,1)=3;
  v3(51,2)=339;
  v3(51,3)=  v3(49,3);
  v3(52,1)=3;
  v3(52,2)=4;
  v3(52,3)=(-(T44*(T433*T317*T393+T317*(T393*T433+T317*T289*T707))));
  v3(53,1)=3;
  v3(53,2)=40;
  v3(53,3)=  v3(52,3);
  v3(54,1)=3;
  v3(54,2)=508;
  v3(54,3)=  v3(52,3);
  v3(55,1)=3;
  v3(55,2)=1;
  v3(55,3)=(-(T44*T317*T317*T317*T707));
  v3(56,1)=4;
  v3(56,2)=367;
  v3(56,3)=(-(y(1)*T240*T255*(T253*y(4)*T382+y(4)*T240*T445)+y(4)*T240*T253*(T255*y(1)*T382+y(1)*T240*T453)+y(1)*T240*T255*(T253*y(4)*T382+y(4)*T240*T445)+T220*(y(4)*T382*T445+T253*y(4)*T689+y(4)*T382*T445+y(4)*T240*T846)+y(1)*T240*T255*(T253*y(4)*T382+y(4)*T240*T445)+y(4)*T240*T253*(T255*y(1)*T382+y(1)*T240*T453)+y(4)*T240*T253*(T255*y(1)*T382+y(1)*T240*T453)+T219*(y(1)*T382*T453+T255*y(1)*T689+y(1)*T382*T453+y(1)*T240*T860)));
  v3(57,1)=4;
  v3(57,2)=536;
  v3(57,3)=(-(T208*T253*(T255*y(1)*T382+y(1)*T240*T453)+y(1)*T240*T255*(T240*T253+T208*T445)+y(1)*T240*T255*(T240*T253+T208*T445)+T220*(T253*T382+T240*T445+T240*T445+T208*T846)));
  v3(58,1)=4;
  v3(58,2)=368;
  v3(58,3)=  v3(57,3);
  v3(59,1)=4;
  v3(59,2)=380;
  v3(59,3)=  v3(57,3);
  v3(60,1)=4;
  v3(60,2)=549;
  v3(60,3)=(-(y(1)*T240*T255*T208*T208*T444+T220*(T240*T208*T444+T208*(T240*T444+T208*T843))));
  v3(61,1)=4;
  v3(61,2)=381;
  v3(61,3)=  v3(60,3);
  v3(62,1)=4;
  v3(62,2)=537;
  v3(62,3)=  v3(60,3);
  v3(63,1)=4;
  v3(63,2)=550;
  v3(63,3)=(-(T220*T208*T208*T208*T842));
  v3(64,1)=4;
  v3(64,2)=29;
  v3(64,3)=(-(T208*T255*(T253*y(4)*T382+y(4)*T240*T445)+y(4)*T240*T253*(T240*T255+T208*T453)+y(4)*T240*T253*(T240*T255+T208*T453)+T219*(T255*T382+T240*T453+T240*T453+T208*T860)));
  v3(65,1)=4;
  v3(65,2)=341;
  v3(65,3)=  v3(64,3);
  v3(66,1)=4;
  v3(66,2)=365;
  v3(66,3)=  v3(64,3);
  v3(67,1)=4;
  v3(67,2)=42;
  v3(67,3)=(-(T208*T255*(T240*T253+T208*T445)+T208*T253*(T240*T255+T208*T453)));
  v3(68,1)=4;
  v3(68,2)=30;
  v3(68,3)=  v3(67,3);
  v3(69,1)=4;
  v3(69,2)=342;
  v3(69,3)=  v3(67,3);
  v3(70,1)=4;
  v3(70,2)=378;
  v3(70,3)=  v3(67,3);
  v3(71,1)=4;
  v3(71,2)=510;
  v3(71,3)=  v3(67,3);
  v3(72,1)=4;
  v3(72,2)=534;
  v3(72,3)=  v3(67,3);
  v3(73,1)=4;
  v3(73,2)=43;
  v3(73,3)=(-(T208*T255*T208*T208*T444));
  v3(74,1)=4;
  v3(74,2)=511;
  v3(74,3)=  v3(73,3);
  v3(75,1)=4;
  v3(75,2)=547;
  v3(75,3)=  v3(73,3);
  v3(76,1)=4;
  v3(76,2)=3;
  v3(76,3)=(-(y(4)*T240*T253*T208*T208*T452+T219*(T240*T208*T452+T208*(T240*T452+T208*T857))));
  v3(77,1)=4;
  v3(77,2)=27;
  v3(77,3)=  v3(76,3);
  v3(78,1)=4;
  v3(78,2)=339;
  v3(78,3)=  v3(76,3);
  v3(79,1)=4;
  v3(79,2)=4;
  v3(79,3)=(-(T208*T253*T208*T208*T452));
  v3(80,1)=4;
  v3(80,2)=40;
  v3(80,3)=  v3(79,3);
  v3(81,1)=4;
  v3(81,2)=508;
  v3(81,3)=  v3(79,3);
  v3(82,1)=4;
  v3(82,2)=1;
  v3(82,3)=(-(T219*T208*T208*T208*T856));
  v3(83,1)=5;
  v3(83,2)=367;
  v3(83,3)=(-((params(4)-1)*params(5)*(T59*(T261*T392+T247*T486)*T492+T264*T59*(T392*T486+T261*T703+T392*T486+T247*T940)+T59*(T261*T392+T247*T486)*T492+T59*T247*T261*T952)));
  v3(84,1)=5;
  v3(84,2)=536;
  v3(84,3)=(-((params(4)-1)*params(5)*(T492*T59*(T289*T486+T261*T404)+T297*T952+T492*T59*(T289*T486+T261*T404)+T264*T59*(T404*T486+T289*T940+T404*T486+T261*T727))));
  v3(85,1)=5;
  v3(85,2)=368;
  v3(85,3)=  v3(84,3);
  v3(86,1)=5;
  v3(86,2)=380;
  v3(86,3)=  v3(84,3);
  v3(87,1)=5;
  v3(87,2)=549;
  v3(87,3)=(-((params(4)-1)*params(5)*(T59*(T289*T486+T261*T404)*T297*T491+T297*(T491*T59*(T289*T486+T261*T404)+T297*T949)+T492*T59*(T289*T289*T485+T261*T416)+T264*T59*(T404*T289*T485+T289*(T404*T485+T289*T937)+T416*T486+T261*T744))));
  v3(88,1)=5;
  v3(88,2)=381;
  v3(88,3)=  v3(87,3);
  v3(89,1)=5;
  v3(89,2)=537;
  v3(89,3)=  v3(87,3);
  v3(90,1)=5;
  v3(90,2)=550;
  v3(90,3)=(-((params(4)-1)*params(5)*(T297*T491*T59*(T289*T289*T485+T261*T416)+T297*(T491*T59*(T289*T289*T485+T261*T416)+T297*T297*T948)+T297*T491*T59*(T289*T289*T485+T261*T416)+T264*T59*(T416*T289*T485+T289*(T416*T485+T289*T289*T936)+T416*T289*T485+T261*T767))));
  v3(91,1)=5;
  v3(91,2)=29;
  v3(91,3)=(-((params(4)-1)*params(5)*(T492*T59*(T317*T486+T261*T425)+T59*T261*T317*T952+T492*T59*(T317*T486+T261*T425)+T264*T59*(T425*T486+T317*T940+T425*T486+T261*T782))));
  v3(92,1)=5;
  v3(92,2)=341;
  v3(92,3)=  v3(91,3);
  v3(93,1)=5;
  v3(93,2)=365;
  v3(93,3)=  v3(91,3);
  v3(94,1)=5;
  v3(94,2)=42;
  v3(94,3)=(-((params(4)-1)*params(5)*(T297*T491*T59*(T317*T486+T261*T425)+T59*T261*T317*(T491*T59*(T289*T486+T261*T404)+T297*T949)+T492*T59*(T317*T289*T485+T261*T433)+T264*T59*(T425*T289*T485+T317*(T404*T485+T289*T937)+T433*T486+T261*T795))));
  v3(95,1)=5;
  v3(95,2)=30;
  v3(95,3)=  v3(94,3);
  v3(96,1)=5;
  v3(96,2)=342;
  v3(96,3)=  v3(94,3);
  v3(97,1)=5;
  v3(97,2)=378;
  v3(97,3)=  v3(94,3);
  v3(98,1)=5;
  v3(98,2)=510;
  v3(98,3)=  v3(94,3);
  v3(99,1)=5;
  v3(99,2)=534;
  v3(99,3)=  v3(94,3);
  v3(100,1)=5;
  v3(100,2)=43;
  v3(100,3)=(-((params(4)-1)*params(5)*(T297*T491*T59*(T317*T289*T485+T261*T433)+T59*T261*T317*(T491*T59*(T289*T289*T485+T261*T416)+T297*T297*T948)+T297*T491*T59*(T317*T289*T485+T261*T433)+T264*T59*(T433*T289*T485+T317*(T416*T485+T289*T289*T936)+T433*T289*T485+T261*T208*(-((y(4)+y(4))*(-T208)))/(y(4)*y(4)*y(4)*y(4))))));
  v3(101,1)=5;
  v3(101,2)=511;
  v3(101,3)=  v3(100,3);
  v3(102,1)=5;
  v3(102,2)=547;
  v3(102,3)=  v3(100,3);
  v3(103,1)=5;
  v3(103,2)=3;
  v3(103,3)=(-((params(4)-1)*params(5)*(T59*(T317*T486+T261*T425)*T59*T261*T317*T491+T59*T261*T317*(T491*T59*(T317*T486+T261*T425)+T59*T261*T317*T949)+T492*T59*T317*T317*T485+T264*T59*(T425*T317*T485+T317*(T425*T485+T317*T937)))));
  v3(104,1)=5;
  v3(104,2)=27;
  v3(104,3)=  v3(103,3);
  v3(105,1)=5;
  v3(105,2)=339;
  v3(105,3)=  v3(103,3);
  v3(106,1)=5;
  v3(106,2)=4;
  v3(106,3)=(-((params(4)-1)*params(5)*(T59*(T317*T289*T485+T261*T433)*T59*T261*T317*T491+T59*T261*T317*(T491*T59*(T317*T289*T485+T261*T433)+T59*T261*T317*T297*T948)+T297*T491*T59*T317*T317*T485+T264*T59*(T433*T317*T485+T317*(T433*T485+T317*T289*T936)))));
  v3(107,1)=5;
  v3(107,2)=40;
  v3(107,3)=  v3(106,3);
  v3(108,1)=5;
  v3(108,2)=508;
  v3(108,3)=  v3(106,3);
  v3(109,1)=5;
  v3(109,2)=1;
  v3(109,3)=(-((params(4)-1)*params(5)*(T59*T261*T317*T491*T59*T317*T317*T485+T59*T261*T317*(T491*T59*T317*T317*T485+T59*T261*T317*T59*T261*T317*T948)+T59*T261*T317*T491*T59*T317*T317*T485+T264*T59*T317*T317*T317*T936)));
  v3(110,1)=6;
  v3(110,2)=550;
  v3(110,3)=(-((1-y(5))*params(7)*getPowerDeriv(y(4),params(8),3)/y(9)));
  v3(111,1)=6;
  v3(111,2)=719;
  v3(111,3)=T547;
  v3(112,1)=6;
  v3(112,2)=551;
  v3(112,3)=  v3(111,3);
  v3(113,1)=6;
  v3(113,2)=563;
  v3(113,3)=  v3(111,3);
  v3(114,1)=6;
  v3(114,2)=1282;
  v3(114,3)=(2*y(8)*y(8)*y(8)*y(8)-(y(8)+y(8))*(y(8)*y(8)*(y(8)+y(8))+y(8)*y(8)*(y(8)+y(8))))/(y(8)*y(8)*y(8)*y(8)*y(8)*y(8)*y(8)*y(8));
  v3(115,1)=6;
  v3(115,2)=1395;
  v3(115,3)=(-((1-y(5))*(-T546)/(y(9)*y(9))));
  v3(116,1)=6;
  v3(116,2)=555;
  v3(116,3)=  v3(115,3);
  v3(117,1)=6;
  v3(117,2)=615;
  v3(117,3)=  v3(115,3);
  v3(118,1)=6;
  v3(118,2)=1408;
  v3(118,3)=(-T302)/(y(9)*y(9));
  v3(119,1)=6;
  v3(119,2)=568;
  v3(119,3)=  v3(118,3);
  v3(120,1)=6;
  v3(120,2)=616;
  v3(120,3)=  v3(118,3);
  v3(121,1)=6;
  v3(121,2)=724;
  v3(121,3)=  v3(118,3);
  v3(122,1)=6;
  v3(122,2)=784;
  v3(122,3)=  v3(118,3);
  v3(123,1)=6;
  v3(123,2)=1396;
  v3(123,3)=  v3(118,3);
  v3(124,1)=6;
  v3(124,2)=1460;
  v3(124,3)=(-((1-y(5))*(-((-T302)*(y(9)+y(9))))/(y(9)*y(9)*y(9)*y(9))));
  v3(125,1)=6;
  v3(125,2)=620;
  v3(125,3)=  v3(124,3);
  v3(126,1)=6;
  v3(126,2)=1400;
  v3(126,3)=  v3(124,3);
  v3(127,1)=6;
  v3(127,2)=1461;
  v3(127,3)=(-((-T71)*(y(9)+y(9))))/(y(9)*y(9)*y(9)*y(9));
  v3(128,1)=6;
  v3(128,2)=789;
  v3(128,3)=  v3(127,3);
  v3(129,1)=6;
  v3(129,2)=1413;
  v3(129,3)=  v3(127,3);
  v3(130,1)=6;
  v3(130,2)=1465;
  v3(130,3)=(-((1-y(5))*(y(9)*y(9)*y(9)*y(9)*(-(2*(-T71)))-(-((-T71)*(y(9)+y(9))))*(y(9)*y(9)*(y(9)+y(9))+y(9)*y(9)*(y(9)+y(9))))/(y(9)*y(9)*y(9)*y(9)*y(9)*y(9)*y(9)*y(9))));
  v3(131,1)=7;
  v3(131,2)=367;
  v3(131,3)=(-(T244*T271*T569+T270*(T271*T389+T244*T574)+T244*T271*T569+T230*(1-params(3))*(T382*T565+T268*T689+T382*T565+T240*(T382*T564+T240*T240*getPowerDeriv(T208,1-params(3),3)))+T244*T271*T569+T270*(T271*T389+T244*T574)+T270*(T271*T389+T244*T574)+T229*(T389*T574+T271*y(1)*T689/y(4)+T389*T574+T244*T1175)));
  v3(132,1)=7;
  v3(132,2)=536;
  v3(132,3)=(-(T271*T288*T569+T270*(T288*T574+T271*T401)+T270*(T288*T574+T271*T401)+T229*(T401*T574+T288*T1175+T401*T574+T271*(-(y(1)*T382))/(y(4)*y(4)))));
  v3(133,1)=7;
  v3(133,2)=368;
  v3(133,3)=  v3(132,3);
  v3(134,1)=7;
  v3(134,2)=380;
  v3(134,3)=  v3(132,3);
  v3(135,1)=7;
  v3(135,2)=549;
  v3(135,3)=(-(T270*(T288*T288*T573+T271*T415)+T229*(T401*T288*T573+T288*(T401*T573+T288*T1172)+T415*T574+T271*(-((-(y(1)*T240))*(y(4)+y(4))))/(y(4)*y(4)*y(4)*y(4)))));
  v3(136,1)=7;
  v3(136,2)=381;
  v3(136,3)=  v3(135,3);
  v3(137,1)=7;
  v3(137,2)=537;
  v3(137,3)=  v3(135,3);
  v3(138,1)=7;
  v3(138,2)=550;
  v3(138,3)=(-(T229*(T415*T288*T573+T288*(T415*T573+T288*T288*T1171)+T415*T288*T573+T271*T766)));
  v3(139,1)=7;
  v3(139,2)=29;
  v3(139,3)=(-(T271*T316*T569+T270*(T316*T574+T271*T422)+T270*(T316*T574+T271*T422)+T229*(T422*T574+T316*T1175+T422*T574+T271*T382/y(4))));
  v3(140,1)=7;
  v3(140,2)=341;
  v3(140,3)=  v3(139,3);
  v3(141,1)=7;
  v3(141,2)=365;
  v3(141,3)=  v3(139,3);
  v3(142,1)=7;
  v3(142,2)=42;
  v3(142,3)=(-(T270*(T316*T288*T573+T271*T432)+T229*(T422*T288*T573+T316*(T401*T573+T288*T1172)+T432*T574+T271*(-T240)/(y(4)*y(4)))));
  v3(143,1)=7;
  v3(143,2)=30;
  v3(143,3)=  v3(142,3);
  v3(144,1)=7;
  v3(144,2)=342;
  v3(144,3)=  v3(142,3);
  v3(145,1)=7;
  v3(145,2)=378;
  v3(145,3)=  v3(142,3);
  v3(146,1)=7;
  v3(146,2)=510;
  v3(146,3)=  v3(142,3);
  v3(147,1)=7;
  v3(147,2)=534;
  v3(147,3)=  v3(142,3);
  v3(148,1)=7;
  v3(148,2)=43;
  v3(148,3)=(-(T229*(T432*T288*T573+T316*(T415*T573+T288*T288*T1171)+T432*T288*T573+T271*(-((y(4)+y(4))*(-T208)))/(y(4)*y(4)*y(4)*y(4)))));
  v3(149,1)=7;
  v3(149,2)=511;
  v3(149,3)=  v3(148,3);
  v3(150,1)=7;
  v3(150,2)=547;
  v3(150,3)=  v3(148,3);
  v3(151,1)=7;
  v3(151,2)=3;
  v3(151,3)=(-(T270*T316*T316*T573+T229*(T422*T316*T573+T316*(T422*T573+T316*T1172))));
  v3(152,1)=7;
  v3(152,2)=27;
  v3(152,3)=  v3(151,3);
  v3(153,1)=7;
  v3(153,2)=339;
  v3(153,3)=  v3(151,3);
  v3(154,1)=7;
  v3(154,2)=4;
  v3(154,3)=(-(T229*(T432*T316*T573+T316*(T432*T573+T316*T288*T1171))));
  v3(155,1)=7;
  v3(155,2)=40;
  v3(155,3)=  v3(154,3);
  v3(156,1)=7;
  v3(156,2)=508;
  v3(156,3)=  v3(154,3);
  v3(157,1)=7;
  v3(157,2)=1;
  v3(157,3)=(-(T229*T316*T316*T316*T1171));
  v3(158,1)=8;
  v3(158,2)=366;
  v3(158,3)=(-(params(10)*y(1)*T382));
  v3(159,1)=8;
  v3(159,2)=198;
  v3(159,3)=  v3(158,3);
  v3(160,1)=8;
  v3(160,2)=354;
  v3(160,3)=  v3(158,3);
  v3(161,1)=8;
  v3(161,2)=367;
  v3(161,3)=(-(y(2)*params(10)*y(1)*T689));
  v3(162,1)=8;
  v3(162,2)=28;
  v3(162,3)=(-(params(10)*T240));
  v3(163,1)=8;
  v3(163,2)=16;
  v3(163,3)=  v3(162,3);
  v3(164,1)=8;
  v3(164,2)=172;
  v3(164,3)=  v3(162,3);
  v3(165,1)=8;
  v3(165,2)=196;
  v3(165,3)=  v3(162,3);
  v3(166,1)=8;
  v3(166,2)=340;
  v3(166,3)=  v3(162,3);
  v3(167,1)=8;
  v3(167,2)=352;
  v3(167,3)=  v3(162,3);
  v3(168,1)=8;
  v3(168,2)=29;
  v3(168,3)=(-(y(2)*params(10)*T382));
  v3(169,1)=8;
  v3(169,2)=341;
  v3(169,3)=  v3(168,3);
  v3(170,1)=8;
  v3(170,2)=365;
  v3(170,3)=  v3(168,3);
  v3(171,1)=8;
  v3(171,2)=1408;
  v3(171,3)=(-1);
  v3(172,1)=8;
  v3(172,2)=568;
  v3(172,3)=  v3(171,3);
  v3(173,1)=8;
  v3(173,2)=616;
  v3(173,3)=  v3(171,3);
  v3(174,1)=8;
  v3(174,2)=724;
  v3(174,3)=  v3(171,3);
  v3(175,1)=8;
  v3(175,2)=784;
  v3(175,3)=  v3(171,3);
  v3(176,1)=8;
  v3(176,2)=1396;
  v3(176,3)=  v3(171,3);
  g3 = sparse(v3(:,1),v3(:,2),v3(:,3),8,2197);
end
end
end
end
