
#ifndef _PECSREPORT_H
#define _PECSREPORT_H

nx_struct pecs_report {
  nxle_uint8_t fan_setting;
  nxle_uint8_t heat_setting;
  nxle_uint8_t occupancy;
  nxle_uint32_t uid;
  nxle_uint8_t fan_origin;
  nxle_uint8_t heat_origin;
} ;


#endif
