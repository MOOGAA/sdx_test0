#!/bin/***

###
##
#


# ***"
#
#   ### --- IK THAT U F*KING MORON CAN READ THIS --- ###
#
#     -) Now If u dk what it is go visit that link
#     -) and if this is a private project file n ur not permitted person ,
#        delete it R.N. .
#
# "***

# Link : https://github.com/MOOGAA/TGBG

# Location : $PROJECT_FOLDER_ROT/Dockerfile
# Language : DOCKER



###########################################################################################################################################################################################################################################################################################################################################################################################



FROM docker.io/ubuntu:latest AS Base



# Adding ENV's

ENV \
  DEBIAN_FRONTEND=noninteractive \
  SRC='https://tgbg.netlify.app/root' \
  TZ=Asia/Kolkata
#_###



# Adding SetUp File
# Via cdn File Host

ADD $SRC/home/Setup_.Sh /tmp/SetUp_.Sh

RUN \
  echo \
    " $( cat /tmp/SetUp_.Sh ) " \
      | bash
#_###



# Adding S6_Overlay

ARG S6_VERSION='3.1.0.1'

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_VERSION}/s6-overlay-noarch.tar.xz /tmp/

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_VERSION}/s6-overlay-x86_64.tar.xz /tmp/

RUN \
  ls -a /tmp/ \
  && tar -C / -Jxpf /tmp/s6*noarch* \
  && tar -C / -Jxpf /tmp/s6*a*64*
#_###



###########################################################################################################################################################################################################################################################################################################################################################################################



###
#
# Dead Code Section

#CMD \
#  echo \
#    " $( curl --http2 -qsS ${SRC}/home/Run_.Sh ) " \
#      | bash

#FROM scratch

#COPY --from=Base / /

#
###



###########################################################################################################################################################################################################################################################################################################################################################################################



#
##
###
