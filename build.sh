#!/bin/bash

(
cd ~/bin/zmk/app

west \
  build \
  --pristine \
  -d build/left \
  -b nice_nano_v2 \
  -- \
  -DSHIELD=cradio_left \
  -DZMK_CONFIG=/home/mjaeger/zmk-config/zmk-config-sweep/config \
  && while [ ! -e /run/media/mjaeger/NICENANO/INDEX.HTM ]; do \
  echo -n '.'; \
  sleep 1 ; \
done \
&& echo -n " Copying... "; \
cp /home/mjaeger/bin/zmk/app/build/left/zephyr/zmk.uf2 /run/media/mjaeger/NICENANO/; \
echo "Done: $?"
)
