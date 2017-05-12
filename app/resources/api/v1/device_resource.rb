class Api::V1::DeviceResource < JSONAPI::Resource
  attributes :device_mac, :serial_no, :color, :name, :description, :building, :level, :device_threshold, :created_at, :updated_at
end