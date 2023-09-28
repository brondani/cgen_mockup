[#ftl]
[#list configs as dt]
[#assign data = dt]
[#assign peripheralParams = dt.peripheralParams]
[#assign peripheralGPIOParams = dt.peripheralGPIOParams]
[#assign peripheralDMAParams = dt.peripheralDMAParams]
[#assign peripheralNVICParams = dt.peripheralNVICParams]
[#assign usedIPs = dt.usedIPs]
[#assign ipsInfoPerContext = dt.ipsInfoPerContext]
[#assign ipArray = ["empty"]]
/******************************************************************************
 * File Name   : MX_Device.h
 * Date        : ${date}
 * Description : STM32Cube MX parameter definitions
 * Note        : This file is generated by STM32CubeMX (DO NOT EDIT!)
 ******************************************************************************/

#ifndef __MX_DEVICE_H
#define __MX_DEVICE_H


/*---------------------------- Clock Configuration ---------------------------*/

[#list [
    "LSI_VALUE",
    "LSIDIV_VALUE",
    "LSE_VALUE",
    "HSI_VALUE",
    "HSICalibrationValue",
    "HSE_VALUE",
    "SYSCLKFreq_VALUE",
    "HCLKFreq_Value",
    "FCLKCortexFreq_Value",
    "CortexFreq_Value",
    "AHBFreq_Value",
    "APB1Freq_Value",
    "APB2Freq_Value",
    "APB1TimFreq_Value",
    "APB2TimFreq_Value",
    "ADCFreq_Value",
    "I2C1Freq_Value",
    "I2C2Freq_Value",
    "I2C3Freq_Value",
    "MSI_VALUE",
    "SPI1Freq_Value",
    "SPI2Freq_Value",
    "SPI3Freq_Value",
    "USBFreq_Value",
    "WatchDogFreq_Value",
    "LPTIM1Freq_Value",
    "LPTIM2Freq_Value",
    "RTCFreq_Value",
    "MCO1PinFreq_Value",
    "CRSFreq_Value",
    "SWPMI1Freq_Value",
    "SAI1Freq_Value",
    "SAI2Freq_Value",
    "LPUART1Freq_Value",
    "UART4Freq_Value",
    "UART5Freq_Value",
    "USART1Freq_Value",
    "USART2Freq_Value",
    "USART3Freq_Value"
  ] as key]
[#if peripheralParams.get("RCC").get(key)??]
[@CreateDefine name=key value=peripheralParams.get("RCC").get(key)/]
[/#if]
[/#list]

[#list usedIPs as ip]
[#list ipsInfoPerContext.entrySet() as keyElem]
[#assign context = keyElem.key]
[#list ipsInfoPerContext.get(context) as ipsInfo]
[#if ipsInfo.isinused == "true"]
[#if ipsInfo.mxipname?contains(ip)]
[#if ipsInfo.mxcontextname?contains("CortexM33NS")]
[#-- ignore IPs which are ignored in FrameworkCubeMX_gpdsc.ftl --]
[#if peripheralParams.get(ip)??]
[#assign skip_ip = 0]
[#list ipArray as i]
  [#if i == ip]
  [#assign skip_ip = 1]
  [/#if]
[/#list]
[#if skip_ip == 0]
[#assign ipArray = [ip] + ipArray]
[#if ip?starts_with("DEBUG")]
[#elseif ip?starts_with("VREFBUF")]
[#-- handle configured IPs --]
[#else]
/*-------------------------------- ${ip?right_pad(10)} --------------------------------*/

[@CreateDefine name=ip value="1"/]

[#if ip?starts_with("GPDMA")]
[#list peripheralParams.get(ip).entrySet() as paramEntry]
[#if paramEntry.key?starts_with("REQUEST_")]
[@CreateDefine name=paramEntry.value?keep_after("REQUEST_")+"_DMA_Instance" value="1"/]
[/#if]
[/#list]
[/#if]
[#if ip?starts_with("LPDMA")]
[#list peripheralParams.get(ip).entrySet() as paramEntry]
[#if paramEntry.key?starts_with("REQUEST_")]
[@CreateDefine name=paramEntry.value?keep_after("REQUEST_")+"_DMA_Instance" value="1"/]
[/#if]
[/#list]
[/#if]
[#if ip?starts_with("USART")]
[#assign vm_none = 1]
[#list peripheralParams.get(ip).entrySet() as paramEntry]
[#if paramEntry.key?starts_with("VirtualMode")]
[#assign vm_none = 0]
[@CreateDefine name=ip+"_VM" value=paramEntry.value/]
[/#if]
[/#list]
[#if vm_none == 1]
[@CreateDefine name=ip+"_VM" value="VM_UNKNOWN"/]
[/#if]
[/#if]
[#if ip?starts_with("UART")]
[#assign irdaFlag = 0]
[#assign asyncFlag = 0]
[#list peripheralParams.get(ip).entrySet() as paramEntry]
[#if paramEntry.key?starts_with("PowerMode") && paramEntry.value?starts_with("IRDA")]
[#assign irdaFlag = 1]
[#elseif paramEntry.key?starts_with("BaudRate")]
[#assign asyncFlag = 1]
[/#if]
[/#list]
[#if irdaFlag == 1]
[@CreateDefine name=ip+"_VM" value="VM_IRDA"/]
[#elseif asyncFlag == 1]
[@CreateDefine name=ip+"_VM" value="VM_ASYNC"/]
[#else]
[@CreateDefine name=ip+"_VM" value="VM_UNKNOWN"/]
[/#if]
[/#if]
[#if ip?starts_with("USB_OTG")]
[#list peripheralParams.get(ip).entrySet() as paramEntry]
[#if paramEntry.key?starts_with("VirtualMode")]
[#if paramEntry.value?starts_with("Device")]
[@CreateDefine name=ip+"_DEVICE" value="1"/]
[#elseif paramEntry.value?starts_with("Host")]
[@CreateDefine name=ip+"_HOST" value="1"/]
[#else]
[@CreateDefine name=ip+"_DEVICE" value="1"/]
[@CreateDefine name=ip+"_HOST" value="1"/]
[/#if]
[/#if]
[/#list]
[/#if]

[#if peripheralGPIOParams.get(ip)?? && peripheralGPIOParams.get(ip).entrySet()?size > 0]
/* GPIO Configuration */

[#list peripheralGPIOParams.get(ip).entrySet() as gpioParamEntry]
[#assign PinName=gpioParamEntry.value.get("Pin")]
[#if ip == "GPIO"]
[#assign LabelAvailable=0]
[#assign Label=gpioParamEntry.value.get("GPIO_Label")]
[#if (Label?length > 0) && (PinName != Label)]
[#assign LabelAvailable=1]
/* Pin ${PinName} - ${Label} */
[#else]
/* Pin ${PinName} */
[/#if]
[#list gpioParamEntry.value.entrySet() as gpioParam]
[#if gpioParam.value?length > 0]
[#assign ParamValue=gpioParam.value]
[#if     gpioParam.key != "GPIO_Label"]
[#if     gpioParam.key != "Port"]
[@CreateDefine name=PinName+"_"+gpioParam.key value=ParamValue/]
[/#if]
[/#if]
[/#if]
[/#list]
[#if LabelAvailable==1]

[#list gpioParamEntry.value.entrySet() as gpioParam]
[#if gpioParam.value?length > 0]
[#assign ParamValue=gpioParam.value]
[#if     gpioParam.key != "GPIO_Label"]
[#if     gpioParam.key != "Port"]
[@CreateDefine name=Label+"_"+gpioParam.key value="MX_"+PinName+"_"+gpioParam.key/]
[/#if]
[/#if]
[/#if]
[/#list]
[/#if]
[#else]
/* Pin ${PinName} */
[#list gpioParamEntry.value.entrySet() as gpioParam]
[#if gpioParam.value?length > 0]
[#assign ParamValue=gpioParam.value]
[#if     gpioParam.key == "GPIO_Label"]
[#--@CreateDefine name=ParamValue value=gpioParamEntry.key/--]
[#elseif gpioParam.key != "Port"]
[@CreateDefine name=gpioParamEntry.key+"_"+gpioParam.key value=ParamValue/]
[/#if]
[/#if]
[/#list]
[/#if]

[/#list]
[/#if]

[#if peripheralDMAParams.get(ip)?? && peripheralDMAParams.get(ip).entrySet()?size > 0]
/* DMA Configuration */

[#list peripheralDMAParams.get(ip).entrySet() as dmaParamEntry]
/* DMA ${dmaParamEntry.key} */
[#list dmaParamEntry.value.entrySet() as dmaParam]
[@CreateDefine name=dmaParamEntry.key+"_DMA_"+dmaParam.key value=dmaParam.value/]
[/#list]

[/#list]
[/#if]
[#if peripheralNVICParams.get(ip)?? && peripheralNVICParams.get(ip).entrySet()?size > 0]
/* NVIC Configuration */

[#list peripheralNVICParams.get(ip).entrySet() as nvicParamEntry]
/* NVIC ${nvicParamEntry.key} */
[#list nvicParamEntry.value.entrySet() as nvicParam]
[@CreateDefine name=nvicParamEntry.key+"_"+nvicParam.key value=nvicParam.value/]
[/#list]

[/#list]
[/#if]
[/#if]
[/#if]
[/#if]
[/#if]
[/#if]
[/#if]
[/#list]
[/#list]
[/#list]

#endif  /* __MX_DEVICE_H */

[/#list]
[#macro CreateDefine name, value]
[#assign tmpName=name?replace("-","_")]
[#assign tmpName=tmpName?replace(" ","_")]
[#assign tmpName=tmpName?replace(".","_")]
[#assign tmpName=tmpName?replace("/","_")]
[#assign tmpName=tmpName?replace("(","")]
[#assign tmpName=tmpName?replace(")","")]
[#assign tmpName=tmpName?replace("[","")]
[#assign tmpName=tmpName?replace("]","")]
[#assign tmpValue=value?replace("-","_")]
[#assign tmpValue=tmpValue?replace(" ","_")]
[#assign tmpValue=tmpValue?replace(".","_")]
[#assign tmpValue=tmpValue?replace("/","_")]
[#assign tmpValue=tmpValue?replace("(","")]
[#assign tmpValue=tmpValue?replace(")","")]
[#assign tmpValue=tmpValue?replace("[","")]
[#assign tmpValue=tmpValue?replace("]","")]
#define ${("MX_" + tmpName)?right_pad(43)} ${tmpValue}
[/#macro]