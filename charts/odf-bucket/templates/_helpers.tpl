{{- define "odf-s3-bucket.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "odf-s3-bucket.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "odf-s3-bucket.backingStoreName" -}}
{{- default (printf "%s-backing-store" (include "odf-s3-bucket.fullname" .)) .Values.backingStore.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "odf-s3-bucket.bucketClassName" -}}
{{- default (printf "%s-bucket-class" (include "odf-s3-bucket.fullname" .)) .Values.bucketClass.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "odf-s3-bucket.obcStorageClassName" -}}
{{- default (printf "%s-noobaa" (include "odf-s3-bucket.fullname" .)) .Values.obcStorageClass.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "odf-s3-bucket.obcName" -}}
{{- default (printf "%s-s3" (include "odf-s3-bucket.fullname" .)) .Values.obc.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "odf-s3-bucket.bucketName" -}}
{{- default (include "odf-s3-bucket.obcName" .) .Values.obc.bucketName | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "odf-s3-bucket.credentialsSecretName" -}}
{{- default (printf "%s-credentials" (include "odf-s3-bucket.obcName" .)) .Values.credentialsSecret.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "odf-s3-bucket.credentialsJobName" -}}
{{- printf "%s-credentials" (include "odf-s3-bucket.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
