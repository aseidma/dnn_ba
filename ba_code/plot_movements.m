%
% plot_movements.m - plot a single trial and the detected movements, iterate 121 times
%

function [] = plot_movements()

n=121; % number of trials
m=11; % number of movements

for sequence=1:n
        filename='';
        if sequence < 10
                filename='00';
        elseif sequence < 100
                filename ='0';
        end
        filename2=strcat(filename, num2str(sequence),'.txt');
        fprintf('\nloading %s...', filename2);
        data=load(filename2);
        fprintf('loaded %i lines\n', length(data));
        fprintf('loading %s\n',strcat(filename, num2str(sequence),'_timecode.txt'));
        list=load(strcat(filename, num2str(sequence),'_timecode.txt'));
        
        movements=zeros(length(data),1);
        for i=1:m
            movements(list(i,1):list(i,2))=max(max(data))*0.5;
        end
        
        plot(cat(2,data,movements));
        pause(2);
        input('');
end