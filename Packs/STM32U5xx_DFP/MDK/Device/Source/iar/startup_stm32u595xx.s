;/******************************************************************************
; * @file     startup_stm32u595xx.s
; * @brief    CMSIS Core Device Startup File for STM32U595xx Device
; * @version  V2.0.0
; * @date     14. March 2023
; ******************************************************************************/
;/*
; * Copyright (c) 2023 Arm Limited. All rights reserved.
; *
; * SPDX-License-Identifier: Apache-2.0
; *
; * Licensed under the Apache License, Version 2.0 (the License); you may
; * not use this file except in compliance with the License.
; * You may obtain a copy of the License at
; *
; * www.apache.org/licenses/LICENSE-2.0
; *
; * Unless required by applicable law or agreed to in writing, software
; * distributed under the License is distributed on an AS IS BASIS, WITHOUT
; * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
; * See the License for the specific language governing permissions and
; * limitations under the License.
; */

;
; The modules in this file are included in the libraries, and may be replaced
; by any user-defined modules that define the PUBLIC symbol _program_start or
; a user defined start symbol.
; To override the cstartup defined in the library, simply add your modified
; version to the workbench project.
;
; The vector table is normally located at address 0.
; When debugging in RAM, it can be located in RAM, aligned to at least 2^6.
; The name "__vector_table" has special meaning for C-SPY:
; it is where the SP start value is found, and the NVIC vector
; table register (VTOR) is initialized to this address if != 0.
;
; Cortex-M version
;

                MODULE  ?cstartup

                ;; Forward declaration of sections.
                SECTION CSTACK:DATA:NOROOT(3)

                SECTION .intvec:CODE:NOROOT(2)

                EXTERN  __iar_program_start
                EXTERN  SystemInit
                PUBLIC  __vector_table
                PUBLIC  __Vectors
                PUBLIC  __Vectors_End
                PUBLIC  __Vectors_Size

                DATA

