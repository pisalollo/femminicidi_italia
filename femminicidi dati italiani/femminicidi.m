clear all
close all

data_tot=readcell('femminicidi.xlsx','Sheet','totale','Range','B1:AR36');
isDash = cellfun(@(x) (ischar(x) && strcmp(x,'-')) || (isstring(x) && x == "-") || isequal(x,missing), data_tot);
data_tot(isDash) = {0};

%nums=cell2mat(data);

%anni=cell2mat(data(2,:));
%popolazione_res=cell2mat(data(2,:));%è sbagliata dopo il 2015

omicidi_tot=cell2mat(data_tot(4,:));
omicidi_tot_centomila=cell2mat(data_tot(5,:));

%% Femminicidi
% Data la natura anche mediatica del fenomeno, qui si assume che per 
% femminicio si intende l'omicidio di una donna compiuto da partner o ex
% partner. Questa definizione è arbitraria data la disponibilità dei dati,
% la non omogenea definizione dei femminicidio nè a livello giuridico, nè
% tra stati, nè tra i dati raccolti. Si perderà quindi la parte di
% femminicidi compiuti da terzi sempre per discriminazioni di genere, si
% assume quindi che il fenomeno dei femminicidi è completamente
% rappresentato dall'omicidio e dinamiche di posseso dovute al genere da
% parte dell'uomo verso la donna quando egli è il partner o l'ex. 

anni=[2002:2023];

%% TOTALE

%questi dati inoltre divisi per genere sono disponibili dal 2002-2023

%val assoluti
omicidi_totali=cell2mat(data_tot(18,20:end-2));
omicidi_totali_partner_ex_partner=sum(fillmissing(cell2mat(data_tot(12:13,20:end-2)),"constant",0),1);

%per 100 000
omicidi_totali_100000=cell2mat(data_tot(27,20:end-2));
omicidi_totali_partner_ex_partner_100000=sum(fillmissing(cell2mat(data_tot(21:22,20:end-2)),"constant",0),1);

%perentuale
omicidi_totali_percentuale=cell2mat(data_tot(36,20:end-2)); %chiaramente deve essere 100
omicidi_totali_partner_ex_partner_percentuale=sum(fillmissing(cell2mat(data_tot(30:31,20:end-2)),"constant",0),1);
omicidi_totali_altro_percentuale=-omicidi_totali_partner_ex_partner_percentuale+100;

%% MASCHI

data_maschi=readcell('femminicidi.xlsx','Sheet','maschi','Range','B1:W32');
isDash = cellfun(@(x) (ischar(x) && strcmp(x,'-')) || (isstring(x) && x == "-") || isequal(x,missing), data_maschi);
data_maschi(isDash) = {0};

%val assoluti
omicidi_maschi=cell2mat(data_maschi(12,:));
omicidi_maschi_partner_ex_partner=sum(fillmissing(cell2mat(data_maschi(6:7,:)),"constant",0),1);

%per 100 000
omicidi_maschi_100000=cell2mat(data_maschi(22,:));
omicidi_maschi_partner_ex_partner_100000=sum(fillmissing(cell2mat(data_maschi(16:17,:)),"constant",0),1);

%perentuale
omicidi_maschi_percentuale=cell2mat(data_maschi(32,:)); %chiaramente deve essere 100
omicidi_maschi_partner_ex_partner_percentuale=sum(fillmissing(cell2mat(data_maschi(26:27,:)),"constant",0),1);
omicidi_maschi_altro_percentuale=-omicidi_maschi_partner_ex_partner_percentuale+100;

%% FEMMINE

data_femmine=readcell('femminicidi.xlsx','Sheet','femmine','Range','B1:W32');
isDash = cellfun(@(x) (ischar(x) && strcmp(x,'-')) || (isstring(x) && x == "-") || isequal(x,missing), data_femmine);
data_femmine(isDash) = {0};

%val assoluti
omicidi_femmine=cell2mat(data_femmine(12,:));
omicidi_femmine_partner_ex_partner=sum(fillmissing(cell2mat(data_femmine(6:7,:)),"constant",0),1);

%per 100 000
omicidi_femmine_100000=cell2mat(data_femmine(22,:));
omicidi_femmine_partner_ex_partner_100000=sum(fillmissing(cell2mat(data_femmine(16:17,:)),"constant",0),1);

%perentuale
omicidi_femmine_percentuale=cell2mat(data_femmine(32,:)); %chiaramente deve essere 100
omicidi_femmine_partner_ex_partner_percentuale=sum(fillmissing(cell2mat(data_femmine(26:27,:)),"constant",0),1);
omicidi_femmine_altro_percentuale=-omicidi_femmine_partner_ex_partner_percentuale+100;


figure(2) % per 100 000 totali
plot( ...
    anni,omicidi_totali_100000,'k', ...
    anni,omicidi_maschi_100000,'blue', ...
    anni,omicidi_femmine_100000,'r');
title('tasso omicidi per totale, maschi e femmine')

figure(3) % per 100 000 da partner/ex partner
plot( ...
    anni,omicidi_totali_partner_ex_partner_100000,'k', ...
    anni,omicidi_maschi_partner_ex_partner_100000,'blue', ...
    anni,omicidi_femmine_partner_ex_partner_100000,'red');
title('tasso omicidi compiuti da partner ed ex partner su totale, maschi e femmine')

figure(4) %percentuali da partner / ex partner
plot( ...
    anni,omicidi_totali_partner_ex_partner_percentuale,'k', ...
    anni,omicidi_maschi_partner_ex_partner_percentuale,'blue', ...
    anni,omicidi_femmine_partner_ex_partner_percentuale,'red');
title('in percentuale:  omicidi compiuti da partner ed ex partner')
