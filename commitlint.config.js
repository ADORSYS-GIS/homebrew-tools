module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [2, 'always', ['fix', 'feat', 'chore', 'docs', 'style', 'refactor', 'deps', 'test']],
    'scope-enum': [2, 'always', ['formula', 'workflow', 'docs', 'security']],
    'scope-empty': [2, 'never'],
  },
};
