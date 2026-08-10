%dw 2.0
output application/json
---
{
	"source": "GFK",
	"data": payload map () -> {
		"Id_GFK__c": $.id_ioc as String default "",
        "LastName": $.nombre as String default "",
        "Nombre_Proyecto_GFK__c": $.nombre as String default "",
        "Estado_Obra_GFK__c": $.estado_obra as String default "",
        "Tipo_de_Obra__c": $.tipo as String default "",
        "Bdata_n_pisos__c": $.pisos_totales as String default "",
        "N_Viviendas_Proyecto__c": $.unidades as String default "",
        "Bdata_destino_final__c": $.destino as String default "",
        "Detalles_del_proyecto__c": $.detalle as String default "",
        "Bdata_arquitecto__c": $.arquitecto as String default "",
        "Bdata_telefono_arquitecto__c": $.telefono as String default "",
        "VLC_CompaniaArquitectoGFK__c": $.compania_arquitecto as String default "",
        "Company": $.compania_arquitecto as String default "",
        "Bdata_email_arquitecto__c": $.email as String default "",
        "Email": $.email as String default "",
        "Street": $.direccion as String default "",
        "Comuna_Zona_de_transporte__c": $.comuna as String default "",
        "Region__c": $.region as String default ""
	}
}