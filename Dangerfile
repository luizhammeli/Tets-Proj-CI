require 'json'

coverage = ENV["XCOV_COVERAGE"]

if coverage.nil?
  warn("⚠️ Coverage não encontrado")
else
  coverage = coverage.to_f
  message("📈 Code coverage total: #{coverage}%")

  if coverage < 80
    warn("⚠️ Coverage abaixo do mínimo: #{coverage}%")
  else
    message("✅ Coverage OK (#{coverage}%)")
  end
end