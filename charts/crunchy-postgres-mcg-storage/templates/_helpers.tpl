{{- define "crunchy-postgres-mcg-storage.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "crunchy-postgres-mcg-storage.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "crunchy-postgres-mcg-storage.backingStoreName" -}}
{{- default (printf "%s-backing-store" (include "crunchy-postgres-mcg-storage.fullname" .)) .Values.backingStore.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "crunchy-postgres-mcg-storage.bucketClassName" -}}
{{- default (printf "%s-bucket-class" (include "crunchy-postgres-mcg-storage.fullname" .)) .Values.bucketClass.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "crunchy-postgres-mcg-storage.obcStorageClassName" -}}
{{- default (printf "%s-noobaa" (include "crunchy-postgres-mcg-storage.fullname" .)) .Values.obcStorageClass.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "crunchy-postgres-mcg-storage.obcName" -}}
{{- default (printf "%s-s3" (include "crunchy-postgres-mcg-storage.fullname" .)) .Values.obc.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "crunchy-postgres-mcg-storage.bucketName" -}}
{{- default (include "crunchy-postgres-mcg-storage.obcName" .) .Values.obc.bucketName | trunc 63 | trimSuffix "-" -}}
{{- end -}}
