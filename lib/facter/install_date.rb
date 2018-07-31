require 'date'

Facter.add('rhel_install_data') do
  confine :os['family'] => 'RedHat'
  setcode do
    pre_output = Facter::Core::Execution.execute('rpm -qi basesystem | grep Install')
    DateTime.parse(pre_output.gub(%r{Install Date: }, '')).to_date
  end
end
