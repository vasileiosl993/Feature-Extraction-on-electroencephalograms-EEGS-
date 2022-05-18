function [result]=features_extraction(signal,segment,print)

  seg=length(signal)/segment;
    
  for i=1:seg
	a=signal(1,(i-1)*segment+1:i*segment);
	[c,l]=wavedec(a,10,'db4');
	result1(i,:)=appcoef(c,l,'db4',10);
  end
  
  result=[result1(:,1),result1(:,2)+result1(:,3),result1(:,4)+result1(:,5),result1(:,6)+result1(:,7)];
  
  if(print==1)
	dlmwrite(strcat(inputname(1),'_features_with4.txt'),result)
  end
  
end