# frozen_string_literal: true

Facter.add(:falco_driver_version) do
  confine kernel: :Linux
  confine { Facter::Core::Execution.which('falco') }

  setcode do
    falco_driver_version = Facter::Core::Execution.execute('falco --version')
    falco_driver_version.match(%r{\d+\.\d+\.\d+\+driver}).to_s
  end
end
