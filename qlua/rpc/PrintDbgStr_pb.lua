-- Generated by protobuf; do not edit
local module = {}
local protobuf = require 'protobuf'


module.REQUEST = protobuf.Descriptor()
module.REQUEST_S_FIELD = protobuf.FieldDescriptor()

module.REQUEST_S_FIELD.name = 's'
module.REQUEST_S_FIELD.full_name = '.qlua.rpc.PrintDbgStr.Request.s'
module.REQUEST_S_FIELD.number = 1
module.REQUEST_S_FIELD.index = 0
module.REQUEST_S_FIELD.label = 1
module.REQUEST_S_FIELD.has_default_value = false
module.REQUEST_S_FIELD.default_value = ''
module.REQUEST_S_FIELD.type = 9
module.REQUEST_S_FIELD.cpp_type = 9

module.REQUEST.name = 'Request'
module.REQUEST.full_name = '.qlua.rpc.PrintDbgStr.Request'
module.REQUEST.nested_types = {}
module.REQUEST.enum_types = {}
module.REQUEST.fields = {module.REQUEST_S_FIELD}
module.REQUEST.is_extendable = false
module.REQUEST.extensions = {}

module.Request = protobuf.Message(module.REQUEST)


module.MESSAGE_TYPES = {'Request'}
module.ENUM_TYPES = {}

return module