__vector_table
                DCD     sfe(CSTACK)                      ;     Top of Stack
                DCD     Reset_Handler                    ;     Reset Handler
                DCD     NMI_Handler                      ; -14 NMI Handler
                DCD     HardFault_Handler                ; -13 Hard Fault Handler
                DCD     MemManage_Handler                ; -12 MPU Fault Handler
                DCD     BusFault_Handler                 ; -11 Bus Fault Handler
                DCD     UsageFault_Handler               ; -10 Usage Fault Handler
                DCD     SecureFault_Handler              ;  -9 Secure Fault Handler
                DCD     0                                ;     Reserved
                DCD     0                                ;     Reserved
                DCD     0                                ;     Reserved
                DCD     SVC_Handler                      ;  -5 SVCall Handler
                DCD     DebugMon_Handler                 ;  -4 Debug Monitor Handler
                DCD     0                                ;     Reserved
                DCD     PendSV_Handler                   ;  -2 PendSV Handler
                DCD     SysTick_Handler                  ;  -1 SysTick Handler

                ; Interrupts
                DCD     WWDG_IRQHandler                  ;     Window WatchDog interrupt
                DCD     PVD_PVM_IRQHandler               ;     PVD/PVM through EXTI Line detection interrupt
                DCD     RTC_IRQHandler                   ;     RTC non-secure interrupt
                DCD     RTC_S_IRQHandler                 ;     RTC secure interrupt
                DCD     TAMP_IRQHandler                  ;     Tamper non-secure interrupt
                DCD     RAMCFG_IRQHandler                ;     RAMCFG global
                DCD     FLASH_IRQHandler                 ;     FLASH non-secure global interrupt
                DCD     FLASH_S_IRQHandler               ;     FLASH secure global interrupt
                DCD     GTZC_IRQHandler                  ;     Global TrustZone Controller interrupt
                DCD     RCC_IRQHandler                   ;     RCC non-secure global interrupt
                DCD     RCC_S_IRQHandler                 ;     RCC secure global interrupt
                DCD     EXTI0_IRQHandler                 ;     EXTI Line0 interrupt
                DCD     EXTI1_IRQHandler                 ;     EXTI Line1 interrupt
                DCD     EXTI2_IRQHandler                 ;     EXTI Line2 interrupt
                DCD     EXTI3_IRQHandler                 ;     EXTI Line3 interrupt
                DCD     EXTI4_IRQHandler                 ;     EXTI Line4 interrupt
                DCD     EXTI5_IRQHandler                 ;     EXTI Line5 interrupt
                DCD     EXTI6_IRQHandler                 ;     EXTI Line6 interrupt
                DCD     EXTI7_IRQHandler                 ;     EXTI Line7 interrupt
                DCD     EXTI8_IRQHandler                 ;     EXTI Line8 interrupt
                DCD     EXTI9_IRQHandler                 ;     EXTI Line9 interrupt
                DCD     EXTI10_IRQHandler                ;     EXTI Line10 interrupt
                DCD     EXTI11_IRQHandler                ;     EXTI Line11 interrupt
                DCD     EXTI12_IRQHandler                ;     EXTI Line12 interrupt
                DCD     EXTI13_IRQHandler                ;     EXTI Line13 interrupt
                DCD     EXTI14_IRQHandler                ;     EXTI Line14 interrupt
                DCD     EXTI15_IRQHandler                ;     EXTI Line15 interrupt
                DCD     IWDG_IRQHandler                  ;     IWDG global interrupt
                DCD     0                                ;     Reserved
                DCD     GPDMA1_Channel0_IRQHandler       ;     GPDMA1 Channel 0 global interrupt
                DCD     GPDMA1_Channel1_IRQHandler       ;     GPDMA1 Channel 1 global interrupt
                DCD     GPDMA1_Channel2_IRQHandler       ;     GPDMA1 Channel 2 global interrupt
                DCD     GPDMA1_Channel3_IRQHandler       ;     GPDMA1 Channel 3 global interrupt
                DCD     GPDMA1_Channel4_IRQHandler       ;     GPDMA1 Channel 4 global interrupt
                DCD     GPDMA1_Channel5_IRQHandler       ;     GPDMA1 Channel 5 global interrupt
                DCD     GPDMA1_Channel6_IRQHandler       ;     GPDMA1 Channel 6 global interrupt
                DCD     GPDMA1_Channel7_IRQHandler       ;     GPDMA1 Channel 7 global interrupt
                DCD     ADC1_2_IRQHandler                ;     ADC1, ADC2 global interrupt
                DCD     DAC1_IRQHandler                  ;     DAC1 global interrupt
                DCD     FDCAN1_IT0_IRQHandler            ;     FDCAN1 interrupt 0
                DCD     FDCAN1_IT1_IRQHandler            ;     FDCAN1 interrupt 1
                DCD     TIM1_BRK_IRQHandler              ;     TIM1 Break interrupt
                DCD     TIM1_UP_IRQHandler               ;     TIM1 Update interrupt
                DCD     TIM1_TRG_COM_IRQHandler          ;     TIM1 Trigger and Commutation interrupt
                DCD     TIM1_CC_IRQHandler               ;     TIM1 Capture Compare interrupt
                DCD     TIM2_IRQHandler                  ;     TIM2 global interrupt
                DCD     TIM3_IRQHandler                  ;     TIM3 global interrupt
                DCD     TIM4_IRQHandler                  ;     TIM4 global interrupt
                DCD     TIM5_IRQHandler                  ;     TIM5 global interrupt
                DCD     TIM6_IRQHandler                  ;     TIM6 global interrupt
                DCD     TIM7_IRQHandler                  ;     TIM7 global interrupt
                DCD     TIM8_BRK_IRQHandler              ;     TIM8 Break interrupt
                DCD     TIM8_UP_IRQHandler               ;     TIM8 Update interrupt
                DCD     TIM8_TRG_COM_IRQHandler          ;     TIM8 Trigger and Commutation interrupt
                DCD     TIM8_CC_IRQHandler               ;     TIM8 Capture Compare interrupt
                DCD     I2C1_EV_IRQHandler               ;     I2C1 Event interrupt
                DCD     I2C1_ER_IRQHandler               ;     I2C1 Error interrupt
                DCD     I2C2_EV_IRQHandler               ;     I2C2 Event interrupt
                DCD     I2C2_ER_IRQHandler               ;     I2C2 Error interrupt
                DCD     SPI1_IRQHandler                  ;     SPI1 global interrupt
                DCD     SPI2_IRQHandler                  ;     SPI2 global interrupt
                DCD     USART1_IRQHandler                ;     USART1 global interrupt
                DCD     USART2_IRQHandler                ;     USART2 global interrupt
                DCD     USART3_IRQHandler                ;     USART3 global interrupt
                DCD     UART4_IRQHandler                 ;     UART4 global interrupt
                DCD     UART5_IRQHandler                 ;     UART5 global interrupt
                DCD     LPUART1_IRQHandler               ;     LPUART1 global interrupt
                DCD     LPTIM1_IRQHandler                ;     LPTIM1 global interrupt
                DCD     LPTIM2_IRQHandler                ;     LPTIM2 global interrupt
                DCD     TIM15_IRQHandler                 ;     TIM15 global interrupt
                DCD     TIM16_IRQHandler                 ;     TIM16 global interrupt
                DCD     TIM17_IRQHandler                 ;     TIM17 global interrupt
                DCD     COMP_IRQHandler                  ;     COMP1 and COMP2 through EXTI Lines interrupt
                DCD     OTG_HS_IRQHandler                ;     USB OTG HS global interrupt
                DCD     CRS_IRQHandler                   ;     CRS global interrupt
                DCD     FMC_IRQHandler                   ;     FMC global interrupt
                DCD     OCTOSPI1_IRQHandler              ;     OctoSPI1 global interrupt
                DCD     PWR_S3WU_IRQHandler              ;     PWR wake up from Stop3 interrupt
                DCD     SDMMC1_IRQHandler                ;     SDMMC1 global interrupt
                DCD     SDMMC2_IRQHandler                ;     SDMMC2 global interrupt
                DCD     GPDMA1_Channel8_IRQHandler       ;     GPDMA1 Channel 8 global interrupt
                DCD     GPDMA1_Channel9_IRQHandler       ;     GPDMA1 Channel 9 global interrupt
                DCD     GPDMA1_Channel10_IRQHandler      ;     GPDMA1 Channel 10 global interrupt
                DCD     GPDMA1_Channel11_IRQHandler      ;     GPDMA1 Channel 11 global interrupt
                DCD     GPDMA1_Channel12_IRQHandler      ;     GPDMA1 Channel 12 global interrupt
                DCD     GPDMA1_Channel13_IRQHandler      ;     GPDMA1 Channel 13 global interrupt
                DCD     GPDMA1_Channel14_IRQHandler      ;     GPDMA1 Channel 14 global interrupt
                DCD     GPDMA1_Channel15_IRQHandler      ;     GPDMA1 Channel 15 global interrupt
                DCD     I2C3_EV_IRQHandler               ;     I2C3 event interrupt
                DCD     I2C3_ER_IRQHandler               ;     I2C3 error interrupt
                DCD     SAI1_IRQHandler                  ;     Serial Audio Interface 1 global interrupt
                DCD     SAI2_IRQHandler                  ;     Serial Audio Interface 2 global interrupt
                DCD     TSC_IRQHandler                   ;     Touch Sense Controller global interrupt
                DCD     0                                ;     Reserved
                DCD     RNG_IRQHandler                   ;     RNG global interrupt
                DCD     FPU_IRQHandler                   ;     FPU global interrupt
                DCD     HASH_IRQHandler                  ;     HASH global interrupt
                DCD     0                                ;     Reserved
                DCD     LPTIM3_IRQHandler                ;     LPTIM3 global interrupt
                DCD     SPI3_IRQHandler                  ;     SPI3 global interrupt
                DCD     I2C4_ER_IRQHandler               ;     I2C4 Error interrupt
                DCD     I2C4_EV_IRQHandler               ;     I2C4 Event interrupt
                DCD     MDF1_FLT0_IRQHandler             ;     MDF1 Filter 0 global interrupt
                DCD     MDF1_FLT1_IRQHandler             ;     MDF1 Filter 1 global interrupt
                DCD     MDF1_FLT2_IRQHandler             ;     MDF1 Filter 2 global interrupt
                DCD     MDF1_FLT3_IRQHandler             ;     MDF1 Filter 3 global interrupt
                DCD     UCPD1_IRQHandler                 ;     UCPD1 global interrupt
                DCD     ICACHE_IRQHandler                ;     Instruction cache global interrupt
                DCD     0                                ;     Reserved
                DCD     0                                ;     Reserved
                DCD     LPTIM4_IRQHandler                ;     LPTIM4 global interrupt
                DCD     DCACHE1_IRQHandler               ;     Data cache global interrupt
                DCD     ADF1_IRQHandler                  ;     ADF interrupt
                DCD     ADC4_IRQHandler                  ;     ADC4 (12bits) global interrupt
                DCD     LPDMA1_Channel0_IRQHandler       ;     LPDMA1 SmartRun Channel 0 global interrupt
                DCD     LPDMA1_Channel1_IRQHandler       ;     LPDMA1 SmartRun Channel 1 global interrupt
                DCD     LPDMA1_Channel2_IRQHandler       ;     LPDMA1 SmartRun Channel 2 global interrupt
                DCD     LPDMA1_Channel3_IRQHandler       ;     LPDMA1 SmartRun Channel 3 global interrupt
                DCD     DMA2D_IRQHandler                 ;     DMA2D global interrupt
                DCD     DCMI_PSSI_IRQHandler             ;     DCMI/PSSI global interrupt
                DCD     OCTOSPI2_IRQHandler              ;     OCTOSPI2 global interrupt
                DCD     MDF1_FLT4_IRQHandler             ;     MDF1 Filter 4 global interrupt
                DCD     MDF1_FLT5_IRQHandler             ;     MDF1 Filter 5 global interrupt
                DCD     CORDIC_IRQHandler                ;     CORDIC global interrupt
                DCD     FMAC_IRQHandler                  ;     FMAC global interrupt
                DCD     LSECSSD_IRQHandler               ;     LSECSSD global interrupt
                DCD     USART6_IRQHandler                ;     USART6 global interrupt
                DCD     I2C5_ER_IRQHandler               ;     I2C5 error interrupt
                DCD     I2C5_EV_IRQHandler               ;     I2C5 event interrupt
                DCD     I2C6_ER_IRQHandler               ;     I2C6 error interrupt
                DCD     I2C6_EV_IRQHandler               ;     I2C6 event interrupt
                DCD     HSPI1_IRQHandler                 ;     HSPI1 global interrupt

