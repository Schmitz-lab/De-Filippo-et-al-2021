function plot_figure_1

%% spikes
figure

color_1=[0 0 0] ;
color_2=[243/255 152/255 129/255]; %fenfluramine
color_3=[234/255 82/255 126/255]; %MDMA

hold on

%control

path="C:\Users\Roberto\Documents\De_Filippo_et_al_2021\Figure 1\control";


n={};
n{end+1} = fullfile(path,"1");
n{end+1}=fullfile(path,"2");
n{end+1} = fullfile(path,"3");
n{end+1} = fullfile(path,"4");
n{end+1} = fullfile(path,"5");


spikesovertimesum=[];
rec_length=30;%minutes
for i=1:numel(n)
    
    cd (n{i});
    
    sp = loadKSdir(pwd);
    
    [spikesovertime,edges] = histcounts(sp.st,0:60:rec_length*60);
    
    spikesovertime=spikesovertime/mean(spikesovertime(1:5));
    spikesovertime=interp(spikesovertime,20);
    spikesovertimesum(i,:)=spikesovertime;
    
    
end


shadedErrorBar(1:numel (spikesovertimesum(1,:)),nanmean( spikesovertimesum),...
    nanstd( spikesovertimesum)/sqrt(numel( spikesovertimesum(:,1))),'lineprops',{'color',  color_1})


%fenf

path="C:\Users\Roberto\Documents\De_Filippo_et_al_2021\Figure 1\fenfluramine";


n={};
n{end+1} = fullfile(path,"1");
n{end+1}=fullfile(path,"2");
n{end+1} = fullfile(path,"3");
n{end+1} = fullfile(path,"4");
n{end+1} = fullfile(path,"5");
n{end+1} = fullfile(path,"6");

spikesovertimesum=[];
for i=1:numel(n)
    
    cd (n{i});
    %
    
    sp = loadKSdir(pwd);
   
    
    [spikesovertime,edges] = histcounts(sp.st,0:60:rec_length*60);
    
    spikesovertime=spikesovertime/mean(spikesovertime(1:5));
    spikesovertime=interp(spikesovertime,20);
    spikesovertimesum(i,:)=spikesovertime;
    
end



shadedErrorBar(1:numel (spikesovertimesum(1,:)),nanmean( spikesovertimesum),...
    nanstd( spikesovertimesum)/sqrt(numel( spikesovertimesum(:,1))),'lineprops',{'color',   color_2})


%MDMA

path="C:\Users\Roberto\Documents\De_Filippo_et_al_2021\Figure 1\mdma";

n={};
n{end+1} = fullfile(path,"1");
n{end+1}=fullfile(path,"2");
n{end+1} = fullfile(path,"3");
n{end+1} = fullfile(path,"4");
n{end+1} = fullfile(path,"5");
n{end+1} = fullfile(path,"6");
n{end+1} = fullfile(path,"7");

spikesovertimesum=[];
for i=1:numel(n)
    
    cd (n{i});
    
    sp = loadKSdir(pwd);
   
    
    [spikesovertime,edges] = histcounts(sp.st,0:60:rec_length*60);
    
    spikesovertime=spikesovertime/mean(spikesovertime(1:5));
    spikesovertime=interp(spikesovertime,20);
    spikesovertimesum(i,:)=spikesovertime;
    
end


shadedErrorBar(1:numel (spikesovertimesum(1,:)),nanmean( spikesovertimesum),...
    nanstd( spikesovertimesum)/sqrt(numel( spikesovertimesum(:,1))),'lineprops',{'color',   color_3})

xlim([0 max(xlim)/30*25])
ylim([0 2])
xticks(0:100:600)
xticklabels(0:5:30)
yticks(0:0.5:2)
yticklabels(0:0.5:30)
ylabel('Normalized spike rate')
xlabel('Time (min)')
makepretty(2)
set(findobj(gcf,'type','axes'),'FontName','Swis721 BT','FontSize',10,'FontWeight','Bold', 'LineWidth', 1.5);

plot([100 100],[0 max(ylim)],'--','Color',[245/255 1/255 1/255],'LineWidth', 1.5)

%% upstates

figure

hold on

% control

path="C:\Users\Roberto\Documents\De_Filippo_et_al_2021\Figure 1\control";

