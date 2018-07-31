require 'date'

Facter.add('rhel_install_data') do
  confine :osfamily => 'RedHat'
  setcode do
    pre_output = Facter::Core::Execution.execute('rpm -qi basesystem | grep Install')
    DateTime.parse(pre_output.gsub(%r{Install Date: }, '')).to_date
  end
end
