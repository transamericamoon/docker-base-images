#!/bin/ash

###############################################
#Wait for services before starting
###############################################
if test -n "$WAIT_FOR"
then
  for WAIT in ${WAIT_FOR//;/ }
  do
    echo "Waiting for $WAIT"
    until nc -z ${WAIT//:/ }; do
      echo "$WAIT not up yet sleeping..."
      sleep 1
    done
    echo "$WAIT is UP!"
  done
fi

###############################################
#Copy config before starting
###############################################
if test -n "$COPY_CONFIG"
then
  for CONFIG in ${COPY_CONFIG//;/ }
  do
    echo "COPYING Config $CONFIG"
    wget ${CONFIG/->/ -O }
  done
fi

###############################################
#Wait for services before starting
###############################################
if test -n "$APP_EXE"
then
  echo "Starting app $APP_EXE"
  exec $APP_EXE
else
  echo "Running default /app.war"
  exec java -Duser.timezone=America/Chicago -Djava.security.egd=file:/dev/./urandom -jar /app.war
fi
