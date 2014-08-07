# -*- coding: cp1252 -*-
# -------------------------------------------------------
# --- Python.
# --- py_COTAHIST_to_CSV.py - Copia arq de cotação histótica da Bovespa
# --- em formato campo fixo, para o formato CSV.
# --- criado em - jorgearacaty, 4 jan 2014 - 2312.
# --- jorgearacaty, 7 ago 2014 - 1612.
# -------------------------------------------------------
import os
import sys
import csv
#import mp        # --- importa mp.py na mesma pasta.

# --- I am r_asc_w_csv...
# --- Lê arquivo ASCII campos de tamanho fixo sem delimitadores,
# --- com cotações histórica, arquivo baixado do site bovespa e
# --- transcreve para arquivo .csv.
# ------------------
def r_asc_w_csv(nome_arq):
    '''
    Beazley pags, 13, 158. 
    http://www.pythonforbeginners.com/systems-programming/using-the-csv-module-in-python/
    '''
    #print '\nI am r_asc_w_csv...\n'
    file_name = nome_arq + '.txt'

    # --- matriz que define a estrutura do registro.
    # ---
    ahd = [(1,2),(3,10),(11,12),
           (13,24),(25,27),(28,39),
           (40,49),(50,52),(53,56),
           (57,69),(70,82),(83,95),
           (96,108),(109,121),(122,134),
           (135,147),(148,152),(153,170),
           (171,188),(189,201),(202,202),
           (203,210),(211,217),(218,230),
           (231,242),(243,245)]
    
    print 'Abrindo arquivo ->', file_name
    ot = open(nome_arq + '.csv', "wb")
    
    print '\nEscrevendo arquivo ->', nome_arq + '.csv'
    npros = 0
        
    # --- lê e escreve registros csv.
    # -------------------------------
    for line in open(file_name):
        
        registro = ''
        
        for lim in xrange(len(ahd)):    # --- itera nº de campos do reg. vezes.
            
            if lim == 0:
                # --- primeiro campo não tem vírgula na frente.
                registro = registro + line[(-1)+ahd[lim][0]:ahd[lim][1]]
            else:
                registro = registro + ',' + line[(-1)+ahd[lim][0]:ahd[lim][1]]
                
        registro = registro + '\n'
        ot.write(registro)
        # print registro # --- opcional
        npros = npros+1
        
    print '\nprocessados ->', npros, '<- registros'

# --- início padrão.
# ------------------
if __name__ == '__main__':

    print 'Python running... '
    print sys.argv[0]

    #mp.pt_me() # --- chama função em outro arquivo (mp.py).
    
    r_asc_w_csv('COTAHIST_A2013')
    
    print "\nDONE"
    # The_End = raw_input("press any key to go out, thks.\n")






    