n1 = load(fullfile(path,"1","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n2 =  load(fullfile(path,"2","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n3 =  load(fullfile(path,"3","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n4 =  load(fullfile(path,"4","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n5 = load(fullfile(path,"5","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');

FINAL=[];
FINAL=[n1 n2 n3 n4 n5];
FINAL=clean_from_noisy_events(FINAL);


f=200;

rec_length=30;

FINAL_processed=process_FINAL (FINAL);

upstatesovertimeS=[];

for i=1:numel(FINAL_processed)
    [upstatesovertime,edges] = histcounts(FINAL_processed(i).ii1,1:f*60:rec_length*60*f);
   
    upstatesovertime=interp(upstatesovertime,20);
    upstatesovertimeS(i,:)=upstatesovertime;
    
end

shadedErrorBar(1:numel (upstatesovertimeS(1,:)),nanmean( upstatesovertimeS),...
    nanstd( upstatesovertimeS)/sqrt(numel( upstatesovertimeS(:,1))),'lineprops',{'color',   color_1})


%fenfl

path="C:\Users\Roberto\Documents\De_Filippo_et_al_2021\Figure 1\fenfluramine";

n1 = load(fullfile(path,"1","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n2 =  load(fullfile(path,"2","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n3 =  load(fullfile(path,"3","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n4 =  load(fullfile(path,"4","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n5 = load(fullfile(path,"5","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n6 = load(fullfile(path,"6","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');

FINAL=[];
FINAL=[ n1 n2 n3 n4 n5 n6];
FINAL=clean_from_noisy_events(FINAL);

f=200;

FINAL_processed=FINAL;
FINAL_processed=process_FINAL (FINAL_processed);

upstatesovertimeS=[];

for i=1:numel(FINAL_processed)
    [upstatesovertime,edges] = histcounts(FINAL_processed(i).ii1,1:f*60:rec_length*60*f);
   
    upstatesovertime=interp(upstatesovertime,20);
    upstatesovertimeS(i,:)=upstatesovertime;
    
end


shadedErrorBar(1:numel (upstatesovertimeS(1,:)),nanmean( upstatesovertimeS),...
    nanstd( upstatesovertimeS)/sqrt(numel( upstatesovertimeS(:,1))),'lineprops',{'color',   color_2})
%
% MDMA 1.25 mg/kg

path="C:\Users\Roberto\Documents\De_Filippo_et_al_2021\Figure 1\mdma";

n1 = load(fullfile(path,"1","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n2 =  load(fullfile(path,"2","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n3 =  load(fullfile(path,"3","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n4 =  load(fullfile(path,"4","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n5 = load(fullfile(path,"5","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n6 = load(fullfile(path,"6","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');
n7 = load(fullfile(path,"7","analysiss"),'rec_lenght','ii1','ii2','ii3','ii4','spikeStruct' ,'XY');

FINAL=[];
FINAL=[ n1 n2 n3 n4 n5 n6 n7];
FINAL=clean_from_noisy_events(FINAL);

f=200;

FINAL_processed=FINAL;
FINAL_processed=process_FINAL (FINAL_processed);

upstatesovertimeS=[];

for i=1:numel(FINAL_processed)
    [upstatesovertime,edges] = histcounts(FINAL_processed(i).ii1,1:f*60:rec_length*60*f);
   
    upstatesovertime=interp(upstatesovertime,20);
    upstatesovertimeS(i,:)=upstatesovertime;
    
end

shadedErrorBar(1:numel (upstatesovertimeS(1,:)),nanmean( upstatesovertimeS),...
    nanstd( upstatesovertimeS)/sqrt(numel( upstatesovertimeS(:,1))),'lineprops',{'color', color_3})

xlim([0 max(xlim)/30*25])
ylim([0 max(ylim)])
xticks(0:100:600)
xticklabels(0:5:30)
yticks(0:5:20)

ylabel('Upstates/min')
xlabel('Time (min)')
makepretty(2)
set(findobj(gcf,'type','axes'),'FontName','Swis721 BT','FontSize',10,'FontWeight','Bold', 'LineWidth', 1.5);

plot([100 100],[0 max(ylim)],'--','Color',[245/255 1/255 1/255],'LineWidth', 1.5)
