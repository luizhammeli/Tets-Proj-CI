require 'json'

report_path = "xcov_output/tmp/report.json"

if File.exist?(report_path)
  report = JSON.parse(File.read(report_path))
  coverage = report["total_coverage"].to_f

  message("📈 **Code Coverage total:** #{coverage.round(2)}%")

  if coverage < 80
    warn("⚠️ Coverage abaixo do mínimo esperado (80%)")
  end
else
  warn("⚠️ Report do xcov não encontrado")
end