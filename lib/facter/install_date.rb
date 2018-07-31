require 'date'

Facter.add('rhel_install_data') do
  confine :osfamily => 'RedHat'
  setcode do
    pre_output = Facter::Core::Execution.execute('rpm -qi basesystem | grep Install')
    output = DateTime.parse(pre_output.gsub(%r{Install Date: }, '')).to_date
    "#{output.year}_#{output.month}_#{output.day}"
  end
end
