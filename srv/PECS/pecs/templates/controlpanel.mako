%if error=="none":
    <%include file="controlpanel.found.mako" />
%else:
    <%include file="controlpanel.error.mako" />
%endif
