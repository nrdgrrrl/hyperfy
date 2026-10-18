FROM hyperfy:v0.16.0-5d20037

COPY scripts/patch-hyperfy-env.js /tmp/patch-hyperfy-env.js
RUN node /tmp/patch-hyperfy-env.js && rm /tmp/patch-hyperfy-env.js
