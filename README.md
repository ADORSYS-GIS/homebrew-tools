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

### Branch Protection Rules

The `main` branch is protected and requires:
- Successful status checks before merging
- Pull request review before merging
- Up-to-date branch before merging
- Linear history (no merge commits)

### Commit Messages

We follow conventional commits specification. Each commit message should be structured as follows:

```
type(scope): Subject line in sentence case

Optional body
```

Types:
- `fix`: Bug fixes
- `feat`: New features
- `chore`: Maintenance tasks
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `deps`: Dependency updates
- `test`: Test updates

Scopes:
- `formula`: Changes to formula files
- `workflow`: CI/CD changes
- `docs`: Documentation updates
- `security`: Security-related changes

### Development Setup

To ensure consistent commit messages and maintain code quality, please set up the development environment:

```bash
# Install Node.js dependencies (one-time setup)
npm install

# This will automatically set up git hooks
npm run prepare

# Make the pre-commit check executable
chmod +x .husky/pre-commit 
```

After setup, the commit convention will be enforced for all commits, both locally and in PRs.

### Pull Request Process

1. Create a new branch from `main`
2. Make your changes
3. Commit your changes (the commit hook will ensure proper commit message format)
4. Ensure all tests pass locally (`brew test-bot --only-formulae ./Formula/<formula>.rb`)
5. Create a pull request
6. Wait for automated checks to pass
7. Request review
8. Address any feedback
9. Your PR will be merged once approved

## License

This project is maintained by ADORSYS-GIS. All formulae are subject to their respective licenses.

## Maintenance

To update a formula version:

1. Update the formula file in the `Formula/` directory
2. Test the formula locally using `brew install --build-from-source ./Formula/<formula>.rb`
3. Submit a pull request with the changes
