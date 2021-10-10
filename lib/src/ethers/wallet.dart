part of ethers;

/// This is an interface which contains a minimal set of properties required for Externally Owned Accounts which can have certain operations performed, such as encoding as a JSON wallet.
class ExternallyOwnedAccount extends Interop<_ExternallyOwnedAccountImpl> {
  const ExternallyOwnedAccount._(_ExternallyOwnedAccountImpl impl)
      : super.internal(impl);

  /// The Address of this EOA.
  String get address => impl.address;

  /// The account HD mnemonic, if it has one and can be determined. Some sources do not encode the mnemonic, such as HD extended keys.
  Mnemonic? get mnemonic =>
      impl.mnemonic != null ? Mnemonic._(impl.mnemonic!) : null;

  /// The privateKey of this EOA
  String get privateKey => impl.privateKey;

  @override
  String toString() {
    return 'ExternallyOwnedAccount: $address';
  }
}

/// Mnemonic interface for mnemonic defined private key.
class Mnemonic extends Interop<_MnemonicImpl> {
  const Mnemonic._(_MnemonicImpl impl) : super.internal(impl);

  /// The language of the wordlist this mnemonic is using.
  String get locale => impl.locale;

  /// The HD path for this mnemonic.
  String get path => impl.path;

  /// The mnemonic phrase for this mnemonic. It is 12, 15, 18, 21 or 24 words long and separated by the whitespace specified by the locale.
  String get phrase => impl.phrase;

  @override
  String toString() {
    return 'Mnemonic: $phrase';
  }
}

/// The Wallet class inherits [Signer] and can sign transactions and messages using a private key as a standard Externally Owned Account (EOA).
class Wallet extends Signer<_WalletImpl> {
  const Wallet._(_WalletImpl impl) : super._(impl);

  /// Create a new Wallet instance for [privateKey] and optionally connected to the [provider].
  factory Wallet(String privateKey, [Provider? provider]) =>
      Wallet._(_WalletImpl(privateKey, provider?.impl));

  /// Returns a new [Wallet] with a random private key, generated from cryptographically secure entropy sources. If the current environment does not have a secure entropy source, an error is thrown.
  ///
  /// Wallets created using this method will have a [mnemonic].
  factory Wallet.createRandom() => Wallet._(_WalletImpl.createRandom());

  @override
  Wallet connect(Provider provider) => Wallet._(impl.connect(provider.impl));

  /// The Address of this EOA.
  String get address => impl.address;

  /// The account HD mnemonic, if it has one and can be determined. Some sources do not encode the mnemonic, such as HD extended keys.
  Mnemonic? get mnemonic =>
      impl.mnemonic != null ? Mnemonic._(impl.mnemonic!) : null;

  /// The privateKey of this EOA
  String get privateKey => impl.privateKey;
}