require 'ffi'

module FFI
  # The FFI Libvirt module contains the raw access to the Libvirt C
  # API. This module contains no fluff or nice abstractions above the API,
  # and is actually a way to access the C API directly. This also means
  # that it is up to you to manage all the pointers and so on that come
  # with this power.
  module Libvirt
    autoload :MissingLibError, 'ffi/libvirt/exception'
    autoload :Util, 'ffi/libvirt/util'

    extend FFI::Library

    # Attempt to load the libvirt lib and raise a more specific exception
    # if it doesn't exist. (Normally a LoadError, which is ambiguous, is
    # raised)
    begin
      ffi_lib "libvirt"
    rescue LoadError
      raise MissingLibError
    end
  end
end

# The order matters here, sadly. If you muck with the ordering and
# no exceptions are raised while running tests, you're probably okay.
# But, still, be careful.
require 'ffi/libvirt/types'
require 'ffi/libvirt/version'
require 'ffi/libvirt/functions'
require 'ffi/libvirt/error_types'
require 'ffi/libvirt/error_functions'
require 'ffi/libvirt/authentication'
require 'ffi/libvirt/domain_info'
require 'ffi/libvirt/error'
require 'ffi/libvirt/node_info'
require 'ffi/libvirt/storage_pool_info'
require 'ffi/libvirt/storage_volume_info'
