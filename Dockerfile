ARG IMAGE=store/intersystems/irishealth-community:2019.4.0.383.0
#ARG IMAGE=intersystems/iris:2019.3.0.302.0 #
FROM $IMAGE

USER root
WORKDIR /opt/app
RUN mkdir -p /opt/app/src

USER irisowner
COPY src/* /opt/app/src/



RUN iris start $ISC_PACKAGE_INSTANCENAME quietly EmergencyId=sys,sys && \
    /bin/echo -e "sys\nsys\n" \
            " Do ##class(Security.Users).UnExpireUserPasswords(\"*\")\n" \
            " Do ##class(Security.Users).AddRoles(\"admin\", \"%ALL\")\n" \
            " Do ##class(Security.System).Get(,.p)\n" \
            " Set p(\"AutheEnabled\")=\$zb(p(\"AutheEnabled\"),16,7)\n" \
            " Do ##class(Security.System).Modify(,.p)\n" \
            " zn \"USER\"" \
            " Do \$system.OBJ.LoadDir(\"/opt/app/src\",\"ck\")\n" \
            " write ##class(Application.Tests).RunUnitTests()" \
            " write $zv" \
            " h" \
    | iris session $ISC_PACKAGE_INSTANCENAME && \
    /bin/echo -e "sys\nsys\n" \
    | iris stop $ISC_PACKAGE_INSTANCENAME quietly

CMD [ "-l", "/usr/irissys/mgr/messages.log" ]
