# homebrew-tools

A Homebrew tap containing custom formulae maintained by ADORSYS-GIS. This tap provides specific versions of software packages used in our development workflows.

## Installation

To add this tap to your Homebrew installation:

```bash
brew tap ADORSYS-GIS/tools
```

## Available Formulae

The following formulae are available in this tap:

- `suricata@7.0.10` - Network threat detection engine (version 7.0.10)
- `yara@4.5.4` - Pattern matching swiss knife for malware researchers (version 4.5.4)

## Usage

You can install any of the available formulae using:

```bash
brew install ADORSYS-GIS/tools/suricata@7.0.10
brew install ADORSYS-GIS/tools/yara@4.5.4
```

## Contributing

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/my-new-formula`)
3. Commit your changes (`git commit -am 'Add some formula'`)
4. Push to the branch (`git push origin feature/my-new-formula`)
5. Create a new Pull Request

## License

This project is maintained by ADORSYS-GIS. All formulae are subject to their respective licenses.

## Maintenance

To update a formula version:

1. Update the formula file in the `Formula/` directory
2. Test the formula locally using `brew install --build-from-source ./Formula/<formula>.rb`
3. Submit a pull request with the changes