__Vectors_End

__Vectors       EQU     __vector_table
__Vectors_Size  EQU     __Vectors_End - __Vectors


                THUMB

; Reset Handler

                PUBWEAK Reset_Handler
                SECTION .text:CODE:REORDER:NOROOT(2)
Reset_Handler
                LDR     R0, =sfe(CSTACK)
                MSR     PSP, R0

                LDR     R0, =sfb(CSTACK)
                MSR     MSPLIM, R0
                MSR     PSPLIM, R0

                LDR     R0, =SystemInit
                BLX     R0
                LDR     R0, =__iar_program_start
                BX      R0


; Dummy Exception Handlers (infinite loops which can be modified)

                PUBWEAK NMI_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
NMI_Handler
                B NMI_Handler

                PUBWEAK HardFault_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HardFault_Handler
                B HardFault_Handler

                PUBWEAK MemManage_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
MemManage_Handler
                B MemManage_Handler

                PUBWEAK BusFault_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
BusFault_Handler
                B BusFault_Handler

                PUBWEAK UsageFault_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
UsageFault_Handler
                B UsageFault_Handler

                PUBWEAK SecureFault_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
SecureFault_Handler
                B SecureFault_Handler

                PUBWEAK SVC_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
SVC_Handler
                B SVC_Handler

                PUBWEAK DebugMon_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
