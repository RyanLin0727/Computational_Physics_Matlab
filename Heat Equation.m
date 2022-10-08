T=zeros(100,100);
dT=zeros(100,100);
D=1;
T(:,1)=1;
T(:,100)=1;
T(1,:)=1;
dt=0.001;
M=[];
Ts=zeros(100,100,100);
for m=1:100
for k=1:1000
	for i=2:99
        for j=2:99
            dT(i,j)=D*((T(i+1,j)-T(i,j))-(T(i,j)-T(i-1,j))+(T(i,j+1)-T(i,j))-(T(i,j)-T(i,j-1)));
            T(i,j)=T(i,j)+dT(i,j)*dt;
        end
	end
end
h=pcolor(T);
set(h,'EdgeColor','none');
H=getframe;
M=[M,H];
Ts(:,:,m)=T;
end
movie(M);