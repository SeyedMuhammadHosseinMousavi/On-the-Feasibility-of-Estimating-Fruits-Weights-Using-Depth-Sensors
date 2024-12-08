function PlotResults(targets,outputs,Name)

    errors=targets-outputs;
    MSE=mean(errors(:).^2);

    RMSE=sqrt(mean(errors(:).^2));
    
    error_mean=mean(errors(:));
    error_std=std(errors(:));

    subplot(2,2,[1 2]);
    plot(targets,'k');
    hold on;
    plot(outputs,'r');
  xlabel('Sample')
    ylabel('Weight in gram')
    legend('Real','Estimated');
    title([Name,' MSE= ' num2str(MSE)]);

    subplot(2,2,3);
    plot(errors);
      xlabel('Sample')
    ylabel('Error')
    legend('Error');
    title(['RMSE = ' num2str(RMSE)]);

    subplot(2,2,4);
    histfit(errors);
    title(['Error: mean = ' num2str(error_mean) ', std = ' num2str(error_std)]);

end