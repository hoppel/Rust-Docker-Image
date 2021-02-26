FROM cm2network/steamcmd:latest


USER root
RUN apt update && \
    apt install -y unzip

USER steam
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam +app_update 258550 -beta workcart +quit

ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT  ["/bin/bash", "/entrypoint.sh"]