require 'date'

Facter.add('rhel_install_data') do
  confine :os['family'] => 'RedHat'
  setcode do
    _pre_output = Facter::Core::Execution.execute('rpm -qi basesystem | grep Install')
    DateTime.parse(_pre_output.gub(/Install Date: /,'')).to_date
  end
end