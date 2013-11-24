#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/coprocessor_dip.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/coprocessor_dip.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=main.c config.c spi.c uart.c graphics.c contrib/DigitalMeter.c contrib/EditBox.c contrib/CheckBox.c contrib/Button.c contrib/AnalogClock.c contrib/Chart.c contrib/GOLFontDefault.c contrib/Primitive.c contrib/Palette.c contrib/Meter.c contrib/GOLSchemeDefault.c contrib/Transitions_weak.c contrib/RoundDial.c contrib/Grid.c contrib/StaticText.c contrib/GroupBox.c contrib/Picture.c contrib/ProgressBar.c contrib/Template.c contrib/GOL.c contrib/Transitions.c contrib/Slider.c contrib/ListBox.c contrib/TextEntry.c contrib/RadioButton.c contrib/Window.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/config.o ${OBJECTDIR}/spi.o ${OBJECTDIR}/uart.o ${OBJECTDIR}/graphics.o ${OBJECTDIR}/contrib/DigitalMeter.o ${OBJECTDIR}/contrib/EditBox.o ${OBJECTDIR}/contrib/CheckBox.o ${OBJECTDIR}/contrib/Button.o ${OBJECTDIR}/contrib/AnalogClock.o ${OBJECTDIR}/contrib/Chart.o ${OBJECTDIR}/contrib/GOLFontDefault.o ${OBJECTDIR}/contrib/Primitive.o ${OBJECTDIR}/contrib/Palette.o ${OBJECTDIR}/contrib/Meter.o ${OBJECTDIR}/contrib/GOLSchemeDefault.o ${OBJECTDIR}/contrib/Transitions_weak.o ${OBJECTDIR}/contrib/RoundDial.o ${OBJECTDIR}/contrib/Grid.o ${OBJECTDIR}/contrib/StaticText.o ${OBJECTDIR}/contrib/GroupBox.o ${OBJECTDIR}/contrib/Picture.o ${OBJECTDIR}/contrib/ProgressBar.o ${OBJECTDIR}/contrib/Template.o ${OBJECTDIR}/contrib/GOL.o ${OBJECTDIR}/contrib/Transitions.o ${OBJECTDIR}/contrib/Slider.o ${OBJECTDIR}/contrib/ListBox.o ${OBJECTDIR}/contrib/TextEntry.o ${OBJECTDIR}/contrib/RadioButton.o ${OBJECTDIR}/contrib/Window.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/config.o.d ${OBJECTDIR}/spi.o.d ${OBJECTDIR}/uart.o.d ${OBJECTDIR}/graphics.o.d ${OBJECTDIR}/contrib/DigitalMeter.o.d ${OBJECTDIR}/contrib/EditBox.o.d ${OBJECTDIR}/contrib/CheckBox.o.d ${OBJECTDIR}/contrib/Button.o.d ${OBJECTDIR}/contrib/AnalogClock.o.d ${OBJECTDIR}/contrib/Chart.o.d ${OBJECTDIR}/contrib/GOLFontDefault.o.d ${OBJECTDIR}/contrib/Primitive.o.d ${OBJECTDIR}/contrib/Palette.o.d ${OBJECTDIR}/contrib/Meter.o.d ${OBJECTDIR}/contrib/GOLSchemeDefault.o.d ${OBJECTDIR}/contrib/Transitions_weak.o.d ${OBJECTDIR}/contrib/RoundDial.o.d ${OBJECTDIR}/contrib/Grid.o.d ${OBJECTDIR}/contrib/StaticText.o.d ${OBJECTDIR}/contrib/GroupBox.o.d ${OBJECTDIR}/contrib/Picture.o.d ${OBJECTDIR}/contrib/ProgressBar.o.d ${OBJECTDIR}/contrib/Template.o.d ${OBJECTDIR}/contrib/GOL.o.d ${OBJECTDIR}/contrib/Transitions.o.d ${OBJECTDIR}/contrib/Slider.o.d ${OBJECTDIR}/contrib/ListBox.o.d ${OBJECTDIR}/contrib/TextEntry.o.d ${OBJECTDIR}/contrib/RadioButton.o.d ${OBJECTDIR}/contrib/Window.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/config.o ${OBJECTDIR}/spi.o ${OBJECTDIR}/uart.o ${OBJECTDIR}/graphics.o ${OBJECTDIR}/contrib/DigitalMeter.o ${OBJECTDIR}/contrib/EditBox.o ${OBJECTDIR}/contrib/CheckBox.o ${OBJECTDIR}/contrib/Button.o ${OBJECTDIR}/contrib/AnalogClock.o ${OBJECTDIR}/contrib/Chart.o ${OBJECTDIR}/contrib/GOLFontDefault.o ${OBJECTDIR}/contrib/Primitive.o ${OBJECTDIR}/contrib/Palette.o ${OBJECTDIR}/contrib/Meter.o ${OBJECTDIR}/contrib/GOLSchemeDefault.o ${OBJECTDIR}/contrib/Transitions_weak.o ${OBJECTDIR}/contrib/RoundDial.o ${OBJECTDIR}/contrib/Grid.o ${OBJECTDIR}/contrib/StaticText.o ${OBJECTDIR}/contrib/GroupBox.o ${OBJECTDIR}/contrib/Picture.o ${OBJECTDIR}/contrib/ProgressBar.o ${OBJECTDIR}/contrib/Template.o ${OBJECTDIR}/contrib/GOL.o ${OBJECTDIR}/contrib/Transitions.o ${OBJECTDIR}/contrib/Slider.o ${OBJECTDIR}/contrib/ListBox.o ${OBJECTDIR}/contrib/TextEntry.o ${OBJECTDIR}/contrib/RadioButton.o ${OBJECTDIR}/contrib/Window.o

