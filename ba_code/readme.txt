Forearm EMG 121 Data Set


- Motivation -

The experiment was designed to investigate long-term EMG effects on classification algorithms. To this, a male non-amputee subject recorded for 21 days, five to six times a day, eleven hand movements: 1) extension 2) flexion 3) ulnar deviation 4) radial deviation 5) pronation 6) supination 7) open 8) close 9) key grip 10) pincer grip and 11) extract index finger. To approximate real-world conditions, recordings were taken under various subject conditions: after periods of high and low physical activity, after sleep and meals,... In each of the 121 trials the movement sequence is recorded once. Each movement starts with a relaxation phase of about 4 seconds followed by a contraction phase that lasts for about 5 seconds. For EMG data acquisition, a MindMedia Nexus 10 Biofeedback System has been used. It recorded four EMG sensor channels with 24 bit resolution at a sampling rate of 2048 Hz. The electrodes have been placed on the top, bottom, medial, and lateral sides of the forearm with the reference at the wrist. A posterior analysis shows that the energy of class 10 (pincer grip) grows considerably over the trials. Thus, this class shouldn't be used for experiments. 

Please refer to at least one of the mentioned references below, when using the data. The author would appreciate sending him a copy of your work with new results using the 'Forearm EMG 121' data.


- References -

P. Kaufmann, K. Englehart, and M. Platzner. Fluctuating EMG Signals: Investigating Long-term Effects of Pattern Matching Algorithms. In 32nd Intl. Conf. of the IEEE Engineering in Medicine and Biology Society (EMBC), pages 6357–6360. IEEE, 2010.

A. Boschmann, P. Kaufmann, M. Platzner, and M. Winkler. Towards Multi-movement Hand Prostheses: Combining Adaptive Classification with High Precision Sockets. In Technically Assisted Rehabilitation (TAR), 2009.


- Data format -

The data of a single trial is stored in a separate text file. Each line contains four numerical values, corresponding to four EMG signal channels. The sampling rate is 2048Hz. The 'timecode' file comprises movements start and stop times. The first number in the first line indicates the start of 'extension'. The second number in the first line indicates 'extension's' finishing. The second line proceeds with the 'flexion' movement.


- Matlab code -

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
