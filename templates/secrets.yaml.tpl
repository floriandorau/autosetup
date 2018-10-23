<% if (ctx.secrets && Object.values(ctx.secrets).length > 0) { -%>
<%   Object.values(ctx.secrets).forEach(secret => { -%>
apiVersion: v1
kind: Secret
metadata:
  name: '<%= secret.kubernetesName %>'
  namespace: '<%= ctx.deployment.namespace %>'
type: <%= secret.kubernetesType %>
data:
  <%= secret.kubernetesEnvName %>: '<%= secret.valueBase64 %>'
---
<%   }); -%>
<% } -%>
