
procedure BitBtn1OnClick(Sender: TfrxComponent);
begin

//TIPO DE RELATORIO SINTETICO/ANALITICO                                                                                   
    if rbSintetico.Checked then
    begin
        pgSintetico.Visible := true;
        page1.Visible := false;                                   
    end;

    if rbAnalitico.Checked then
    begin
        pgSintetico.Visible := False;
        page1.Visible := False;        
        page2.Visible := True;                 
    end;
    
//TIPO DE LANCAMENTO PAG/REC                                                                  
    if RbPagar.Checked then
    begin
        qry_lancamentos.SQL.Add(
                'AND LAN.PAGREC = ''A PAGAR''');

        mm_tiporelatorio.Text := 'Contas a Pagar';                                
    end;
    
    if RbReceber.Checked then
    begin
        qry_lancamentos.SQL.Add(
                'AND LAN.PAGREC = ''A RECEBER''');
                
        mm_tiporelatorio.Text := 'Contas a Receber';        
    end;        
//--        
  
 //TIPO DE PERIODO/DATA                                                                    
  if rb_geracao.Checked then
  begin
    qry_lancamentos.SQL.Add('AND LAN.DATAGERACAO BETWEEN ''' + 
       mk_datainicial.Text + ''' AND ''' + mk_datafinal.Text + '''');
    mm_periodo.Text := 'Periodo de Geração: ' + mk_datainicial.Text + ' até ' + mk_dataFinal.Text;
  end;
    
  if rb_vencimento.Checked then
  begin
    qry_lancamentos.SQL.Add('AND LAN.DATAVENCIMENTO BETWEEN ''' + 
       mk_datainicial.Text + ''' AND ''' + mk_datafinal.Text + '''');
    mm_periodo.Text := 'Periodo de Vencimento: ' + mk_datainicial.Text + ' até ' + mk_dataFinal.Text;
  end;
    
  if rb_pagamento.Checked then
  begin
    qry_lancamentos.SQL.Add('AND PAG.DATA BETWEEN ''' + 
       mk_datainicial.Text + ''' AND ''' + mk_datafinal.Text + '''');
    mm_periodo.Text := 'Periodo de Pagamento: ' + mk_datainicial.Text + ' até ' + mk_dataFinal.Text;
  end;        
//--

//DEMAIS FILTROS                                       
  if not ck_cliforn.Checked then
  begin
    qry_lancamentos.SQL.Add('AND LAN.CODFORNECEDOR = ' + FloatToStr(cb_cliforn.KeyValue));
    mm_filtro_cliente.Text := 'Cliente: ' + cb_cliforn.Text;                                                                                                            
  end;            

  if not ck_centro_custo.Checked then
  begin
    qry_lancamentos.SQL.Add('AND LAN.CENTROCUSTO = ' + FloatToStr(cb_centro_custo.KeyValue));
    mm_filtro_centrocusto.Text := 'Centro de Custo: ' + cb_centro_custo.Text;                
  end;

  if not ck_eventofinanceiro.Checked then                                                                                   
  begin
    qry_lancamentos.SQL.Add('AND LAN.EVENTOFINANCEIRO = ' + FloatToStr(cb_eventofinanceiro.KeyValue));
    mm_eventofianceiro.Text := 'Evento Financeiro: ' + cb_eventofinanceiro.Text;                                                                                                                        
  end;              

  if not ck_lancamento.Checked then
  begin
    qry_lancamentos.SQL.Add('AND LAN.CODTIPODOC = ' + FloatToStr(cb_lancamento.KeyValue));
    
    if cb_lancamento.KeyValue = 19 then
    begin
      qry_lancamentos.SQL.Add('OR LAN.NUMERODOCUMENTO LIKE ''%RECIBO%''');
    end;
    
    mm_filtro_lancamento.Text := 'Tipo de Documento: ' + cb_lancamento.Text;
  end;

  if not ck_movimento.Checked then
  begin
    qry_lancamentos.SQL.Add(
       ' AND LAN.CODMOV IN ( '+ 
       ' SELECT CODIGO FROM MOVIMENTACOES WHERE CODTIPOMOV = ( ' +
       ' SELECT CODTIPOMOV FROM TIPOMOVIMENTO WHERE CODIGO = '   +
       FloatToStr(cb_movimento.KeyValue) + ' )) ' + );    
    mm_filtro_movimento.Text := 'Tipo de Movimento: ' + cb_movimento.Text;          
  end;

  if not ck_status.Checked then
  begin
    qry_lancamentos.SQL.Add('AND LAN.STATUS = ' + '''' + cb_status.Text + '''');
    mm_filtro_status.Text := 'Status: ' + cb_status.Text;        
  end;
//--        

    
  qry_lancamentos.SQL.Add(
    'ORDER BY GCC.CODIGO, LAN.DATAVENCIMENTO, PAG.DATA, LAN.DATAGERACAO, LAN.CODFORNECEDOR');
  ShowMessage(qry_lancamentos.SQL.Text);                                                               
end;

procedure DialogPage1OnShow(Sender: TfrxComponent);
begin
  mk_datainicial.Text := FormatDateTime('01/mm/yyyy', now);                                                      
  mk_datafinal.Text := DateToStr(now());  
end;    
        
procedure cb_clifornOnClick(Sender: TfrxComponent);
begin
  ck_cliforn.Checked := false;                                                         
end;

procedure cb_centro_custoOnClick(Sender: TfrxComponent);
begin
  ck_centro_custo.Checked := false;         
end;

procedure cb_eventofinanOnClick(Sender: TfrxComponent);
begin
  ck_eventofinanceiro.Checked := false;                                                                                 
end;    

procedure cb_lancamentoOnClick(Sender: TfrxComponent);
begin
  ck_lancamento.Checked := false;         
end;

procedure cb_movimentoOnClick(Sender: TfrxComponent);
begin
  ck_movimento.Checked := false;         
end;
      
procedure cb_statusOnClick(Sender: TfrxComponent);
begin
  ck_status.Checked := false;                                                                
end;                         

begin

end.