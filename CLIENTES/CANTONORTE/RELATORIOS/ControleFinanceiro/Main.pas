procedure btnOkOnClick(Sender: TfrxComponent);
begin

// RADIO-BUTTONS
    if rbSintetico.Checked then
    begin
        Page1.Visible := True;
        Page2.Visible := False;
    end
    else if rbAnalitico.Checked then
        begin
            Page2.Visible := True;
            Page1.Visible := False;
        end;


    if rbApagar.Checked then
    begin
        mmTipoConta.Text := 'Contas a Pagar/Pagas';
        ADOQuery1.SQL.Add( 'AND LAN.PAGREC = ''A PAGAR''' );
    end
    else if rbAreceber.Checked then
        begin
            mmTipoConta.Text := 'Contas a Receber/Recebidas';
            ADOQuery1.SQL.Add( 'AND LAN.PAGREC = ''A RECEBER''' );                        
        end;


    if rbDataLanc.Checked then
    begin
        mmPeriodo.Text := 'Periodo de Lançamento: ' 
            + mkDataInicial.Text + ' até ' + mkDataFinal.Text;

        ADOQuery1.SQL.Add( 'AND LAN.DATAGERACAO BETWEEN '''
            + mkDataInicial.Text
            + ''' AND '''
            + mkDataFinal.Text
            +''''
        );
    end
    else if rbDataPgto.Checked then
        begin
            mmPeriodo.Text := 'Periodo de Pagamento: ' 
                + mkDataInicial.Text + ' até ' + mkDataFinal.Text;

            ADOQuery1.SQL.Add( 'AND PAG.DATA BETWEEN '''
                + mkDataInicial.Text
                + ''' AND '''
                + mkDataFinal.Text
                +''''
            );                 
        end
        else if rbDataVcto.Checked then
            begin
                mmPeriodo.Text := 'Periodo de Vencimento: ' 
                    + mkDataInicial.Text + ' até ' + mkDataFinal.Text;
                
                ADOQuery1.SQL.Add( 'AND LAN.DATAVENCIMENTO BETWEEN '''
                    + mkDataInicial.Text
                    + ''' AND '''
                    + mkDataFinal.Text
                    +''''
                );
            end;
//--

// FILTROS
    if not ckCentroCusto.Checked then
    begin
        mmCentroCusto.Text := 'Centro de Custos: ' + cbCentroCusto.Text;
        ADOQuery1.SQL.Add( ''    
        
        );
    end;

    if not ckClienteFornecedor.Checked then
    begin
        mmClienteFornecedor.Text := 'Cliente: ' + cbClienteFornecedor.Text;
        ADOQuery1.SQL.Add( ''    
        
        );
    end;

    if not ckTipoLancamento.Checked then
    begin
        mmTipoLancamento.Text := 'Tipo Lancamento: ' + cbTipoLancamento.Text;
        ADOQuery1.SQL.Add( ''    
        
        );
    end;

    if not ckTipoMovimento.Checked then
    begin
        mmTipoMovimento.Text := 'Tipo Movimento: ' + cbTipoMovimento.Text;
        ADOQuery1.SQL.Add( ''    
        
        );
    end;

    if not ckTipoPagamento.Checked then
    begin
        mmTipoPagamento.Text := 'Tipo Pagamento: ' + cbTipoPagamento.Text;
        ADOQuery1.SQL.Add( ''       
        
        );
    end;

    if not ckEventoFinanceiro.Checked then
    begin
        mmEventoFinanceiro.Text := 'Evento Financeiro: ' + cbEventoFinanceiro.Text;
        ADOQuery1.SQL.Add( ''       
        
        );
    end;

    if not ckStatusLancamento.Checked then
    begin
        mmStatusLancamento.Text := 'Status: ' + cbStatusLancamento.Text;
        ADOQuery1.SQL.Add( ''    
        
        );
    end;
//--

    ADOQuery1.SQL.Add( ' GROUP BY '
        + ' LAN.PAGREC, '
        + ' LAN.STATUS, '

        + ' LAN.CODIGO, '
        + ' LAN.CODMOV, '
        + ' MOV.CODIGO, '
        + ' MOV.IDMOV, '
        + ' LAN.NUMERODOCUMENTO, '

        + ' LAN.CODTIPODOC, '
        + ' TPD.DESCRICAO, '

        + ' MOV.CODTIPOMOV, '
        + ' TMV.DESCRICAO, '

        + ' PAG.CODTIPOPGTO, '
        + ' TPG.DESCRICAO, '

        + ' LAN.EVENTOFINANCEIRO,  '
        + ' EVF.DESCRICAO, '

        + ' CLI.CODIGO, '
        + ' CLI.RAZAO, '
        + ' CLI.PESFISOUJUR, '
        + ' CLI.CGCCFO, '
        + ' CLI.CNPJ, '

        + ' LAN.CENTROCUSTO, '
        + ' MOV.CODCENTROCUSTO, '
        + ' MVR.CODIGO_CENTROCUSTO, '

        + ' GCC.ABREVIATURA, '
        + ' GCC.NOME, '
        + ' GCC.CODIGO, '              

        + ' LAN.DATAGERACAO, '
        + ' MOV.DATAGERACAO, '
        + ' LAN.DATAVENCIMENTO, '
        + ' PAG.DATA, '

        + ' LAN.VALORORIGINAL, '
        + ' LAN.ACRESCIMO, '
        + ' LAN.DESCONTO, '

        + ' TMV.USA_RATEIO_CCUSTO, '
        + ' MVR.PERCENTUAL, '

        + ' AGB.VALOR '        
    );

    ADOQuery1.SQL.Add( ' ORDER BY GCC.CODIGO ' );

    ShowMessage(ADOQuery1.SQL.Text);                                              
      
end;  

procedure DialogPage1OnShow(Sender: TfrxComponent);
begin
    mkDataInicial.Text := FormatDateTime('01/mm/yyyy', now);
    mkDataFinal.Text := FormatDateTime('30/mm/yyyy', now);
end;

procedure MasterData1OnAfterPrint(Sender: TfrxComponent);
begin
    if Frac(<Line> / 2) = 0.5 then
    begin              
        ADOQuery1DGL.Color := $00EBEBEB;        
        ADOQuery1DATAVENCIMENTO.Color := $00EBEBEB;
        ADOQuery1DATAPAGAMENTO.Color := $00EBEBEB;
        ADOQuery1NUMERODOC.Color := $00EBEBEB;        
        ADOQuery1CLIFORN.Color := $00EBEBEB;
        ADOQuery1VALORFINAL.Color := $00EBEBEB;
        ADOQuery1VALOR_PAG_REC.Color := $00EBEBEB;              
        mmValorPagoRec.Color := $00EBEBEB;          
    end            
    else
    begin
        ADOQuery1DGL.Color := clWhite;       
        ADOQuery1DATAVENCIMENTO.Color := clWhite;
        ADOQuery1DATAPAGAMENTO.Color := clWhite;
        ADOQuery1NUMERODOC.Color := clWhite;        
        ADOQuery1CLIFORN.Color := clWhite;
        ADOQuery1VALORFINAL.Color := clWhite;
        ADOQuery1VALOR_PAG_REC.Color := clWhite;              
        mmValorPagoRec.Color := clWhite;    
    end;  
end;  

procedure cbCentroCustoOnClick(Sender: TfrxComponent);
begin
    ckCentroCusto.Checked := False;
end;

procedure cbClienteFornecedorOnClick(Sender: TfrxComponent);
begin
    ckClienteFornecedor.Checked := False;
end;

procedure cbTipoLancamentoOnClick(Sender: TfrxComponent);
begin
    ckTipoLancamento.Checked := False;
end;

procedure cbTipoMovimentoOnClick(Sender: TfrxComponent);
begin
    ckTipoMovimento.Checked := False;
end;

procedure cbTipoPagamentoOnClick(Sender: TfrxComponent);
begin
    ckTipoPagamento.Checked := False;
end;

procedure cbEventoFinanceiroOnClick(Sender: TfrxComponent);
begin
    ckEventoFinanceiro.Checked := False;
end;

procedure cbStatusLancamentoOnClick(Sender: TfrxComponent);
begin
    ckStatusLancamento.Checked := False;
end;





begin
  
end.