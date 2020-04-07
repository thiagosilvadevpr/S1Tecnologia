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

    end
    else if rbAreceber.Checked then
        begin
    
        end;


    if rbDataLanc.Checked then
    begin

    end
    else if rbDataPgto.Checked then
        begin

        end
        else if rbDataVcto.Checked then
            begin

            end;
//--

// FILTROS
    if not ckCentroCusto.Checked then
    begin

    end;

    if not ckClienteFornecedor.Checked then
    begin

    end;

    if not ckTipoLancamento.Checked then
    begin

    end;

    if not ckTipoMovimento.Checked then
    begin

    end;

    if not ckTipoPagamento.Checked then
    begin

    end;

    if not ckEventoFinanceiro.Checked then
    begin

    end;

    if not ckStatusLancamento.Checked then
    begin

    end;
//--




end;  

procedure DialogPage1OnShow(Sender: TfrxComponent);
begin
    mkDataInicial.Text := FormatDateTime('01/mm/yyyy', now);
    mkDataFinal.Text := FormatDateTime('30/mm/yyyy', now);
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