DebugMon_Handler
                B DebugMon_Handler

                PUBWEAK PendSV_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
PendSV_Handler
                B PendSV_Handler

                PUBWEAK SysTick_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
SysTick_Handler
                B SysTick_Handler


                PUBWEAK WWDG_IRQHandler
                PUBWEAK PVD_PVM_IRQHandler
                PUBWEAK RTC_IRQHandler
                PUBWEAK RTC_S_IRQHandler
                PUBWEAK TAMP_IRQHandler
                PUBWEAK RAMCFG_IRQHandler
                PUBWEAK FLASH_IRQHandler
                PUBWEAK FLASH_S_IRQHandler
                PUBWEAK GTZC_IRQHandler
                PUBWEAK RCC_IRQHandler
                PUBWEAK RCC_S_IRQHandler
                PUBWEAK EXTI0_IRQHandler
                PUBWEAK EXTI1_IRQHandler
                PUBWEAK EXTI2_IRQHandler
                PUBWEAK EXTI3_IRQHandler
                PUBWEAK EXTI4_IRQHandler
                PUBWEAK EXTI5_IRQHandler
                PUBWEAK EXTI6_IRQHandler
                PUBWEAK EXTI7_IRQHandler
                PUBWEAK EXTI8_IRQHandler
                PUBWEAK EXTI9_IRQHandler
                PUBWEAK EXTI10_IRQHandler
                PUBWEAK EXTI11_IRQHandler
                PUBWEAK EXTI12_IRQHandler
                PUBWEAK EXTI13_IRQHandler
                PUBWEAK EXTI14_IRQHandler
                PUBWEAK EXTI15_IRQHandler
                PUBWEAK IWDG_IRQHandler
                PUBWEAK GPDMA1_Channel0_IRQHandler
                PUBWEAK GPDMA1_Channel1_IRQHandler
                PUBWEAK GPDMA1_Channel2_IRQHandler
                PUBWEAK GPDMA1_Channel3_IRQHandler
                PUBWEAK GPDMA1_Channel4_IRQHandler
                PUBWEAK GPDMA1_Channel5_IRQHandler
                PUBWEAK GPDMA1_Channel6_IRQHandler
                PUBWEAK GPDMA1_Channel7_IRQHandler
                PUBWEAK ADC1_2_IRQHandler
                PUBWEAK DAC1_IRQHandler
                PUBWEAK FDCAN1_IT0_IRQHandler
                PUBWEAK FDCAN1_IT1_IRQHandler
                PUBWEAK TIM1_BRK_IRQHandler
                PUBWEAK TIM1_UP_IRQHandler
                PUBWEAK TIM1_TRG_COM_IRQHandler
                PUBWEAK TIM1_CC_IRQHandler
                PUBWEAK TIM2_IRQHandler
                PUBWEAK TIM3_IRQHandler
                PUBWEAK TIM4_IRQHandler
                PUBWEAK TIM5_IRQHandler
                PUBWEAK TIM6_IRQHandler
                PUBWEAK TIM7_IRQHandler
                PUBWEAK TIM8_BRK_IRQHandler
                PUBWEAK TIM8_UP_IRQHandler
                PUBWEAK TIM8_TRG_COM_IRQHandler
                PUBWEAK TIM8_CC_IRQHandler
                PUBWEAK I2C1_EV_IRQHandler
                PUBWEAK I2C1_ER_IRQHandler
                PUBWEAK I2C2_EV_IRQHandler
                PUBWEAK I2C2_ER_IRQHandler
                PUBWEAK SPI1_IRQHandler
                PUBWEAK SPI2_IRQHandler
                PUBWEAK USART1_IRQHandler
                PUBWEAK USART2_IRQHandler
                PUBWEAK USART3_IRQHandler
                PUBWEAK UART4_IRQHandler
                PUBWEAK UART5_IRQHandler
                PUBWEAK LPUART1_IRQHandler
                PUBWEAK LPTIM1_IRQHandler
                PUBWEAK LPTIM2_IRQHandler
                PUBWEAK TIM15_IRQHandler
                PUBWEAK TIM16_IRQHandler
                PUBWEAK TIM17_IRQHandler
                PUBWEAK COMP_IRQHandler
                PUBWEAK OTG_HS_IRQHandler
                PUBWEAK CRS_IRQHandler
                PUBWEAK FMC_IRQHandler
                PUBWEAK OCTOSPI1_IRQHandler
                PUBWEAK PWR_S3WU_IRQHandler
                PUBWEAK SDMMC1_IRQHandler
                PUBWEAK SDMMC2_IRQHandler
                PUBWEAK GPDMA1_Channel8_IRQHandler
                PUBWEAK GPDMA1_Channel9_IRQHandler
                PUBWEAK GPDMA1_Channel10_IRQHandler
                PUBWEAK GPDMA1_Channel11_IRQHandler
                PUBWEAK GPDMA1_Channel12_IRQHandler
                PUBWEAK GPDMA1_Channel13_IRQHandler
                PUBWEAK GPDMA1_Channel14_IRQHandler
                PUBWEAK GPDMA1_Channel15_IRQHandler
                PUBWEAK I2C3_EV_IRQHandler
                PUBWEAK I2C3_ER_IRQHandler
                PUBWEAK SAI1_IRQHandler
                PUBWEAK SAI2_IRQHandler
                PUBWEAK TSC_IRQHandler
                PUBWEAK RNG_IRQHandler
                PUBWEAK FPU_IRQHandler
                PUBWEAK HASH_IRQHandler
                PUBWEAK LPTIM3_IRQHandler
                PUBWEAK SPI3_IRQHandler
                PUBWEAK I2C4_ER_IRQHandler
                PUBWEAK I2C4_EV_IRQHandler
                PUBWEAK MDF1_FLT0_IRQHandler
                PUBWEAK MDF1_FLT1_IRQHandler
                PUBWEAK MDF1_FLT2_IRQHandler
                PUBWEAK MDF1_FLT3_IRQHandler
                PUBWEAK UCPD1_IRQHandler
                PUBWEAK ICACHE_IRQHandler
                PUBWEAK LPTIM4_IRQHandler
                PUBWEAK DCACHE1_IRQHandler
                PUBWEAK ADF1_IRQHandler
                PUBWEAK ADC4_IRQHandler
                PUBWEAK LPDMA1_Channel0_IRQHandler
                PUBWEAK LPDMA1_Channel1_IRQHandler
                PUBWEAK LPDMA1_Channel2_IRQHandler
                PUBWEAK LPDMA1_Channel3_IRQHandler
                PUBWEAK DMA2D_IRQHandler
                PUBWEAK DCMI_PSSI_IRQHandler
                PUBWEAK OCTOSPI2_IRQHandler
                PUBWEAK MDF1_FLT4_IRQHandler
                PUBWEAK MDF1_FLT5_IRQHandler
                PUBWEAK CORDIC_IRQHandler
                PUBWEAK FMAC_IRQHandler
                PUBWEAK LSECSSD_IRQHandler
                PUBWEAK USART6_IRQHandler
                PUBWEAK I2C5_ER_IRQHandler
                PUBWEAK I2C5_EV_IRQHandler
                PUBWEAK I2C6_ER_IRQHandler
                PUBWEAK I2C6_EV_IRQHandler
                PUBWEAK HSPI1_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
