<!-- PROJECT DESCRIPTION -->

<img src="idch-logo.png" alt="idea-chronicler-logo" />

# <a name="about-project"> Idea Chronicler </a>

The "Idea Chronicler" project is a blog application that serves as a classic example of a blog website. This fully functional website allows users to explore a list of posts and actively engage with them by leaving comments and liking posts. The application's primary goal is to provide a platform where users can share ideas, insights, and opinions through written content and interact with other users' posts.

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [Tech Stack](#tech-stack)
  - [Key Features](#key-features)
- [Getting Started](#getting-started)
  - [Installation](#installation)
  - [Setup](#setup)
  - [Usage](#usage)
- [Authors](#authors)
- [Future Features](#future-features)
- [Contributing](#contributing)
- [Support](#support)
- [Acknowledgments](#acknowledgments)
- [License](#license)


<!-- Features -->

## Features <a name="features"></a>

### Key Features <a name="key-features"></a>

- [x] Created four main models: User, Post, Comment, and Like, following the ERD diagram.
- [x] Set up associations between models, including one-to-many and many-to-one relationships.
- [x] Generated corresponding migration files for each model with appropriate attributes.
- [x] Added foreign keys and indexes to ensure data integrity and optimize database queries.
- [x] Utilized timestamps for tracking creation and update times automatically.
- [x] Followed naming conventions for models, tables, and columns as per Rails standards.
- [x] Generated migration files to create necessary tables, columns, and associations.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- TECH STACK -->

## Tech Stack <a name="tech-stack"></a>

  <ul>
     <li><a href="https://www.ruby-lang.org/en/">Ruby</a></li>
     <li><a href="https://rubyonrails.org/">Ruby On Rails</a></li>
  </ul>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started <a name="getting-started"></a>

### Setup <a name="setup"></a>

1. Ensure you have Ruby installed on your system. You can check your Ruby version in the terminal by running:

```ruby -v```

If Ruby is not installed, you can download and install it from the official Ruby website.

2. Ensure you have Ruby on Rails (RoR) installed on your system. You can check your Rails version in the terminal by running:

```rails -v```

If Rails is not installed, you can install it using the following command:

```gem install rails```

3. To get a local copy up and running, follow these steps.
Choose the directory on your local machine where you want to copy project. For example:

> cd /home/user/name-of-your-directory

Clone the project using one of the options.

Using SSH-key:

> git clone git@github.com:romans-adi/IdeaChronicler.git

Using HTTPS:

> git clone https://github.com/romans-adi/IdeaChronicler.git

You can also create the new directory just adding the name of it in the end of command. For example:

> git clone https://github.com/romans-adi/IdeaChronicler.git IdeaChronicler

### Installation <a name="installation"></a>

To run this project locally, follow these steps:

1. Open your terminal or command prompt.

2. Navigate to the directory where you have cloned or downloaded the IdeaChronicler repository.

3. Run the following command to install any required dependencies:
```bundle install```

### Usage <a name="usage"></a>

1. Once the setup is complete, ensure you are still in the directory containing the IdeaChronicler files.

2. To run the app, execute the following command:

```rails server```

3. The app will be accessible at `http://localhost:3000` in your web browser.

4. If you have future features like GUI or interactive mode, follow the specific instructions provided for those features in the app's documentation.

<!-- AUTHORS -->

## Authors <a name="authors"></a>

**Romans S.**

- GitHub: [@romans-adi](https://github.com/romans-adi/)
- Twitter: [@obj583](https://twitter.com/obj583/)
- LinkedIn: [Romans Špiļaks](https://www.linkedin.com/in/obj513/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Future Features <a name="future-features"></a>

- [ ] Implement data validations for models and write tests to ensure data integrity.
- [ ] Add model methods to process data and write tests to validate their functionality.
- [ ] Set up CRUD actions in controllers for managing model instances.
- [ ] Write tests to verify the behavior of controller actions and responses.
- [ ] Create view templates to render data and user interfaces.
- [ ] Implement forms for user input and data submission.
- [ ] Write integration tests to cover user interactions and optimize queries.
- [ ] Integrate Devise gem for user authentication and registration.
- [ ] Create API endpoints to expose data for external use.
- [ ] Document API endpoints and usage instructions for developers.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## Contributing <a name="contributing"></a>

I welcome contributions to enhance the functionality and user experience of the IdeaChronicler Application. If you have any ideas, suggestions, or bug reports, feel free to open an issue or submit a pull request. Let's share ideas!

If you'd like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with descriptive commit messages.
4. Push your changes to your forked repository.
5. Submit a pull request to the main repository, explaining your changes in detail.

Please adhere to the coding conventions and guidelines specified in the project.

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## Support <a name="support"></a>

If you encounter any issues or have any questions or suggestions, please open an issue on the [issue tracker](../../../issues/).
Furthermore, if you would like to get in touch with me, you can find our contact information in the <a href="#authors">Authors</a> section.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## Acknowledgements <a name="acknowledgments"></a>

I would like to thank the following individuals and projects for their contributions and inspiration:

[Ruby official](https://www.ruby-lang.org/) :  Special thanks to Yukihiro Matsumoto, the creator of the Ruby programming language, for giving me this powerful and elegant tool to build amazing applications. I am also grateful to the Ruby Core Team and the passionate Ruby community for their continuous support and contributions.

<!-- LICENSE -->

## License <a name="license"></a>

This project is [MIT](LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
