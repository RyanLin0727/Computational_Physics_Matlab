N=30000000;%amounts steps
u=zeros(1000,1);%1 (m)
v=zeros(1000,1);
a=zeros(1000,1);
s=0.1;%(m/s)
dx=0.001;%(m)
dt=30/N;%(s)
k=0;
M=[];
for i=1:N
    u(1)=i*dt/exp(i*dt);
    for j=2:999
        a(j)=s^2*((u(j+1)-u(j))-(u(j)-u(j-1)))/dx^2;
        u(j)=u(j)+v(j)*dt+0.5*a(j)*dt^2;
        v(j)=v(j)+a(j)*dt;
    end
    if i>k
    plot(u);
    axis([1,1000,-1,1]);
    h=getframe;
    M=[M,h];
    k=k+100000;
    end
end
movie(M);
