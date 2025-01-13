# FMProductList

**FMProductList** is a SwiftUI application developed as part of a Frontend Mentor challenge, focusing on improving skills with **SwiftData** for managing dynamic product data. This project highlights modular view components, efficient state management, and responsive design for a clean and seamless user experience.

## Challenge Overview

This project was created as part of the [Frontend Mentor](https://www.frontendmentor.io) challenge to:
- Develop a functional product list view with dynamic data.
- Implement a cart system where users can add or remove items.
- Ensure responsiveness and adaptability across different devices and screen sizes.
- Strengthen skills in data handling using **SwiftData** and state management in SwiftUI.

## Features

- **Product Display**: Browse a list of dessert items, dynamically generated from a data model.
- **Add to Cart**: Users can add products to the cart, increasing and decreasing item quantities with ease.
- **State Management**: Reactivity is handled with SwiftUI’s `@State` and `@Binding`, ensuring smooth UI updates as users interact with the app.
- **Responsive Design**: The UI adjusts to various device sizes, ensuring a consistent and intuitive experience across iPhones.
- **Reusable Components**: Modular components like `ProductItemView` and `AddToCartButtonView` are designed for scalability and reuse throughout the app.

## Technologies Used

- **SwiftUI**: Built with SwiftUI for a declarative and reactive user interface, focusing on modularity and clean component design.
- **SwiftData**: Leveraged SwiftData for efficient data management, querying, and handling dynamic product data.
- **Swift Testing**: Implemented unit and integration tests using Swift Testing's modern APIs, including `@Test` and `#expect`, to ensure the app’s functionality and data flow remain robust. This   allows for concise, asynchronous test cases and enhances overall code reliability.
- **Icon Set Creator**: Used Icon Set Creator to generate the app icon for a polished, professional appearance.
- **npoint.io**: Hosted product data on npoint.io, allowing the app to fetch product information dynamically via API calls instead of relying on a locally stored json file.

## Post-Mortem 
 **In retrospect, I would have approached this project very differently. Having not worked on a personal project in about a year,       I realize now that I could have taken more time to think through my initial approach.**
 
**This experience reinforced two key lessons:**

* Don’t stop working on personal projects, even if you have a full-time job.
Personal projects keep your skills sharp, provide opportunities to experiment, and help you stay adaptable to new technologies and methodologies.
* Avoid trying to implement too many new tools or technologies in a single project.
In this case, I worked with both SwiftData and testing. While testing itself was manageable, UI testing introduced complexities, particularly with subviews—an area where I have much to learn.


**Despite these challenges, the experience was invaluable. It highlighted areas for growth, such as UI testing strategies and          better planning for implementing new technologies/skills. I’m looking forward to applying these lessons in future projects to       continue refining my skills and building applications I can be proud of.**

