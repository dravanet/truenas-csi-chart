{{/*
Expand the name of the chart.
*/}}
{{- define "truenas-csi.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "truenas-csi.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "truenas-csi.labels" -}}
helm.sh/chart: {{ include "truenas-csi.chart" . }}
{{ include "truenas-csi.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "truenas-csi.selectorLabels" -}}
app.kubernetes.io/name: {{ include "truenas-csi.name" . }}
{{- end }}

{{/*
ServiceAccount
*/}}
{{- define "truenas-csi.serviceAccountName" -}}{{ include "truenas-csi.name" . }}-controller{{ end }}
