% LS SVC train
%
% model=lssvctrain(P,T,lamba,kr)
%
% model=A trained model
% P=Input patterns Nxm
% T=An output pattern (target) Nx1
% lamba=Regularized constant (default=1)
% kr=Kernel (default=2)
%    1=linear
%    2=RBF
%    3=Polynomial degree 2
%    4=Perceptron
%    5=RBF with mo=kr(2) for example if kr=[5,3] then gama=3
%    6=Polynomial with degree=kr(2) for example if kr=[6,3] then degree=3
%    7=Perceptron with k=kr(2) and bias=kr(3)
%
% Copyright by Pat Taweewat
% in R-Machine
%   This program is free software: you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation.
%
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%
%   You should have received a copy of the GNU General Public License
%   along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
function model=lssvctrain(P,T,lamba,kr)
if nargin<4,
   kr=2;
end
if nargin<3,
   lamba=1;
end   
N=size(P,1);
K=zeros(N,N);
model.T=T;
model.P=P;
model.kr=kr;
P=P';
for ii=1:N,
 for jj=1:N,
     %K(ii,jj)=P(:,jj)'*P(:,ii);%option 2
     switch kr(1)
         case 1%linear
              K(ii,jj)=T(ii)'*T(jj)*P(:,jj)'*P(:,ii);
         case 2%RBF
              gama = 2;
              K(ii,jj)=T(ii)'*T(jj)*exp((-norm(P(:,ii)-P(:,jj))^2)*gama);
         case 3%Polynomial
              K(ii,jj)=T(ii)'*T(jj)*(P(:,jj)'*P(:,ii)+1)^2;              
         case 4%Perceptron
              K(ii,jj)=T(ii)'*T(jj)*tanh(0.5*P(:,jj)'*P(:,ii)+0.5);                           
         case 5%RBF with option
              gama = kr(2);
              K(ii,jj)=T(ii)'*T(jj)*exp((-norm(P(:,ii)-P(:,jj))^2)*gama);
         case 6%Polynomial with option
              K(ii,jj)=T(ii)'*T(jj)*(P(:,jj)'*P(:,ii)+1)^kr(2);  
         case 7%Perceptron with option
              K(ii,jj)=T(ii)'*T(jj)*tanh(kr(2)*P(:,jj)'*P(:,ii)+kr(3));
     end         
 end
end
%H=K.*(T*T')+speye(N)/v;% option 2
H=K+speye(N)*lamba;
A=[0,-T';T,H];
C=[0;ones(N,1)];
b=A\C;
model.a=b(2:N+1);
model.b=b(1);
model.K = K;
end