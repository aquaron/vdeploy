#!/usr/bin/env bash

DOT=${1:-minor}
PACKAGE=${GITHUB_WORKSPACE:-.}/package.json
VERSION=$(grep '"version":' $PACKAGE | sed -e 's/^[^:]\+: "\([^"]\+\)".*/\1/g')

function error() {
  >&2 echo "Error: $1"
  exit 1
}

function set_version() {
  [[ ! "${NEW_VERSION}" ]] && error "No version"
  [[ "${VERSION}" = "${NEW_VERSION}" ]] && error "No change ${VERSION}"

  sed -i "s/\"${VERSION}\"/\"${NEW_VERSION}\"/" $PACKAGE
  echo "Revised from $VERSION -> $NEW_VERSION"
}

function check_param() {
  if [[ "${DOT}" =~ [0-9]+\.[0-9]+\.[0-9]+ ]]; then
    NEW_VERSION=$(echo ${DOT} | sed 's/^[^0-9]*//')
  elif [[ "${DOT}" =~ [0-9]+\.[0-9]+ ]]; then
    nver=$(echo ${DOT} | sed -e 's/^[^0-9]*//' -e 's/^\([0-9]\+\)\.\([0-9]\+\)$/\1.\2.0/')
    if [[ "$(mm ${VERSION})" = "$(mm ${nver})" ]]; then
      NEW_VERSION=$(mmm ${nver} mmm micro)
    else
      NEW_VERSION=$nver
    fi
  elif [[ "${DOT}" =~ ^major|minor|micro$ ]]; then
    NEW_VERSION="$(mmm ${VERSION} mmm ${DOT})"
  else
    echo "$0 [<version> | [major|minor|micro]]"
    exit 1;
  fi
}

function mm() {
  echo $(mmm $1 mm)
}

function m() {
  echo $(mmm $1 m)
}

### mmm <v-string> <m|mm|mmm> [major|minor|micro]
function mmm() {
  local _vstring=${1##*-}
  local _parts=$2
  local _incr=$3
  local major=
  local minor=
  local micro=

  IFS='.' read major minor micro <<< ${_vstring}

  [[ ! "${_vstring}" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] \
    && >&2 echo "Error invalid version" \
    && echo "" \
    && exit 1

  if [[ "$_incr" ]]; then
    eval ${_incr}=$( expr ${!_incr} + 1 )

    case "$_incr" in
      'major' ) minor=0; micro=0 ;;
      'minor' ) micro=0 ;;
    esac
  fi

  case "$_parts" in
     'm') echo "${major}" ;;
    'mm') echo "${major}.${minor}" ;;
       *) echo "${major}.${minor}.${micro}" ;;
  esac
}

check_param
set_version
