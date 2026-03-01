export default function (plop) {

  plop.setHelper('copyrightYear', function () {
    return new Date().getFullYear();
  });

  plop.setHelper('initVersion', function () {
    return '0.9.0-pre.0';
  });

  plop.setHelper('underline', function (char, length) {
    return char.repeat(length);
  });

  plop.setHelper('titlecase', function (text) {
    return text.charAt(0).toUpperCase() + text.slice(1);
  });

  plop.setHelper('uppercase', function (text) {
    return text.toUpperCase();
  });

  plop.setGenerator('code-generator', {
    description: 'Code Generator Plop',
    prompts: [
      {
        type: 'input',
        name: 'project_id',
        message: 'Project ID'
      },
      {
        type: 'input',
        name: 'project_name',
        message: 'Project Name'
      },
      {
        type: 'input',
        name: 'project_desc',
        message: 'Project Description '
      },
      {
        type: 'input',
        name: 'component_name',
        message: 'Component Name'
      },
      {
        type: 'input',
        name: 'author_name',
        message: 'Author Name'
      },
      {
        type: 'input',
        name: 'author_email',
        message: 'Author Email'
      },
      {
        type: 'input',
        name: 'author_url',
        message: 'Author URL'
      },
      {
        type: 'input',
        name: 'github_id',
        message: 'GitHub ID'
      },
      {
        type: 'input',
        name: 'github_repo',
        message: 'GitHub Repository'
      }
    ],
    actions: [
      {
        type: 'addMany',
        destination: 'stage',
        templateFiles: [
          'templates/code-generator/.*/*/*/*',
          'templates/code-generator/.*/*/*',
          'templates/code-generator/**/.*',
          'templates/code-generator/**/*'
        ]
      }
    ]
  });
};