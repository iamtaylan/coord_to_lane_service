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
    }
    else {
      if (initObj.hasOwnProperty('lanelet_ids')) {
        this.lanelet_ids = initObj.lanelet_ids
      }
      else {
        this.lanelet_ids = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JsonToLaneResponse
    // Serialize message field [lanelet_ids]
    bufferOffset = _arraySerializer.int32(obj.lanelet_ids, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JsonToLaneResponse
    let len;
    let data = new JsonToLaneResponse(null);
    // Deserialize message field [lanelet_ids]
    data.lanelet_ids = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.lanelet_ids.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'coord_to_lane/JsonToLaneResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6536ea10ea6cb2d403a81b2dcef96384';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] lanelet_ids
    
    
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

    return resolved;
    }
};

module.exports = {
  Request: JsonToLaneRequest,
  Response: JsonToLaneResponse,
  md5sum() { return '6536ea10ea6cb2d403a81b2dcef96384'; },
  datatype() { return 'coord_to_lane/JsonToLane'; }
};
