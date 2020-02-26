%% This function receives 5 cell elements originated via "SourisXLS" and generates a single cell element wich contains the avarage of the 5 initial inputs
function DATAF = Average5 (C1,C2,C3,C4,C5,x)
DATA(:,:,1)=C1;
DATA(:,:,2)=C2;
DATA(:,:,3)=C3;
DATA(:,:,4)=C4;
DATA(:,:,5)=C5;
[NoOfRows,NoOfColumn]=size(C1);
DATAF=zeros([NoOfRows,NoOfColumn]);
time=DATA(:,1);
lowerBound=3000;
higherBound=4500;
[ ~, ilx ] = min(abs(time-lowerBound));
[ ~, ihx ] = min(abs(time-higherBound));
for j = 1:5
        for i = 2:NoOfColumn
            DATAF(:,i)=DATAF(:,i)+DATA(:,i,j);
            %get baseline
            baseline=DATA(ilx:ihx,i,j);
            F0=mean(baseline);
            DATA(:,i,j)=(DATA(:,i,j)-F0)/F0;
        end
end
 DATAF(:,2:end)=DATAF(:,2:end)./5;
 
 
 data=DATAF(:,x);

    %get baseline
    baseline=data(ilx:ihx);
    F0=mean(baseline);
    data_norm=(data-F0)/F0;
    time=time/1000;
    data=data_norm;
    %plot F as a function of time
    figure,
    plot(time, data)
    hold on
    threshold=3*std(data);
    plot(time,ones(size(time)) * threshold)
    hold off
    figure,
    hold on
    plot(time,DATA(:,x,1));
    plot(time,DATA(:,x,2));
    plot(time,DATA(:,x,3));
    plot(time,DATA(:,x,4));
    plot(time,DATA(:,x,5));
    hold off

end
