<?php
// Heading
$_['heading_title']         = 'Xtensions Customizar Campos';

// Text
$_['text_success']          = 'Sucesso: Você modificou o Customizar Campos!';
$_['text_list']             = 'Xtensions Customizar Campos Lista';
$_['text_add']              = 'Adicionar Xtensions Campo Customizado';
$_['text_edit']             = 'Editar Xtensions Campo Customizado';
$_['text_choose']           = 'Escolher';
$_['text_select']           = 'Select';
$_['text_radio']            = 'Radio';
$_['text_checkbox']         = 'Checkbox';
$_['text_input']            = 'Input';
$_['text_text']             = 'Text';
$_['text_textarea']         = 'Textarea';
$_['text_file']             = 'File';
$_['text_date']             = 'Date';
$_['text_datetime']         = 'Date &amp; Time';
$_['text_time']             = 'Time';
$_['text_account']          = 'Conta';
$_['text_address']          = 'Endereço';
$_['button_custom_field_value_add'] = 'Adicionar Opção';
$_['button_add'] = 'Adicionar';
$_['text_confirm'] = "Tem certeza de que deseja excluir. Esta operação não pode ser desfeita. Pressione OK para apagar, cancelar para manter.";

// Column
$_['column_name']           = 'Campo Customizado Nome';
$_['column_location']       = 'Local';
$_['column_type']           = 'Tipo';
$_['column_sort_order']     = 'Ordem';
$_['column_action']         = 'Ação';

// Entry
$_['entry_name']            = 'Campo Customizado Nome';
$_['entry_location']        = 'Local';
$_['entry_type']            = 'Tipo';
$_['entry_value']           = 'Valor Padrão'; 
$_['entry_custom_value']    = 'Campo Customizado Valor Nome';
$_['entry_customer_group']  = 'Grupo de Cliente';
$_['entry_required']        = 'Requerido';
$_['entry_status']          = 'Status';
$_['entry_sort_order']      = 'Ordem';
$_['entry_sort_order']      = 'Ordem';
$_['entry_attributes']      = 'Mais Atributos';
$_['entry_visibility']      = "Campos Customizados Visibilidade";

$_['entry_isnumeric']      = 'Campo Número';
$_['entry_validation']      = 'Validation';
$_['help_regex']            = 'Use regex. E.g: /[a-zA-Z0-9_-]/';
$_['entry_identifier']      = 'Campo Identificador';
$_['entry_identifier_help'] = "Identificador deve ser alfabética Inglês, não numérico, sem texto espaço e é usado para recuperar campos personalizados durante check-out, se necessário, para pagamentos e de envio de API. Este campo é obrigatório";
$_['entry_mask']    		= 'Máscara para o Campo';
$_['entry_mask_help']	= 'Para áreas como CPF, CNPJ etc você pode precisar de mascaramento e você pode usar a colocar o padrão de máscara como (99,999-99) (Apenas para campos de tipo texto)';
$_['entry_minimum']  			= 'Comprimento Mínimo';
$_['entry_maximum']        		= 'Comprimento Máximo';
$_['char_help1']  			= 'Deixar Campo em branco, se usar máscara';
$_['char_help2']       		= 'Para comprimento fixo, colocado no mesmo número mínimo e máximo';
$_['entry_history']         = 'Histórico de Pedidos (Clientes)';
$_['entry_list']      		= 'Lista de Endereços';
$_['entry_email']      		= 'E-mails Pedidos';
$_['entry_invoice']      	= 'Faturas dos Pedidos';
$_['entry_tips']      		= 'Ferramenta de Dicas (Se houver)';
$_['entry_error']      		= 'Mensagem de Erro';
$_['entry_error_help']     	= 'Se o campo é requerido para pelo menos um grupo de clientes';
// Help
$_['help_sort_order']       = 'Use menos para contar para trás a partir do último campo no conjunto.';
$_['important_note']       = 'Notas Importantes';
$_['address_message']       = 'Para exibir campos de endereço em formatos de endereço, definir address_format em Configurações de Melhor Caixa módulo usando identificador de campo na guia Caixa Diversos';
$_['fields_retreival1']      = "1) To retrieve account Custom field in payment or shipping methods modules during checkout, call this \$this->session->data['customer']['custom_field']['defined_identifier']";
$_['fields_retreival2']      = "2) To retrieve payment address Custom field in payment methods modules during checkout, call this \$this->session->data['payment']['custom_field']['defined_identifier']";
$_['fields_retreival3']      = "3) To retrieve shipping address Custom field in shipping methods modules during checkout, call this \$this->session->data['shipping']['custom_field']['defined_identifier']";

// Error
$_['xerror_permission']      = 'Atenção: Você não tem permissão para modificar campos personalizados!';
$_['xerror_name']            = 'Campo Customizado deve ser entre 1 e 128 caracteres!';
$_['xerror_type']            = 'Aviso: Campo Customizado precisa de um valor!';
$_['xerror_custom_value']    = 'Campo nome, deve ser entre 1 e 128 caracteres!';
$_['xerror_error']           = 'Você deve definir uma mensagem de erro para um campo obrigatório!';
$_['xerror_identifier']      = 'Identificador é obrigatório, sem espaços e entre 1 e 30 caracteres!';