# Source Files
SOURCEFILES=main.c config.c spi.c uart.c graphics.c contrib/DigitalMeter.c contrib/EditBox.c contrib/CheckBox.c contrib/Button.c contrib/AnalogClock.c contrib/Chart.c contrib/GOLFontDefault.c contrib/Primitive.c contrib/Palette.c contrib/Meter.c contrib/GOLSchemeDefault.c contrib/Transitions_weak.c contrib/RoundDial.c contrib/Grid.c contrib/StaticText.c contrib/GroupBox.c contrib/Picture.c contrib/ProgressBar.c contrib/Template.c contrib/GOL.c contrib/Transitions.c contrib/Slider.c contrib/ListBox.c contrib/TextEntry.c contrib/RadioButton.c contrib/Window.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/coprocessor_dip.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GB002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GB002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/config.o: config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/config.o.d 
	@${RM} ${OBJECTDIR}/config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  config.c  -o ${OBJECTDIR}/config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/config.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/spi.o: spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spi.c  -o ${OBJECTDIR}/spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/spi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/uart.o: uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/uart.o.d 
	@${RM} ${OBJECTDIR}/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  uart.c  -o ${OBJECTDIR}/uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/uart.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/graphics.o: graphics.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/graphics.o.d 
	@${RM} ${OBJECTDIR}/graphics.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  graphics.c  -o ${OBJECTDIR}/graphics.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/graphics.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/graphics.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/DigitalMeter.o: contrib/DigitalMeter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/DigitalMeter.o.d 
	@${RM} ${OBJECTDIR}/contrib/DigitalMeter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/DigitalMeter.c  -o ${OBJECTDIR}/contrib/DigitalMeter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/DigitalMeter.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/DigitalMeter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/EditBox.o: contrib/EditBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/EditBox.o.d 
	@${RM} ${OBJECTDIR}/contrib/EditBox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/EditBox.c  -o ${OBJECTDIR}/contrib/EditBox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/EditBox.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/EditBox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/CheckBox.o: contrib/CheckBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/CheckBox.o.d 
	@${RM} ${OBJECTDIR}/contrib/CheckBox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/CheckBox.c  -o ${OBJECTDIR}/contrib/CheckBox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/CheckBox.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/CheckBox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Button.o: contrib/Button.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Button.o.d 
	@${RM} ${OBJECTDIR}/contrib/Button.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Button.c  -o ${OBJECTDIR}/contrib/Button.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Button.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Button.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/AnalogClock.o: contrib/AnalogClock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/AnalogClock.o.d 
	@${RM} ${OBJECTDIR}/contrib/AnalogClock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/AnalogClock.c  -o ${OBJECTDIR}/contrib/AnalogClock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/AnalogClock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/AnalogClock.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Chart.o: contrib/Chart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Chart.o.d 
	@${RM} ${OBJECTDIR}/contrib/Chart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Chart.c  -o ${OBJECTDIR}/contrib/Chart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Chart.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Chart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/GOLFontDefault.o: contrib/GOLFontDefault.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/GOLFontDefault.o.d 
	@${RM} ${OBJECTDIR}/contrib/GOLFontDefault.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/GOLFontDefault.c  -o ${OBJECTDIR}/contrib/GOLFontDefault.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/GOLFontDefault.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/GOLFontDefault.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Primitive.o: contrib/Primitive.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Primitive.o.d 
	@${RM} ${OBJECTDIR}/contrib/Primitive.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Primitive.c  -o ${OBJECTDIR}/contrib/Primitive.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Primitive.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Primitive.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Palette.o: contrib/Palette.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Palette.o.d 
	@${RM} ${OBJECTDIR}/contrib/Palette.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Palette.c  -o ${OBJECTDIR}/contrib/Palette.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Palette.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Palette.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Meter.o: contrib/Meter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Meter.o.d 
	@${RM} ${OBJECTDIR}/contrib/Meter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Meter.c  -o ${OBJECTDIR}/contrib/Meter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Meter.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Meter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/GOLSchemeDefault.o: contrib/GOLSchemeDefault.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/GOLSchemeDefault.o.d 
	@${RM} ${OBJECTDIR}/contrib/GOLSchemeDefault.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/GOLSchemeDefault.c  -o ${OBJECTDIR}/contrib/GOLSchemeDefault.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/GOLSchemeDefault.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/GOLSchemeDefault.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Transitions_weak.o: contrib/Transitions_weak.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Transitions_weak.o.d 
	@${RM} ${OBJECTDIR}/contrib/Transitions_weak.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Transitions_weak.c  -o ${OBJECTDIR}/contrib/Transitions_weak.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Transitions_weak.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Transitions_weak.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/RoundDial.o: contrib/RoundDial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/RoundDial.o.d 
	@${RM} ${OBJECTDIR}/contrib/RoundDial.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/RoundDial.c  -o ${OBJECTDIR}/contrib/RoundDial.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/RoundDial.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/RoundDial.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Grid.o: contrib/Grid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Grid.o.d 
	@${RM} ${OBJECTDIR}/contrib/Grid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Grid.c  -o ${OBJECTDIR}/contrib/Grid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Grid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Grid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/StaticText.o: contrib/StaticText.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/StaticText.o.d 
	@${RM} ${OBJECTDIR}/contrib/StaticText.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/StaticText.c  -o ${OBJECTDIR}/contrib/StaticText.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/StaticText.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/StaticText.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/GroupBox.o: contrib/GroupBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/GroupBox.o.d 
	@${RM} ${OBJECTDIR}/contrib/GroupBox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/GroupBox.c  -o ${OBJECTDIR}/contrib/GroupBox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/GroupBox.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/GroupBox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Picture.o: contrib/Picture.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Picture.o.d 
	@${RM} ${OBJECTDIR}/contrib/Picture.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Picture.c  -o ${OBJECTDIR}/contrib/Picture.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Picture.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Picture.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/ProgressBar.o: contrib/ProgressBar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/ProgressBar.o.d 
	@${RM} ${OBJECTDIR}/contrib/ProgressBar.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/ProgressBar.c  -o ${OBJECTDIR}/contrib/ProgressBar.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/ProgressBar.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/ProgressBar.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Template.o: contrib/Template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Template.o.d 
	@${RM} ${OBJECTDIR}/contrib/Template.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Template.c  -o ${OBJECTDIR}/contrib/Template.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Template.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Template.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/GOL.o: contrib/GOL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/GOL.o.d 
	@${RM} ${OBJECTDIR}/contrib/GOL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/GOL.c  -o ${OBJECTDIR}/contrib/GOL.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/GOL.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/GOL.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Transitions.o: contrib/Transitions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Transitions.o.d 
	@${RM} ${OBJECTDIR}/contrib/Transitions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Transitions.c  -o ${OBJECTDIR}/contrib/Transitions.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Transitions.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Transitions.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Slider.o: contrib/Slider.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Slider.o.d 
	@${RM} ${OBJECTDIR}/contrib/Slider.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Slider.c  -o ${OBJECTDIR}/contrib/Slider.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Slider.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Slider.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/ListBox.o: contrib/ListBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/ListBox.o.d 
	@${RM} ${OBJECTDIR}/contrib/ListBox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/ListBox.c  -o ${OBJECTDIR}/contrib/ListBox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/ListBox.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/ListBox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/TextEntry.o: contrib/TextEntry.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/TextEntry.o.d 
	@${RM} ${OBJECTDIR}/contrib/TextEntry.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/TextEntry.c  -o ${OBJECTDIR}/contrib/TextEntry.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/TextEntry.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/TextEntry.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/RadioButton.o: contrib/RadioButton.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/RadioButton.o.d 
	@${RM} ${OBJECTDIR}/contrib/RadioButton.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/RadioButton.c  -o ${OBJECTDIR}/contrib/RadioButton.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/RadioButton.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/RadioButton.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Window.o: contrib/Window.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Window.o.d 
	@${RM} ${OBJECTDIR}/contrib/Window.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Window.c  -o ${OBJECTDIR}/contrib/Window.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Window.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Window.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/config.o: config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/config.o.d 
	@${RM} ${OBJECTDIR}/config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  config.c  -o ${OBJECTDIR}/config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/config.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/spi.o: spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spi.c  -o ${OBJECTDIR}/spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/spi.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/uart.o: uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/uart.o.d 
	@${RM} ${OBJECTDIR}/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  uart.c  -o ${OBJECTDIR}/uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/uart.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/graphics.o: graphics.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/graphics.o.d 
	@${RM} ${OBJECTDIR}/graphics.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  graphics.c  -o ${OBJECTDIR}/graphics.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/graphics.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/graphics.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/DigitalMeter.o: contrib/DigitalMeter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/DigitalMeter.o.d 
	@${RM} ${OBJECTDIR}/contrib/DigitalMeter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/DigitalMeter.c  -o ${OBJECTDIR}/contrib/DigitalMeter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/DigitalMeter.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/DigitalMeter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/EditBox.o: contrib/EditBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/EditBox.o.d 
	@${RM} ${OBJECTDIR}/contrib/EditBox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/EditBox.c  -o ${OBJECTDIR}/contrib/EditBox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/EditBox.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/EditBox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/CheckBox.o: contrib/CheckBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/CheckBox.o.d 
	@${RM} ${OBJECTDIR}/contrib/CheckBox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/CheckBox.c  -o ${OBJECTDIR}/contrib/CheckBox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/CheckBox.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/CheckBox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Button.o: contrib/Button.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Button.o.d 
	@${RM} ${OBJECTDIR}/contrib/Button.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Button.c  -o ${OBJECTDIR}/contrib/Button.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Button.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Button.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/AnalogClock.o: contrib/AnalogClock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/AnalogClock.o.d 
	@${RM} ${OBJECTDIR}/contrib/AnalogClock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/AnalogClock.c  -o ${OBJECTDIR}/contrib/AnalogClock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/AnalogClock.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/AnalogClock.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Chart.o: contrib/Chart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Chart.o.d 
	@${RM} ${OBJECTDIR}/contrib/Chart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Chart.c  -o ${OBJECTDIR}/contrib/Chart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Chart.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Chart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/GOLFontDefault.o: contrib/GOLFontDefault.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/GOLFontDefault.o.d 
	@${RM} ${OBJECTDIR}/contrib/GOLFontDefault.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/GOLFontDefault.c  -o ${OBJECTDIR}/contrib/GOLFontDefault.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/GOLFontDefault.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/GOLFontDefault.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Primitive.o: contrib/Primitive.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Primitive.o.d 
	@${RM} ${OBJECTDIR}/contrib/Primitive.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Primitive.c  -o ${OBJECTDIR}/contrib/Primitive.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Primitive.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Primitive.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Palette.o: contrib/Palette.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Palette.o.d 
	@${RM} ${OBJECTDIR}/contrib/Palette.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Palette.c  -o ${OBJECTDIR}/contrib/Palette.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Palette.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Palette.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Meter.o: contrib/Meter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Meter.o.d 
	@${RM} ${OBJECTDIR}/contrib/Meter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Meter.c  -o ${OBJECTDIR}/contrib/Meter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Meter.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Meter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/GOLSchemeDefault.o: contrib/GOLSchemeDefault.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/GOLSchemeDefault.o.d 
	@${RM} ${OBJECTDIR}/contrib/GOLSchemeDefault.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/GOLSchemeDefault.c  -o ${OBJECTDIR}/contrib/GOLSchemeDefault.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/GOLSchemeDefault.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/GOLSchemeDefault.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Transitions_weak.o: contrib/Transitions_weak.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Transitions_weak.o.d 
	@${RM} ${OBJECTDIR}/contrib/Transitions_weak.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Transitions_weak.c  -o ${OBJECTDIR}/contrib/Transitions_weak.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Transitions_weak.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Transitions_weak.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/RoundDial.o: contrib/RoundDial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/RoundDial.o.d 
	@${RM} ${OBJECTDIR}/contrib/RoundDial.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/RoundDial.c  -o ${OBJECTDIR}/contrib/RoundDial.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/RoundDial.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/RoundDial.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Grid.o: contrib/Grid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Grid.o.d 
	@${RM} ${OBJECTDIR}/contrib/Grid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Grid.c  -o ${OBJECTDIR}/contrib/Grid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Grid.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Grid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/StaticText.o: contrib/StaticText.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/StaticText.o.d 
	@${RM} ${OBJECTDIR}/contrib/StaticText.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/StaticText.c  -o ${OBJECTDIR}/contrib/StaticText.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/StaticText.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/StaticText.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/GroupBox.o: contrib/GroupBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/GroupBox.o.d 
	@${RM} ${OBJECTDIR}/contrib/GroupBox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/GroupBox.c  -o ${OBJECTDIR}/contrib/GroupBox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/GroupBox.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/GroupBox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Picture.o: contrib/Picture.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Picture.o.d 
	@${RM} ${OBJECTDIR}/contrib/Picture.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Picture.c  -o ${OBJECTDIR}/contrib/Picture.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Picture.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Picture.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/ProgressBar.o: contrib/ProgressBar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/ProgressBar.o.d 
	@${RM} ${OBJECTDIR}/contrib/ProgressBar.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/ProgressBar.c  -o ${OBJECTDIR}/contrib/ProgressBar.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/ProgressBar.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/ProgressBar.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Template.o: contrib/Template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Template.o.d 
	@${RM} ${OBJECTDIR}/contrib/Template.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Template.c  -o ${OBJECTDIR}/contrib/Template.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Template.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Template.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/GOL.o: contrib/GOL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/GOL.o.d 
	@${RM} ${OBJECTDIR}/contrib/GOL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/GOL.c  -o ${OBJECTDIR}/contrib/GOL.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/GOL.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/GOL.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Transitions.o: contrib/Transitions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Transitions.o.d 
	@${RM} ${OBJECTDIR}/contrib/Transitions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Transitions.c  -o ${OBJECTDIR}/contrib/Transitions.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Transitions.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Transitions.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Slider.o: contrib/Slider.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Slider.o.d 
	@${RM} ${OBJECTDIR}/contrib/Slider.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Slider.c  -o ${OBJECTDIR}/contrib/Slider.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Slider.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Slider.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/ListBox.o: contrib/ListBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/ListBox.o.d 
	@${RM} ${OBJECTDIR}/contrib/ListBox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/ListBox.c  -o ${OBJECTDIR}/contrib/ListBox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/ListBox.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/ListBox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/TextEntry.o: contrib/TextEntry.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/TextEntry.o.d 
	@${RM} ${OBJECTDIR}/contrib/TextEntry.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/TextEntry.c  -o ${OBJECTDIR}/contrib/TextEntry.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/TextEntry.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/TextEntry.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/RadioButton.o: contrib/RadioButton.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/RadioButton.o.d 
	@${RM} ${OBJECTDIR}/contrib/RadioButton.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/RadioButton.c  -o ${OBJECTDIR}/contrib/RadioButton.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/RadioButton.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/RadioButton.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/contrib/Window.o: contrib/Window.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/contrib 
	@${RM} ${OBJECTDIR}/contrib/Window.o.d 
	@${RM} ${OBJECTDIR}/contrib/Window.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  contrib/Window.c  -o ${OBJECTDIR}/contrib/Window.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/contrib/Window.o.d"      -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/contrib/Window.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/coprocessor_dip.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/coprocessor_dip.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf  -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/coprocessor_dip.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/coprocessor_dip.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -Wl,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}/xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/coprocessor_dip.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