WWDG_IRQHandler
PVD_PVM_IRQHandler
RTC_IRQHandler
RTC_S_IRQHandler
TAMP_IRQHandler
RAMCFG_IRQHandler
FLASH_IRQHandler
FLASH_S_IRQHandler
GTZC_IRQHandler
RCC_IRQHandler
RCC_S_IRQHandler
EXTI0_IRQHandler
EXTI1_IRQHandler
EXTI2_IRQHandler
EXTI3_IRQHandler
EXTI4_IRQHandler
EXTI5_IRQHandler
EXTI6_IRQHandler
EXTI7_IRQHandler
EXTI8_IRQHandler
EXTI9_IRQHandler
EXTI10_IRQHandler
EXTI11_IRQHandler
EXTI12_IRQHandler
EXTI13_IRQHandler
EXTI14_IRQHandler
EXTI15_IRQHandler
IWDG_IRQHandler
GPDMA1_Channel0_IRQHandler
GPDMA1_Channel1_IRQHandler
GPDMA1_Channel2_IRQHandler
GPDMA1_Channel3_IRQHandler
GPDMA1_Channel4_IRQHandler
GPDMA1_Channel5_IRQHandler
GPDMA1_Channel6_IRQHandler
GPDMA1_Channel7_IRQHandler
ADC1_2_IRQHandler
DAC1_IRQHandler
FDCAN1_IT0_IRQHandler
FDCAN1_IT1_IRQHandler
TIM1_BRK_IRQHandler
TIM1_UP_IRQHandler
TIM1_TRG_COM_IRQHandler
TIM1_CC_IRQHandler
TIM2_IRQHandler
TIM3_IRQHandler
TIM4_IRQHandler
TIM5_IRQHandler
TIM6_IRQHandler
TIM7_IRQHandler
TIM8_BRK_IRQHandler
TIM8_UP_IRQHandler
TIM8_TRG_COM_IRQHandler
TIM8_CC_IRQHandler
I2C1_EV_IRQHandler
I2C1_ER_IRQHandler
I2C2_EV_IRQHandler
I2C2_ER_IRQHandler
SPI1_IRQHandler
SPI2_IRQHandler
USART1_IRQHandler
USART2_IRQHandler
USART3_IRQHandler
UART4_IRQHandler
UART5_IRQHandler
LPUART1_IRQHandler
LPTIM1_IRQHandler
LPTIM2_IRQHandler
TIM15_IRQHandler
TIM16_IRQHandler
TIM17_IRQHandler
COMP_IRQHandler
OTG_HS_IRQHandler
CRS_IRQHandler
FMC_IRQHandler
OCTOSPI1_IRQHandler
PWR_S3WU_IRQHandler
SDMMC1_IRQHandler
SDMMC2_IRQHandler
GPDMA1_Channel8_IRQHandler
GPDMA1_Channel9_IRQHandler
GPDMA1_Channel10_IRQHandler
GPDMA1_Channel11_IRQHandler
GPDMA1_Channel12_IRQHandler
GPDMA1_Channel13_IRQHandler
GPDMA1_Channel14_IRQHandler
GPDMA1_Channel15_IRQHandler
I2C3_EV_IRQHandler
I2C3_ER_IRQHandler
SAI1_IRQHandler
SAI2_IRQHandler
TSC_IRQHandler
RNG_IRQHandler
FPU_IRQHandler
HASH_IRQHandler
LPTIM3_IRQHandler
SPI3_IRQHandler
I2C4_ER_IRQHandler
I2C4_EV_IRQHandler
MDF1_FLT0_IRQHandler
MDF1_FLT1_IRQHandler
MDF1_FLT2_IRQHandler
MDF1_FLT3_IRQHandler
UCPD1_IRQHandler
ICACHE_IRQHandler
LPTIM4_IRQHandler
DCACHE1_IRQHandler
ADF1_IRQHandler
ADC4_IRQHandler
LPDMA1_Channel0_IRQHandler
LPDMA1_Channel1_IRQHandler
LPDMA1_Channel2_IRQHandler
LPDMA1_Channel3_IRQHandler
DMA2D_IRQHandler
DCMI_PSSI_IRQHandler
OCTOSPI2_IRQHandler
MDF1_FLT4_IRQHandler
MDF1_FLT5_IRQHandler
CORDIC_IRQHandler
FMAC_IRQHandler
LSECSSD_IRQHandler
USART6_IRQHandler
I2C5_ER_IRQHandler
I2C5_EV_IRQHandler
I2C6_ER_IRQHandler
I2C6_EV_IRQHandler
HSPI1_IRQHandler
                B       .


                END