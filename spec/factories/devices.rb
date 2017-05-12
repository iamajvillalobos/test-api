FactoryGirl.define do
  factory :device do
    sequence(:device_mac, 'A') { |n| 'E4956E40DFC' + n }
    sequence(:serial_no, '1') { |n| 'DTL0' + n }
    sequence(:color, 'AA') { |n| '6195' + n }
    sequence(:name, 'A1') { |n| 'A2-' + n }
    description 'WORKSHOP'
    building 'UNIT8'
    level 'Grd Flr'
    device_threshold 8
  end
end