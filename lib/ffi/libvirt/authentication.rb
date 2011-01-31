module FFI
  module Libvirt

    class ConnectAuth < ::FFI::Struct
      layout :credtype, [ CredentialType, CredentialType.symbols.length ],
             :ncredtype, :uint,
             :cb, :virConnectAuthCallback,
             :cbdata, :void_pointer
    end

    class ConnectCredential < ::FFI::Struct
      layout :type, :int,
             :prompt, :string,
             :challenge, :string,
             :defresult, :string,
             :result, :string,
             :resultlen, :uint
    end

  end
end
