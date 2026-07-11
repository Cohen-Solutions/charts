{{- define "crunchy-postgres-cluster.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "crunchy-postgres-cluster.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "crunchy-postgres-cluster.postgresClusterName" -}}
{{- default (include "crunchy-postgres-cluster.fullname" .) .Values.postgresCluster.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "crunchy-postgres-cluster.obcName" -}}
{{- default (printf "%s-s3" (include "crunchy-postgres-cluster.fullname" .)) .Values.obc.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "crunchy-postgres-cluster.bucketName" -}}
{{- default (include "crunchy-postgres-cluster.obcName" .) .Values.obc.bucketName | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "crunchy-postgres-cluster.pgbackrestSecretName" -}}
{{- default (printf "%s-pgbackrest-s3-creds" (include "crunchy-postgres-cluster.fullname" .)) .Values.pgbackrest.secretName | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "crunchy-postgres-cluster.secretSyncJobName" -}}
{{- default (printf "%s-pgbackrest-s3-secret-sync" (include "crunchy-postgres-cluster.fullname" .)) .Values.secretSyncJob.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
