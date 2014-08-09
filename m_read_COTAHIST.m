% ------------------------------------------------
% --- Matlab/Octave
% --- m_read_COTAHIST.m - Lê cotações históricas da bovespa,
% --- em arquivo com formato CSV.
% --- criado em - jorgearacaty, 4 jan 2014 - 2312.
% --- jorgearacaty, 7 ago 2014 - 1712.
% ------------------------------------------------

clear, clc
nome_programa = 'm_read_COTAHIST.m';
fprintf('\n------------------------------------------');
fprintf('\n--- programa: %s',nome_programa);
fprintf('\n------------------------------------------\n');

% --- cria a matriz simbolos a partir to arquivo criado pelo Excel.
while (true)
    
    break
    
    % cria a matriz simbolos a partir to arquivo criado pelo Excel.
    simbol_file_name = 'simbolos_papeis_bovespa_excel.txt';
    
    % P = fileread(file_name);
    
    [simbolos]=textread(simbol_file_name, '%s','delimiter',',')
    break
    
end

% ---
% http://nf.nci.org.au/facilities/software/Matlab/techdoc/ref/textread.html
% http://stackoverflow.com/questions/12026680/textread-not-working-with-txt
% -file-in-matlab
% http://www.fkm.utm.my/~mohsin/sme1013/03.matlab/cs111_matlab_io.pdf
% ---
%    '%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s
%    %s %s %s' ...

filename = 'COTAHIST_A2013.csv';

[tipreg,dtpreg,codbdi,codneg,tpmerc,nomres,especi,prazot,modref, ...
        preabe, premax, premin, premed, preult, preofc, preofv, ...
        f17,f18,f19,f20,f21,f22,f23,f24,f25,f26] = ...
        textread(filename,...
    '%s %s %s %s %s %s %s %s %s %d %d %d %d %d %d %d %s %s %s %s %s %s %s %s %s %s' ...
        ,'delimiter',',');

% z = [premax/100 premin/100 premax/100-premin/100]

t=(premax-premin);
y = [premax premin premax-premin];
length(t);
size(y);

[a b] = max(t);     % --- get valor máximo e endereço do maior preço.
fprintf('\n %s <-> %d <-> %d',nomres{b}, premax(b), premin(b))
fprintf('\n+++++++')
fprintf('\n %s <-> %d <-> %s',nomres{b}, t(b), dtpreg{b})
fprintf('\n+++++++')

search = ismember(codneg, 'BOVA11');
Final = [dtpreg(search) codneg(search)]
%ext2_dtpreg = dtpreg(search)
%ext2_codneg = codneg(search)
for i = 1 : sum(search)
    fprintf('%s ', Final{i,:} );
    fprintf('\n');
end
sum(search)
length(codneg(search))


while (true)
    break
codneg{b}
no_extract = sum(ismember(codneg, codneg{b}))

i = ismember(codneg, codneg(b));
% --- cria matriz com dados relevantes
ext_codneg = codneg(i);
ext_dtpreg = dtpreg(i);

% (help) ------------------------------------------------------------------
% http://stackoverflow.com/questions/14214154/write-cell-array-of-combined-string-and-numerical-input-into-text-file
% ---
spaceGhost = repmat('-',size(ext_codneg),1);
Final = [ext_dtpreg ext_codneg];
for i = 1 : size(Final,1)
    fprintf('%s ', Final{i,:} );
    fprintf('\n');
end
break
end




%fprintf('\n>%s< >%s<',ext_dtpreg ,ext_codneg)

%nb = length(ext_codneg)

%ext_dtpreg{[1:nb]}


%fprintf('%s %s\n',ext_dtpreg{[1:nb]},ext_codneg{[1:nb]})

%for i = 1:length(ext_codneg)
%    fprintf('\n>%s< >%s<',ext_dtpreg(i) ,ext_codneg(i))
%end

%fprintf('%d %s\n',[1:nb],Names{[1:nb]})













while (true)
break
nomres(2)
for inx = 1:length(nomres)
    
    % --- lista ações do segundo registro APPLE.
   
    if nomres{inx} == nomres{2}
        fprintf('\n %s <-> %d <-> %d <-> %s %s', ...
            nomres{inx},premax(inx),premin(inx),dtpreg{inx},codneg{inx})
    end
	
end
break
end



length(t);
mean(t);
sum(t);

% --- cria matriz sem duplicação a partir da nomres e codneg.
% ---
orion = unique(nomres);
orion = orion(3:length(orion));

sirius = unique(codneg);            % --- retira símbolos duplicados.
sirius = sirius(2:length(sirius));  % --- retira headers.



%fprintf('max %.2f    min %.2f    dif %.2f    ultimo %.2f\n',premax/100, ...
%    premin/100,(premax-premin)/100,preult/100);
    
fprintf('\n\n------------------------------------------');
fprintf('\n--- fim do programa: %s',nome_programa);
fprintf('\n------------------------------------------\n');

return 

%         repmat('%s',[1 26])...
%         y = [premax premin repmat(999,[length(t) 1])]
