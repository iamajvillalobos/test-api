# test-api
This is an api rails server. I'm using a [gem](https://github.com/cerebris/jsonapi-resources) that implements the [JSON:API Specification](http://jsonapi.org/).

## Endpoints
```
GET /api/v1/devices

GET /api/v1/devices/:id

POST /api/v1/devices

PUT /api/v1/devices/:id

DELETE /api/v1/devices/:id
```

## Sample request/response

GET /api/v1/devices
```
curl http://datalink-test-api.herokuapp.com/api/v1/devices
---
{
  data: [
    {  
      "id":"1",
      "type":"devices",
      "links":{  
        "self":"http://datalink-test-api.herokuapp.com/api/v1/devices/1"
      },
      "attributes":{  
        "device_mac":"E4956E40DFCF",
        "serial_no":"DTL01",
        ...
        "created_at":"2017-05-12T09:56:52.415Z",
        "updated_at":"2017-05-12T09:56:52.415Z"
      }
    },
    {  
      "id":"2",
      "type":"devices",
      "links":{  
        "self":"http://datalink-test-api.herokuapp.com/api/v1/devices/2"
      },
      "attributes":{  
        "device_mac":"E4956E40DFB6",
        "serial_no":"DTL02",
        ...
        "created_at":"2017-05-12T09:56:52.423Z",
        "updated_at":"2017-05-12T09:56:52.423Z"
      }
    },
  ]
}
```

POST /api/v1/devices
```
curl http://datalink-test-api.herokuapp.com/api/v1/devices -X POST -H \
'Content-Type: application/vnd.api+json' --data-binary '{"data": {"type": \
"devices", "attributes": {"device_mac": "ABCDF123A"}}}' 
---
{
  "data": {
    "id": "15",
    "type": "devices",
    "links": {
      "self": "http://datalink-test-api.herokuapp.com/api/v1/devices15"
    },
    "attributes": {
      "device_mac": "ABCDF123A",
      "serial_no": null,
      ...
      "created_at": "2017-05-13T00:46:21.039Z",
      "updated_at": "2017-05-13T00:46:21.039Z"
    }
  }
}

```