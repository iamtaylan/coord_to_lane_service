// Auto-generated. Do not edit!

// (in-package coord_to_lane.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class JsonToLaneRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JsonToLaneRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JsonToLaneRequest
    let len;
    let data = new JsonToLaneRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'coord_to_lane/JsonToLaneRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JsonToLaneRequest(null);
    return resolved;
    }
};

class JsonToLaneResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lanelet_ids = null;
      this.latitudes = null;
      this.longitudes = null;
      this.local_xs = null;
      this.local_ys = null;
      this.headings = null;
    }
    else {
      if (initObj.hasOwnProperty('lanelet_ids')) {
        this.lanelet_ids = initObj.lanelet_ids
      }
      else {
        this.lanelet_ids = [];
      }
      if (initObj.hasOwnProperty('latitudes')) {
        this.latitudes = initObj.latitudes
      }
      else {
        this.latitudes = [];
      }
      if (initObj.hasOwnProperty('longitudes')) {
        this.longitudes = initObj.longitudes
      }
      else {
        this.longitudes = [];
      }
      if (initObj.hasOwnProperty('local_xs')) {
        this.local_xs = initObj.local_xs
      }
      else {
        this.local_xs = [];
      }
      if (initObj.hasOwnProperty('local_ys')) {
        this.local_ys = initObj.local_ys
      }
      else {
        this.local_ys = [];
      }
      if (initObj.hasOwnProperty('headings')) {
        this.headings = initObj.headings
      }
      else {
        this.headings = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JsonToLaneResponse
    // Serialize message field [lanelet_ids]
    bufferOffset = _arraySerializer.int32(obj.lanelet_ids, buffer, bufferOffset, null);
    // Serialize message field [latitudes]
    bufferOffset = _arraySerializer.float64(obj.latitudes, buffer, bufferOffset, null);
    // Serialize message field [longitudes]
    bufferOffset = _arraySerializer.float64(obj.longitudes, buffer, bufferOffset, null);
    // Serialize message field [local_xs]
    bufferOffset = _arraySerializer.float64(obj.local_xs, buffer, bufferOffset, null);
    // Serialize message field [local_ys]
    bufferOffset = _arraySerializer.float64(obj.local_ys, buffer, bufferOffset, null);
    // Serialize message field [headings]
    bufferOffset = _arraySerializer.float64(obj.headings, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JsonToLaneResponse
    let len;
    let data = new JsonToLaneResponse(null);
    // Deserialize message field [lanelet_ids]
    data.lanelet_ids = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [latitudes]
    data.latitudes = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [longitudes]
    data.longitudes = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [local_xs]
    data.local_xs = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [local_ys]
    data.local_ys = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [headings]
    data.headings = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.lanelet_ids.length;
    length += 8 * object.latitudes.length;
    length += 8 * object.longitudes.length;
    length += 8 * object.local_xs.length;
    length += 8 * object.local_ys.length;
    length += 8 * object.headings.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'coord_to_lane/JsonToLaneResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b737285eed744467ad49ee7f51ca3326';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] lanelet_ids
    float64[] latitudes
    float64[] longitudes
    float64[] local_xs
    float64[] local_ys
    float64[] headings
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JsonToLaneResponse(null);
    if (msg.lanelet_ids !== undefined) {
      resolved.lanelet_ids = msg.lanelet_ids;
    }
    else {
      resolved.lanelet_ids = []
    }

    if (msg.latitudes !== undefined) {
      resolved.latitudes = msg.latitudes;
    }
    else {
      resolved.latitudes = []
    }

    if (msg.longitudes !== undefined) {
      resolved.longitudes = msg.longitudes;
    }
    else {
      resolved.longitudes = []
    }

    if (msg.local_xs !== undefined) {
      resolved.local_xs = msg.local_xs;
    }
    else {
      resolved.local_xs = []
    }

    if (msg.local_ys !== undefined) {
      resolved.local_ys = msg.local_ys;
    }
    else {
      resolved.local_ys = []
    }

    if (msg.headings !== undefined) {
      resolved.headings = msg.headings;
    }
    else {
      resolved.headings = []
    }

    return resolved;
    }
};

module.exports = {
  Request: JsonToLaneRequest,
  Response: JsonToLaneResponse,
  md5sum() { return 'b737285eed744467ad49ee7f51ca3326'; },
  datatype() { return 'coord_to_lane/JsonToLane'; }
};
