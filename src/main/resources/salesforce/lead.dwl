%dw 2.0
output application/json

var regexEmail = /^[^.][a-zA-Z0-9.!#$%&’*+\/=?^_`{|}~-]+@[a-zA-Z0-9-](?!.*?\.\.)[^_ ; ,<>\/\\]+(?:\.[a-zA-Z0-9-]+)[^.]*$/
fun trunc80 (value) = if((!isEmpty(value)) and (sizeOf(value) > 79)) value[0 to 79] else value
fun trunc255 (value) = if((!isEmpty(value)) and (sizeOf(value) > 254)) value[0 to 254] else value
---
payload map () -> {
	"Id_GFK__c": $.id_ioc as String,
	"LastName": trunc80($.nombre) default "SIN NOMBRE",
	"Nombre_Proyecto_GFK__c": trunc255($.nombre) default "SIN NOMBRE",
    "Street": trunc255($.direccion) default "",
    "Comuna_Zona_de_transporte__c": $.comuna default "",
    "Region__c": $.region default "",
	"Estado_Obra_GFK__c": $.estado_obra default "",
    "Tipo_de_Obra__c": $.tipo default "",
    "VLC_UF_Rango__c": trunc255($.uf_rango) default "",
	"Bdata_n_pisos__c": $.pisos_totales default "",  //########## VALIDAR SOLO NUMERO
	"N_Viviendas_Proyecto__c": $.unidades as String default "",  //########## VALIDAR SOLO NUMERO
	"Bdata_sup_construida__c": $.m2_construidos default "",  //########## VALIDAR SOLO NUMERO
	"Bdata_destino_final__c": trunc255($.destino) default "",
	"Detalles_del_proyecto__c": $.detalle default "",
	"Bdata_inmobiliaria__c": trunc255($.inmo_nombre) default "",
	"VLC_Inmobiliaria_Direccion__c": trunc255($.inmo_direccion) default "",
	"VLC_Inmobiliaria_Comuna__c": trunc255($.inmo_comuna) default "",
	"VLC_Inmobiliaria_Telefono__c": trunc255($.inmo_fono) default "",
	"VLC_Inmobiliaria_Email__c": $.inmo_email default "",  //########## VALIDAR SOLO EMAIL
	"VLC_Inmobiliaria_Gerente__c": trunc255($.inmo_gte) default "",
	"VLC_Inmobiliaria_Email_Gerente__c": if($.inmo_gte_email matches regexEmail) $.inmo_gte_email else "",  //########## VALIDAR SOLO EMAIL
    "VLC_CompaniaArquitectoGFK__c": trunc255($.arq_comp_nombre) default "",
    "Company": trunc255($.arq_comp_nombre) default "",
    "Bdata_telefono_arquitecto__c": trunc255($.arq_comp_telefono) default "",
    "Email": if($.arq_comp_email matches regexEmail) $.arq_comp_email else "",
	"Bdata_arquitecto__c": trunc255($.arq_nombre) default "",
    "Bdata_email_arquitecto__c": if($.arq_email matches regexEmail) $.arq_email else "",
    "VLC_Nombre_segundo_Arquitecto__c": trunc255($.arq_nombre1) default "",
	"VLC_Email_segundo_Arquitecto__c": if($.arq_email1 matches regexEmail) $.arq_email1 else "",
	"VLC_Nombre_tercer_Arquitecto__c": trunc255($.arq_nombre2) default "",
	"VLC_Email_tercer_Arquitecto__c": if($.arq_email2 matches regexEmail) $.arq_email2 else "",
	"Bdata_constructora__c": trunc255($.const_nombre) default "",
	"VLC_Constructora_Email__c": if($.const_email matches regexEmail) $.const_email else "",
	"VLC_Constructora_Jefe_Adq__c": trunc255($.const_adq_nombre) default ""
}