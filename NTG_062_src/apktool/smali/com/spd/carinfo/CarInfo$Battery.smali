.class public final Lcom/spd/carinfo/CarInfo$Battery;
.super Lcom/spd/carinfo/CarInfo$Base;
.source "CarInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/spd/carinfo/CarInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Battery"
.end annotation


# static fields
.field public static final AVERAGE_ENERGY_CONSUMPTION:I = 0x2713f

.field public static final BATTERY_ENERGY:I = 0x27112

.field public static final BATTERY_FAULT_INFO:I = 0x2712f

.field public static final BATTERY_GROUP_MAX_TEMPERATURE:I = 0x27129

.field public static final BATTERY_GROUP_MIN_TEMPERATURE:I = 0x27128

.field public static final BATTERY_INFO:I = 0x27132

.field public static final BATTERY_MAX_TEMPERATURE_GROUP:I = 0x2712b

.field public static final BATTERY_MIN_TEMPERATURE_GROUP:I = 0x2712a

.field public static final BATTERY_PACK_CHARGE_STATUS:I = 0x2712d

.field public static final BATTERY_TEMPERATURE_H:I = 0x27148

.field public static final BATTERY_TEMPERATURE_L:I = 0x27147

.field public static final BATTERY_TEMPERATURE_MAX:I = 0x27149

.field public static final BATTERY_TEMPERATURE_MIN:I = 0x2714a

.field public static final BMS_CHARGE_STATUS:I = 0x2712c

.field public static final CARBODY_FAULT_INFO:I = 0x27130

.field public static final CARBODY_INFO:I = 0x27133

.field public static final CHARGE_APPOINTMENT_DATES:I = 0x27118

.field public static final CHARGE_APPOINTMENT_TIMES:I = 0x27119

.field public static final CHARGE_MIN_VALUE:I = 0x2710c

.field public static final CHARGE_POWER_LEVEL_CONTROL:I = 0x27120

.field public static final CHARGE_POWER_LEVEL_LOCK_COMMAND:I = 0x27121

.field public static final CHARGING_CURRENT:I = 0x2713c

.field public static final CHARGING_PERCENT:I = 0x2713e

.field public static final CHARGING_PILE_STATUS:I = 0x2711e

.field public static final CHARGING_SET:I = 0x27144

.field public static final CHARGING_VOLTAGE:I = 0x2713d

.field public static final CLASS_NAME:Ljava/lang/String;

.field public static final CURRENT:I = 0x27146

.field public static final CURRENT_MAX_DOWN:I = 0x2714c

.field public static final CURRENT_MAX_UP:I = 0x2714b

.field public static final CURRENT_MIN_DOWN:I = 0x2714e

.field public static final CURRENT_MIN_UP:I = 0x2714d

.field public static final DRIVE_MOTOR_CONTROLLER_TEMPERATURE:I = 0x27122

.field public static final DRIVE_MOTOR_TEMPERATURE:I = 0x27123

.field public static final ENDURANCE:I = 0x27102

.field public static final ENERGY_ALLOCATION_AIR:I = 0x27141

.field public static final ENERGY_ALLOCATION_MOTOR:I = 0x27143

.field public static final ENERGY_ALLOCATION_RECOVERY:I = 0x27142

.field public static final ENERGY_FLOW_STATUS:I = 0x27115

.field public static final ENERGY_OFF:I = 0x27111

.field public static final ENERGY_RECOVERY_ENABLED:I = 0x27116

.field public static final ENERGY_RECOVERY_LEVEL:I = 0x27117

.field public static final ENERGY_RECOVERY_RECORD_VALUE:I = 0x27150

.field public static final ENERGY_RECOVERY_VALUE:I = 0x2714f

.field public static final ENERGY_TRANSFORMATION:I = 0x27103

.field public static final ENGINE_ENERGY:I = 0x27113

.field public static final ENGINE_HIGHLIGHT:I = 0x27104

.field public static final ENGINE_STATUS:I = 0x2711f

.field public static final ID:I = 0x10

.field public static final INSTANTANEOUS_ENERGY_CONSUMPTION:I = 0x27140

.field public static final IS_PHEV:I = 0x2710f

.field public static final LEVEL:I = 0x27106

.field public static final MAX_CHARGE_AMPERE:I = 0x2710a

.field public static final MILEAGE_POTENTIAL:I = 0x27101

.field public static final MONOMER_MAX_VOLTAGE:I = 0x27125

.field public static final MONOMER_MAX_VOLTAGE_GROUPNUM:I = 0x27127

.field public static final MONOMER_MIN_VOLTAGE:I = 0x27124

.field public static final MONOMER_MIN_VOLTAGE_GROUPNUM:I = 0x27126

.field public static final MOTOR_FAULT_INFO:I = 0x2712e

.field public static final MOTOR_HIGHLIGHT:I = 0x27151

.field public static final MOTOR_INFO:I = 0x27131

.field public static final NOT_OFTEN_CHARGE_MODE:I = 0x2711c

.field public static final OFFSET:I = 0x27100

.field public static final POWER_UP_AIR_CONDITION:I = 0x2710b

.field public static final REGENERATION_ENERGY_RECOVERY:I = 0x27114

.field public static final SOC:I = 0x2711d

.field public static final START_CHARGE_NOW:I = 0x2711b

.field public static final TIME_TO_CHARGE_START:I = 0x2711a

.field public static final TIMING_CHARGING_SET:I = 0x27145

.field public static final TIRE_DRIVE:I = 0x27105

.field public static final TOTAL_MILEAGE:I = 0x27107

.field public static final VOLTAGE:I = 0x2710d

.field public static final VOLTAGE_WARNING:I = 0x2710e

.field public static final ZERO_RELEASE_MILEAGE:I = 0x27108

.field public static final ZERO_RELEASE_RATIO:I = 0x27109


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 3005
    const-class v0, Lcom/spd/carinfo/CarInfo$Wipers;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/spd/carinfo/CarInfo$Battery;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 3004
    invoke-direct {p0}, Lcom/spd/carinfo/CarInfo$Base;-><init>()V

    return-void
.end method
