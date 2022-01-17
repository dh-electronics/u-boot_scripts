#!/bin/sh

if ! command -v mkimage >/dev/null 2>&1; then
  echo "mkimage from u-boot-tools not found"
  exit 1
fi

if [ -z "${1}" ] || [ ! -r "${1}" ]; then
  echo "Usage: $0 script"
  exit 1
fi

case "${1}" in
  *imx6*) ARCH=arm;;
  *imx8*) ARCH=arm64;;
  *stm32*) ARCH=arm;;
  *) echo "Unsupported ARCH"; exit 1;;
esac

mkimage -A ${ARCH} -T script -C none -d ${1} ${1}.uimg
