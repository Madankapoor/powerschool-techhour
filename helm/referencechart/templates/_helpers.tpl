{{/*
  Release Name for the chart 
*/}}
{{- define "customchart.releasename" -}}
{{- default .Release.Name .Values.releaseNameOverride }}
{{- end -}}