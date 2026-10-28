import '../models/learning_catalog.dart';

const List<LearningSubject> learningSubjects = [
  LearningSubject(
    id: 'computer-science',
    title: 'Computer Science',
    description:
        'Explore programming, algorithms, databases, networks and computer systems.',
    iconKey: 'computer',
    topics: [
      LearningTopic(
        id: 'programming-fundamentals',
        title: 'Programming Fundamentals',
        description:
            'Learn variables, data types, control flow, functions and problem-solving.',
        quizzes: [
          LearningQuiz(
            id: 'programming-basics-beginner',
            title: 'Programming Basics',
            description:
                'Practice variables, data types and basic programming concepts.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'pf1',
                question: 'What is the main purpose of a variable?',
                options: [
                  'To permanently shut down a program',
                  'To store a value that a program can use',
                  'To physically connect computer components',
                  'To translate every program into a database',
                ],
                answerIndex: 1,
                explanation:
                    'A variable is a named storage location used to represent data that a program can read or update.',
              ),
              LearningQuestion(
                id: 'pf2',
                question:
                    'Which control structure repeats a block of instructions?',
                options: ['A loop', 'A constant', 'A comment', 'A data type'],
                answerIndex: 0,
                explanation:
                    'Loops repeat instructions while a condition holds or for a specified sequence of iterations.',
              ),
              LearningQuestion(
                id: 'pf3',
                question:
                    'What is the purpose of a conditional statement such as if-else?',
                options: [
                  'To store every value permanently',
                  'To guarantee that code has no errors',
                  'To choose which instructions run based on a condition',
                  'To increase the physical memory of a computer',
                ],
                answerIndex: 2,
                explanation:
                    'Conditional statements let a program select different execution paths according to whether a condition is true or false.',
              ),
              LearningQuestion(
                id: 'pf4',
                question: 'What is a function in programming?',
                options: [
                  'A physical part used to cool a processor',
                  'A reusable block of code that performs a task',
                  'A file that must contain only images',
                  'A rule that prevents all program input',
                ],
                answerIndex: 1,
                explanation:
                    'A function groups instructions into a named unit that can be called when its task is needed.',
              ),
              LearningQuestion(
                id: 'pf5',
                question:
                    'Which data type is most suitable for representing true or false?',
                options: [
                  'Boolean',
                  'String',
                  'Floating-point number',
                  'Character sequence',
                ],
                answerIndex: 0,
                explanation:
                    'A Boolean value represents one of two logical states: true or false.',
              ),
              LearningQuestion(
                id: 'pf6',
                question:
                    'What is the likely result of testing whether 8 is greater than 3?',
                options: [
                  'False',
                  'A text string',
                  'A function definition',
                  'True',
                ],
                answerIndex: 3,
                explanation:
                    'Eight is numerically greater than three, so the comparison evaluates to true.',
              ),
              LearningQuestion(
                id: 'pf7',
                question: 'Why are comments used in source code?',
                options: [
                  'To make every instruction execute twice',
                  'To replace all program variables',
                  'To automatically correct every logic error',
                  'To explain code to people reading or maintaining it',
                ],
                answerIndex: 3,
                explanation:
                    'Comments document intent and clarify implementation details; they do not automatically fix program behaviour.',
              ),
              LearningQuestion(
                id: 'pf8',
                question: 'What is an algorithm?',
                options: [
                  'A defined sequence of steps for solving a problem',
                  'A type of computer monitor',
                  'A programming language keyword in every language',
                  'A collection of unrelated files',
                ],
                answerIndex: 0,
                explanation:
                    'An algorithm describes a finite, ordered method for solving a problem or completing a computation.',
              ),
              LearningQuestion(
                id: 'pf9',
                question: 'What does debugging involve?',
                options: [
                  'Designing a computer case',
                  'Finding and correcting defects in a program',
                  'Deleting every test from a project',
                  'Converting source code into a spreadsheet',
                ],
                answerIndex: 1,
                explanation:
                    'Debugging is the process of locating, understanding and correcting defects that cause incorrect or unexpected behaviour.',
              ),
              LearningQuestion(
                id: 'pf10',
                question: 'What is the purpose of a return value?',
                options: [
                  'To restart the computer after each instruction',
                  'To send a result back from a function call',
                  'To rename every variable in a program',
                  'To remove the need for program logic',
                ],
                answerIndex: 1,
                explanation:
                    'A function can return a value to the code that called it, allowing the result to be used in further computation.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'object-oriented-programming',
        title: 'Object-Oriented Programming',
        description:
            'Study classes, objects, encapsulation, inheritance and polymorphism.',
        quizzes: [
          LearningQuiz(
            id: 'oop-foundations-beginner',
            title: 'OOP Foundations',
            description:
                'Review classes, objects and the purpose of encapsulation.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'oop1',
                question: 'What is a class in object-oriented programming?',
                options: [
                  'A running copy of an application only',
                  'A database row with no structure',
                  'A network cable between computers',
                  'A blueprint describing data and behaviour',
                ],
                answerIndex: 3,
                explanation:
                    'A class defines the fields and methods that its objects can have.',
              ),
              LearningQuestion(
                id: 'oop2',
                question: 'What is an object?',
                options: [
                  'An instance of a class',
                  'A syntax error in a method',
                  'A rule for sorting numbers',
                  'A special type of network address',
                ],
                answerIndex: 0,
                explanation:
                    'An object is a particular instance created from a class, with its own state and access to defined behaviour.',
              ),
              LearningQuestion(
                id: 'oop3',
                question: 'What is encapsulation intended to achieve?',
                options: [
                  'Make every field public to every component',
                  'Prevent a class from having any methods',
                  'Convert all objects into database tables',
                  'Bundle state and behaviour while controlling access',
                ],
                answerIndex: 3,
                explanation:
                    'Encapsulation groups related state and behaviour and provides controlled access to an object’s internal details.',
              ),
              LearningQuestion(
                id: 'oop4',
                question: 'What does inheritance allow a class to do?',
                options: [
                  'Reuse or extend behaviour defined by another class',
                  'Automatically remove every dependency',
                  'Guarantee that all methods are private',
                  'Replace all objects with primitive values',
                ],
                answerIndex: 0,
                explanation:
                    'Inheritance allows a derived class to reuse and potentially extend behaviour and state defined by a base class.',
              ),
              LearningQuestion(
                id: 'oop5',
                question: 'What is polymorphism?',
                options: [
                  'A requirement that every class have one field',
                  'Different implementations used through a shared interface',
                  'A technique for compressing image files',
                  'A method of preventing objects from being created',
                ],
                answerIndex: 1,
                explanation:
                    'Polymorphism lets code work with a common type or interface while the actual object determines the implementation used.',
              ),
              LearningQuestion(
                id: 'oop6',
                question: 'What is a constructor commonly used for?',
                options: [
                  'Initialising a newly created object',
                  'Deleting the source code after compilation',
                  'Connecting every object to the internet',
                  'Sorting all methods alphabetically at runtime',
                ],
                answerIndex: 0,
                explanation:
                    'A constructor establishes an object’s initial state when the object is created.',
              ),
              LearningQuestion(
                id: 'oop7',
                question: 'What is a method?',
                options: [
                  'A memory chip installed on a motherboard',
                  'A file extension used only for images',
                  'A function associated with a class or object',
                  'A database backup made every second',
                ],
                answerIndex: 2,
                explanation:
                    'A method defines behaviour associated with a class or an instance of that class.',
              ),
              LearningQuestion(
                id: 'oop8',
                question: 'Why might a class use a private field?',
                options: [
                  'To restrict direct access to internal state',
                  'To guarantee that the application never crashes',
                  'To make the field available everywhere without limits',
                  'To remove the need for validation',
                ],
                answerIndex: 0,
                explanation:
                    'Restricting direct access helps a class preserve its invariants and expose safer operations for updating state.',
              ),
              LearningQuestion(
                id: 'oop9',
                question: 'What is method overriding?',
                options: [
                  'Providing a derived implementation of an inherited method',
                  'Creating a variable with no declared or inferred type',
                  'Removing all methods from a class',
                  'Calling a constructor without creating an object',
                ],
                answerIndex: 0,
                explanation:
                    'Overriding lets a subtype provide its own implementation of a method inherited from a base type.',
              ),
              LearningQuestion(
                id: 'oop10',
                question: 'What is an interface used for?',
                options: [
                  'To store only photographs inside an application',
                  'To force every class to share identical internal data',
                  'To prevent code from calling methods',
                  'To define a contract that implementations must satisfy',
                ],
                answerIndex: 3,
                explanation:
                    'An interface specifies operations or capabilities that implementing types agree to provide, without requiring identical internal implementations.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'data-structures',
        title: 'Data Structures',
        description:
            'Understand arrays, linked lists, stacks, queues, trees and hash tables.',
        quizzes: [
          LearningQuiz(
            id: 'data-structures-beginner',
            title: 'Data Structures Basics',
            description:
                'Explore common structures and the operations they support.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'ds1',
                question: 'Which data structure follows LIFO order?',
                options: ['Queue', 'Stack', 'Binary search tree', 'Hash table'],
                answerIndex: 1,
                explanation:
                    'A stack follows last-in, first-out: the most recently added item is removed first.',
              ),
              LearningQuestion(
                id: 'ds2',
                question: 'Which data structure normally follows FIFO order?',
                options: ['Stack', 'Heap', 'Queue', 'Call frame'],
                answerIndex: 2,
                explanation:
                    'A queue follows first-in, first-out, so items are removed in the order they were added.',
              ),
              LearningQuestion(
                id: 'ds3',
                question: 'What is a linked list node commonly made of?',
                options: [
                  'Only a sorted file name',
                  'A monitor and a keyboard',
                  'Data and one or more links to other nodes',
                  'A database server and router',
                ],
                answerIndex: 2,
                explanation:
                    'A linked-list node stores an element and reference or references used to connect nodes.',
              ),
              LearningQuestion(
                id: 'ds4',
                question:
                    'What is a hash table designed to support efficiently?',
                options: [
                  'Key-based lookup, insertion and deletion on average',
                  'Only sequential playback of audio',
                  'Rendering every pixel on a display',
                  'Guaranteeing sorted order for every key',
                ],
                answerIndex: 0,
                explanation:
                    'Hash tables map keys to storage locations and commonly support expected constant-time lookup, insertion and deletion when hashing and load management are effective.',
              ),
              LearningQuestion(
                id: 'ds5',
                question: 'What is the root of a tree?',
                options: [
                  'The final element of every array',
                  'The topmost node from which the tree is organised',
                  'A link that always points to itself',
                  'The smallest possible hash value',
                ],
                answerIndex: 1,
                explanation:
                    'The root is the distinguished starting node of a rooted tree and has no parent.',
              ),
              LearningQuestion(
                id: 'ds6',
                question: 'What does an array typically provide?',
                options: [
                  'Automatic alphabetical sorting in all languages',
                  'Indexed access to elements',
                  'A guarantee that elements occupy unrelated locations',
                  'Unlimited storage without memory costs',
                ],
                answerIndex: 1,
                explanation:
                    'Arrays provide access to elements by index; many common array implementations offer constant-time indexed access.',
              ),
              LearningQuestion(
                id: 'ds7',
                question:
                    'Which structure is commonly used to represent hierarchical data?',
                options: [
                  'Stack only',
                  'Flat character string only',
                  'Single Boolean value',
                  'Tree',
                ],
                answerIndex: 3,
                explanation:
                    'Trees represent parent-child relationships and are useful for hierarchies such as file systems and syntax structures.',
              ),
              LearningQuestion(
                id: 'ds8',
                question:
                    'What is the time complexity of reading an element by index in a typical array?',
                options: ['O(log n)', 'O(n)', 'O(n²)', 'O(1)'],
                answerIndex: 3,
                explanation:
                    'For a conventional array with direct indexing, the address of an element can be calculated without scanning preceding elements, giving constant-time access.',
              ),
              LearningQuestion(
                id: 'ds9',
                question: 'What is a graph made of?',
                options: [
                  'Only loops and comments',
                  'Classes and constructors only',
                  'Vertices and edges',
                  'Rows and columns exclusively',
                ],
                answerIndex: 2,
                explanation:
                    'A graph consists of vertices (nodes) connected by edges, which may be directed or undirected.',
              ),
              LearningQuestion(
                id: 'ds10',
                question:
                    'Why is choosing a suitable data structure important?',
                options: [
                  'It guarantees that every algorithm is optimal',
                  'It removes the need to test a program',
                  'It ensures that memory usage is always zero',
                  'It affects operation costs and how data is organised',
                ],
                answerIndex: 3,
                explanation:
                    'Different data structures trade off memory, lookup, insertion, deletion and traversal costs, so selection affects overall performance.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'database-systems',
        title: 'Database Systems',
        description:
            'Learn relational data, SQL, keys, transactions and normalisation.',
        quizzes: [
          LearningQuiz(
            id: 'database-foundations-beginner',
            title: 'Database Foundations',
            description:
                'Review relational database concepts and data integrity.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'db1',
                question: 'What is a primary key used for?',
                options: [
                  'To uniquely identify each row in a table',
                  'To store every database password in plain text',
                  'To force all columns to contain identical values',
                  'To automatically create a user interface',
                ],
                answerIndex: 0,
                explanation:
                    'A primary key uniquely identifies each row and cannot contain duplicate key values or nulls in a standard relational table.',
              ),
              LearningQuestion(
                id: 'db2',
                question: 'What does SQL commonly allow users to do?',
                options: [
                  'Physically increase a processor clock speed',
                  'Query and modify data in relational databases',
                  'Design network cables automatically',
                  'Replace the need for database permissions',
                ],
                answerIndex: 1,
                explanation:
                    'SQL is used to define, query and manipulate data in relational database systems, subject to permissions and implementation details.',
              ),
              LearningQuestion(
                id: 'db3',
                question: 'What does a foreign key represent?',
                options: [
                  'A backup stored on a foreign country’s computer',
                  'A password that can never expire',
                  'A relationship referencing a key in another or the same table',
                  'A column that must contain only images',
                ],
                answerIndex: 2,
                explanation:
                    'A foreign key constrains values to match referenced key values, helping maintain referential integrity.',
              ),
              LearningQuestion(
                id: 'db4',
                question: 'What is a database transaction?',
                options: [
                  'A physical network adapter',
                  'A type of monitor resolution',
                  'A logical unit of database work',
                  'A comment inside source code',
                ],
                answerIndex: 2,
                explanation:
                    'A transaction groups database operations into a logical unit governed by commit and rollback behaviour.',
              ),
              LearningQuestion(
                id: 'db5',
                question: 'Which SQL clause filters rows based on a condition?',
                options: ['ORDER BY', 'GROUP BY', 'WHERE', 'CREATE TABLE'],
                answerIndex: 2,
                explanation:
                    'WHERE specifies the condition that rows must satisfy to be included in the query result or affected by an operation.',
              ),
              LearningQuestion(
                id: 'db6',
                question:
                    'What does database normalisation primarily aim to reduce?',
                options: [
                  'The number of valid queries to zero',
                  'All relationships between tables',
                  'Unnecessary duplication and modification anomalies',
                  'The need to store any data',
                ],
                answerIndex: 2,
                explanation:
                    'Normalisation structures relations to reduce redundancy and anomalies while preserving meaningful dependencies.',
              ),
              LearningQuestion(
                id: 'db7',
                question: 'Which SQL command retrieves data?',
                options: ['DROP', 'ALTER', 'SELECT', 'TRUNCATE'],
                answerIndex: 2,
                explanation:
                    'SELECT retrieves rows and expressions from tables, views or other query sources.',
              ),
              LearningQuestion(
                id: 'db8',
                question: 'What does an index generally help improve?',
                options: [
                  'The certainty that all writes are free',
                  'The speed of certain data lookups',
                  'The removal of all database storage',
                  'The automatic correctness of every query',
                ],
                answerIndex: 1,
                explanation:
                    'An index can speed up suitable queries, though it uses storage and may add cost to data modifications.',
              ),
              LearningQuestion(
                id: 'db9',
                question: 'What does the ACID property of isolation address?',
                options: [
                  'How concurrent transactions interact',
                  'How tables are printed on paper',
                  'How users choose screen colours',
                  'How images are compressed',
                ],
                answerIndex: 0,
                explanation:
                    'Isolation concerns the effects of concurrent transactions and the degree to which their intermediate states are visible to one another.',
              ),
              LearningQuestion(
                id: 'db10',
                question:
                    'Why should database applications use parameterised queries?',
                options: [
                  'To disable all database constraints',
                  'To guarantee that queries always run instantly',
                  'To store every user input as executable SQL',
                  'To separate values from SQL syntax and help prevent injection',
                ],
                answerIndex: 3,
                explanation:
                    'Parameterised queries treat supplied values as data rather than SQL code, helping prevent SQL injection when used correctly.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'computer-networks',
        title: 'Computer Networks',
        description:
            'Study addressing, routing, protocols and network communication.',
        quizzes: [
          LearningQuiz(
            id: 'networks-foundations-beginner',
            title: 'Networking Foundations',
            description:
                'Review network devices, addressing and common protocols.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'net1',
                question: 'What is the primary role of a router?',
                options: [
                  'Compile source code into machine instructions',
                  'Forward packets between networks',
                  'Store every file from every connected device',
                  'Display application windows',
                ],
                answerIndex: 1,
                explanation:
                    'Routers forward packets between networks using routing information and applicable forwarding rules.',
              ),
              LearningQuestion(
                id: 'net2',
                question: 'What does an IP address identify in networking?',
                options: [
                  'A network-layer interface or endpoint address',
                  'The exact physical identity of every person online',
                  'The programming language of a device',
                  'The size of a computer screen',
                ],
                answerIndex: 0,
                explanation:
                    'An IP address is a logical network-layer address used to deliver packets; it does not by itself identify a person.',
              ),
              LearningQuestion(
                id: 'net3',
                question:
                    'Which protocol is commonly used to transfer web pages?',
                options: ['HTTP', 'SMTP', 'FTP only', 'DHCP'],
                answerIndex: 0,
                explanation:
                    'HTTP is the application-layer protocol used for web communication; HTTPS protects HTTP with TLS.',
              ),
              LearningQuestion(
                id: 'net4',
                question: 'What is the main role of DNS?',
                options: [
                  'Resolve domain names to associated records such as IP addresses',
                  'Encrypt every file on a computer automatically',
                  'Replace routing in every network',
                  'Allocate CPU time to program threads',
                ],
                answerIndex: 0,
                explanation:
                    'DNS is a distributed naming system that maps domain names to records, including address records used to locate services.',
              ),
              LearningQuestion(
                id: 'net5',
                question:
                    'What is the purpose of a network switch in a typical LAN?',
                options: [
                  'Translate all high-level code into machine code',
                  'Forward frames within a local network using MAC addresses',
                  'Assign a public IP address to every website',
                  'Replace the operating system kernel',
                ],
                answerIndex: 1,
                explanation:
                    'A typical Ethernet switch learns MAC addresses and forwards frames to appropriate ports within a LAN.',
              ),
              LearningQuestion(
                id: 'net6',
                question: 'What is latency in a network?',
                options: [
                  'The number of files stored on a server',
                  'The colour depth of an image',
                  'The delay experienced by data during transmission',
                  'The total number of programming languages installed',
                ],
                answerIndex: 2,
                explanation:
                    'Network latency measures delay between relevant events, such as sending a request and receiving a response.',
              ),
              LearningQuestion(
                id: 'net7',
                question:
                    'Which transport protocol provides a reliable, ordered byte stream?',
                options: ['UDP', 'ARP', 'TCP', 'ICMP'],
                answerIndex: 2,
                explanation:
                    'TCP provides a reliable, ordered byte stream through mechanisms such as acknowledgements, retransmissions and sequencing.',
              ),
              LearningQuestion(
                id: 'net8',
                question:
                    'What is the main distinction between bandwidth and latency?',
                options: [
                  'Bandwidth describes capacity; latency describes delay',
                  'Bandwidth is always measured in seconds; latency in bytes',
                  'They are identical measures with different names',
                  'Latency describes the number of devices in a room',
                ],
                answerIndex: 0,
                explanation:
                    'Bandwidth describes a link’s data-carrying capacity, while latency describes how long communication takes.',
              ),
              LearningQuestion(
                id: 'net9',
                question: 'What does DHCP commonly provide to clients?',
                options: [
                  'Automatic configuration such as IP addresses',
                  'A guarantee that every website is trustworthy',
                  'A replacement for all application protocols',
                  'Automatic correction of source-code bugs',
                ],
                answerIndex: 0,
                explanation:
                    'DHCP can assign network configuration, including IP addresses, subnet masks, gateways and DNS server information.',
              ),
              LearningQuestion(
                id: 'net10',
                question: 'Why is encryption used for network communication?',
                options: [
                  'To guarantee that the receiver is always honest',
                  'To remove the need for authentication',
                  'To prevent all possible network outages',
                  'To help protect data confidentiality from unauthorised observers',
                ],
                answerIndex: 3,
                explanation:
                    'Encryption can protect confidentiality, but authentication, integrity and reliable operation require additional mechanisms.',
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  LearningSubject(
    id: 'mathematics',
    title: 'Mathematics',
    description:
        'Build confidence in numbers, algebra and mathematical reasoning.',
    iconKey: 'mathematics',
    topics: [
      LearningTopic(
        id: 'mathematics-fundamentals',
        title: 'Mathematical Fundamentals',
        description:
            'Practice arithmetic, algebra and basic mathematical reasoning.',
        quizzes: [
          LearningQuiz(
            id: 'math-fundamentals-beginner',
            title: 'Math Foundations',
            description: 'Review essential arithmetic and algebra concepts.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'math1',
                question: 'What is 12 × 8?',
                options: ['84', '96', '108', '92'],
                answerIndex: 1,
                explanation: '12 multiplied by 8 equals 96.',
              ),
              LearningQuestion(
                id: 'math2',
                question: 'What is 45 + 37?',
                options: ['72', '82', '92', '80'],
                answerIndex: 1,
                explanation: '45 + 37 = 82.',
              ),
              LearningQuestion(
                id: 'math3',
                question: 'What is 100 − 46?',
                options: ['54', '64', '56', '44'],
                answerIndex: 0,
                explanation: 'Subtracting 46 from 100 gives 54.',
              ),
              LearningQuestion(
                id: 'math4',
                question: 'Solve x + 7 = 15.',
                options: ['6', '7', '8', '9'],
                answerIndex: 2,
                explanation: 'Subtract 7 from both sides to get x = 8.',
              ),
              LearningQuestion(
                id: 'math5',
                question: 'What is half of 86?',
                options: ['42', '43', '44', '46'],
                answerIndex: 1,
                explanation: '86 divided by 2 equals 43.',
              ),
              LearningQuestion(
                id: 'math6',
                question: 'What is 3²?',
                options: ['6', '9', '12', '8'],
                answerIndex: 1,
                explanation: '3² means 3 × 3, which equals 9.',
              ),
              LearningQuestion(
                id: 'math7',
                question: 'Which fraction is equivalent to 1/2?',
                options: ['2/3', '2/4', '3/5', '4/6'],
                answerIndex: 1,
                explanation:
                    'Multiplying the numerator and denominator of 1/2 by 2 gives 2/4.',
              ),
              LearningQuestion(
                id: 'math8',
                question: 'What is 15% of 200?',
                options: ['20', '25', '30', '35'],
                answerIndex: 2,
                explanation: '10% of 200 is 20 and 5% is 10, so 15% is 30.',
              ),
              LearningQuestion(
                id: 'math9',
                question:
                    'A triangle has angles 60° and 50°. What is its third angle?',
                options: ['70°', '80°', '90°', '60°'],
                answerIndex: 0,
                explanation:
                    'Triangle angles total 180°, so the third angle is 180° − 60° − 50° = 70°.',
              ),
              LearningQuestion(
                id: 'math10',
                question:
                    'What is the perimeter of a square with side length 5 cm?',
                options: ['10 cm', '15 cm', '20 cm', '25 cm'],
                answerIndex: 2,
                explanation:
                    'A square has four equal sides, so its perimeter is 4 × 5 = 20 cm.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'algebra',
        title: 'Algebra',
        description:
            'Practice expressions, equations, formulas and algebraic problem-solving.',
        quizzes: [
          LearningQuiz(
            id: 'algebra-beginner',
            title: 'Algebra Basics',
            description:
                'Test your understanding of algebraic expressions and equations.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'alg1',
                question: 'Solve: 3x + 5 = 20.',
                options: ['3', '5', '7', '15'],
                answerIndex: 1,
                explanation:
                    'Subtract 5 from both sides to get 3x = 15, then divide by 3. Therefore, x = 5.',
              ),
              LearningQuestion(
                id: 'alg2',
                question: 'Simplify: 4a + 3a.',
                options: ['7a', '12a', '7a²', 'a'],
                answerIndex: 0,
                explanation:
                    'Like terms can be combined by adding their coefficients: 4a + 3a = 7a.',
              ),
              LearningQuestion(
                id: 'alg3',
                question: 'Expand: (x + 2)(x + 3).',
                options: ['x² + 6', 'x² + 5x + 6', 'x² + x + 6', '2x² + 5x'],
                answerIndex: 1,
                explanation:
                    'Multiply each term: x² + 3x + 2x + 6 = x² + 5x + 6.',
              ),
              LearningQuestion(
                id: 'alg4',
                question: 'Factorise: x² − 9.',
                options: [
                  '(x − 9)(x + 1)',
                  '(x − 3)²',
                  '(x − 3)(x + 3)',
                  '(x − 9)(x + 9)',
                ],
                answerIndex: 2,
                explanation:
                    'This is a difference of squares: x² − 3² = (x − 3)(x + 3).',
              ),
              LearningQuestion(
                id: 'alg5',
                question: 'Solve: 2(x − 4) = 10.',
                options: ['1', '5', '8', '9'],
                answerIndex: 3,
                explanation:
                    'Divide by 2 to get x − 4 = 5. Add 4 to find x = 9.',
              ),
              LearningQuestion(
                id: 'alg6',
                question: 'If y = 2x + 1, what is y when x = 4?',
                options: ['7', '8', '9', '10'],
                answerIndex: 2,
                explanation: 'Substitute x = 4: y = 2(4) + 1 = 9.',
              ),
              LearningQuestion(
                id: 'alg7',
                question: 'Solve: 3x − 7 = 11.',
                options: ['4', '6', '8', '18'],
                answerIndex: 1,
                explanation:
                    'Add 7 to both sides to get 3x = 18, then divide by 3 to get x = 6.',
              ),
              LearningQuestion(
                id: 'alg8',
                question: 'For x ≠ 0, simplify: 12x² ÷ 3x.',
                options: ['4x', '4x²', '9x', '4'],
                answerIndex: 0,
                explanation:
                    'Divide the coefficients and subtract the powers of x: 12x² ÷ 3x = 4x.',
              ),
              LearningQuestion(
                id: 'alg9',
                question:
                    'The ratio of two numbers is 2:3 and their sum is 25. What is the smaller number?',
                options: ['5', '10', '12', '15'],
                answerIndex: 1,
                explanation:
                    'There are 5 equal parts altogether. Each part is 25 ÷ 5 = 5, so the smaller number is 2 × 5 = 10.',
              ),
              LearningQuestion(
                id: 'alg10',
                question: 'Solve: 5x = 35.',
                options: ['5', '6', '7', '8'],
                answerIndex: 2,
                explanation: 'Divide both sides by 5 to get x = 35 ÷ 5 = 7.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'geometry',
        title: 'Geometry',
        description:
            'Explore shapes, angles, measurements and geometric reasoning.',
        quizzes: [
          LearningQuiz(
            id: 'geometry-beginner',
            title: 'Geometry Basics',
            description:
                'Test your knowledge of basic shapes, angles, perimeter and area.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'geo1',
                question:
                    'A triangle has angles of 50° and 60°. What is its third angle?',
                options: ['70°', '60°', '80°', '90°'],
                answerIndex: 0,
                explanation:
                    'The angles in a triangle total 180°. The third angle is 180° − 50° − 60° = 70°.',
              ),
              LearningQuestion(
                id: 'geo2',
                question:
                    'What is the perimeter of a square with side length 6 cm?',
                options: ['12 cm', '18 cm', '24 cm', '36 cm'],
                answerIndex: 2,
                explanation:
                    'A square has four equal sides, so its perimeter is 4 × 6 = 24 cm.',
              ),
              LearningQuestion(
                id: 'geo3',
                question:
                    'What is the area of a rectangle that is 8 cm long and 3 cm wide?',
                options: ['11 cm²', '22 cm²', '24 cm²', '48 cm²'],
                answerIndex: 2,
                explanation:
                    'The area of a rectangle is length × width, so 8 × 3 = 24 cm².',
              ),
              LearningQuestion(
                id: 'geo4',
                question:
                    'A circle has a diameter of 14 cm. What is its radius?',
                options: ['14 cm', '7 cm', '28 cm', '3.5 cm'],
                answerIndex: 1,
                explanation:
                    'The radius is half the diameter, so 14 ÷ 2 = 7 cm.',
              ),
              LearningQuestion(
                id: 'geo5',
                question:
                    'What is the perimeter of a triangle with side lengths 3 cm, 4 cm and 5 cm?',
                options: ['7 cm', '10 cm', '12 cm', '15 cm'],
                answerIndex: 2,
                explanation: 'Add the three side lengths: 3 + 4 + 5 = 12 cm.',
              ),
              LearningQuestion(
                id: 'geo6',
                question: 'How many degrees are in a right angle?',
                options: ['45°', '90°', '180°', '360°'],
                answerIndex: 1,
                explanation: 'A right angle measures exactly 90°.',
              ),
              LearningQuestion(
                id: 'geo7',
                question:
                    'What is the area of a triangle with base 10 cm and height 6 cm?',
                options: ['30 cm²', '60 cm²', '16 cm²', '36 cm²'],
                answerIndex: 0,
                explanation:
                    'Triangle area is half the base multiplied by the height: (10 × 6) ÷ 2 = 30 cm².',
              ),
              LearningQuestion(
                id: 'geo8',
                question:
                    'A circle has radius 7 cm. Using π = 22/7, what is its circumference?',
                options: ['22 cm', '44 cm', '49 cm', '154 cm'],
                answerIndex: 1,
                explanation: 'Circumference = 2πr = 2 × (22/7) × 7 = 44 cm.',
              ),
              LearningQuestion(
                id: 'geo9',
                question:
                    'Two angles are supplementary. If one angle is 115°, what is the other?',
                options: ['55°', '65°', '75°', '115°'],
                answerIndex: 1,
                explanation:
                    'Supplementary angles total 180°, so the other angle is 180° − 115° = 65°.',
              ),
              LearningQuestion(
                id: 'geo10',
                question: 'How many faces does a cube have?',
                options: ['4', '6', '8', '12'],
                answerIndex: 1,
                explanation: 'A cube has six square faces.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'trigonometry',
        title: 'Trigonometry',
        description: 'Angles, triangles and trigonometric ratios.',
        quizzes: [
          LearningQuiz(
            id: 'trigonometry-beginner',
            title: 'Trigonometry Basics',
            description: 'A beginner quiz with 10 questions.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'trigonometry-1',
                question: 'In a right triangle, what is sin(theta)?',
                options: [
                  'opposite/hypotenuse',
                  'adjacent/hypotenuse',
                  'opposite/adjacent',
                  'hypotenuse/opposite',
                ],
                answerIndex: 0,
                explanation:
                    'Sine is the opposite side divided by the hypotenuse.',
              ),
              LearningQuestion(
                id: 'trigonometry-2',
                question: 'What is cos(theta) in a right triangle?',
                options: [
                  'opposite/hypotenuse',
                  'adjacent/hypotenuse',
                  'opposite/adjacent',
                  'hypotenuse/adjacent',
                ],
                answerIndex: 1,
                explanation:
                    'Cosine is the adjacent side divided by the hypotenuse.',
              ),
              LearningQuestion(
                id: 'trigonometry-3',
                question: 'What is tan(theta)?',
                options: [
                  'hypotenuse/adjacent',
                  'adjacent/opposite',
                  'opposite/adjacent',
                  'opposite/hypotenuse',
                ],
                answerIndex: 2,
                explanation:
                    'Tangent is the opposite side divided by the adjacent side.',
              ),
              LearningQuestion(
                id: 'trigonometry-4',
                question: 'How many degrees are in a right angle?',
                options: ['45', '60', '90', '180'],
                answerIndex: 2,
                explanation: 'A right angle measures 90 degrees.',
              ),
              LearningQuestion(
                id: 'trigonometry-5',
                question: 'How many degrees are in a straight angle?',
                options: ['90', '120', '180', '360'],
                answerIndex: 2,
                explanation: 'A straight angle measures 180 degrees.',
              ),
              LearningQuestion(
                id: 'trigonometry-6',
                question: 'What is sin(30 degrees)?',
                options: ['0', '1/2', 'sqrt(3)/2', '1'],
                answerIndex: 1,
                explanation:
                    'The standard sine value at 30 degrees is one half.',
              ),
              LearningQuestion(
                id: 'trigonometry-7',
                question: 'What is cos(60 degrees)?',
                options: ['0', '1/2', 'sqrt(3)/2', '1'],
                answerIndex: 1,
                explanation:
                    'The standard cosine value at 60 degrees is one half.',
              ),
              LearningQuestion(
                id: 'trigonometry-8',
                question: 'What is tan(45 degrees)?',
                options: ['0', '1/2', '1', 'sqrt(3)'],
                answerIndex: 2,
                explanation: 'The tangent of 45 degrees is 1.',
              ),
              LearningQuestion(
                id: 'trigonometry-9',
                question:
                    'Which theorem relates the sides of a right triangle?',
                options: [
                  'Pythagorean theorem',
                  'Bayes theorem',
                  'Newton law',
                  'Ohm law',
                ],
                answerIndex: 0,
                explanation:
                    'The Pythagorean theorem relates the two shorter sides and hypotenuse.',
              ),
              LearningQuestion(
                id: 'trigonometry-10',
                question:
                    'What is the longest side of a right triangle called?',
                options: ['median', 'radius', 'hypotenuse', 'tangent'],
                answerIndex: 2,
                explanation: 'The hypotenuse is opposite the right angle.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'statistics-probability',
        title: 'Statistics & Probability',
        description: 'Data, averages, variation and probability.',
        quizzes: [
          LearningQuiz(
            id: 'statistics-probability-beginner',
            title: 'Statistics and Probability Basics',
            description: 'A beginner quiz with 10 questions.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'statistics-probability-1',
                question: 'What is the mean of 2, 4 and 6?',
                options: ['2', '3', '4', '6'],
                answerIndex: 2,
                explanation: 'The mean is (2+4+6)/3 = 4.',
              ),
              LearningQuestion(
                id: 'statistics-probability-2',
                question: 'What is the median of 1, 3 and 9?',
                options: ['1', '3', '6', '9'],
                answerIndex: 1,
                explanation: 'The middle value in ordered data is the median.',
              ),
              LearningQuestion(
                id: 'statistics-probability-3',
                question: 'What is the mode of 2, 2, 3, 5?',
                options: ['2', '3', '5', 'No mode'],
                answerIndex: 0,
                explanation: 'Two occurs most often.',
              ),
              LearningQuestion(
                id: 'statistics-probability-4',
                question: 'What is the range of 4, 7 and 10?',
                options: ['3', '4', '6', '10'],
                answerIndex: 2,
                explanation:
                    'Range is maximum minus minimum: 10 minus 4 equals 6.',
              ),
              LearningQuestion(
                id: 'statistics-probability-5',
                question: 'A fair coin is tossed once. What is P(heads)?',
                options: ['0', '1/4', '1/2', '1'],
                answerIndex: 2,
                explanation: 'One of two equally likely outcomes is heads.',
              ),
              LearningQuestion(
                id: 'statistics-probability-6',
                question:
                    'A fair six-sided die is rolled. What is P(rolling a 7)?',
                options: ['0', '1/6', '1/2', '1'],
                answerIndex: 0,
                explanation:
                    'A standard die has outcomes 1 through 6, so 7 is impossible.',
              ),
              LearningQuestion(
                id: 'statistics-probability-7',
                question: 'What is the probability of a certain event?',
                options: ['0', '1/4', '1/2', '1'],
                answerIndex: 3,
                explanation: 'A certain event has probability 1.',
              ),
              LearningQuestion(
                id: 'statistics-probability-8',
                question: 'What is the probability of an impossible event?',
                options: ['0', '1/4', '1/2', '1'],
                answerIndex: 0,
                explanation: 'An impossible event has probability 0.',
              ),
              LearningQuestion(
                id: 'statistics-probability-9',
                question: 'Which graph is commonly used to show categories?',
                options: [
                  'bar chart',
                  'scatter plot only',
                  'number line',
                  'circuit diagram',
                ],
                answerIndex: 0,
                explanation:
                    'Bar charts are commonly used to compare categories.',
              ),
              LearningQuestion(
                id: 'statistics-probability-10',
                question:
                    'Which measure is strongly affected by extreme values?',
                options: [
                  'mean',
                  'median always equally',
                  'mode only',
                  'sample size',
                ],
                answerIndex: 0,
                explanation: 'Extreme values can pull the mean up or down.',
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  LearningSubject(
    id: 'physics',
    title: 'Physics',
    description: 'Explore motion, forces, energy and the physical world.',
    iconKey: 'physics',
    topics: [
      LearningTopic(
        id: 'physics-fundamentals',
        title: 'Physics Fundamentals',
        description:
            'Learn foundational ideas about motion, energy and measurement.',
        quizzes: [
          LearningQuiz(
            id: 'physics-fundamentals-beginner',
            title: 'Physics Foundations',
            description: 'Practice core concepts from introductory physics.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'phy1',
                question: 'What is the SI unit of force?',
                options: ['Joule', 'Watt', 'Newton', 'Pascal'],
                answerIndex: 2,
                explanation: 'Force is measured in newtons (N).',
              ),
              LearningQuestion(
                id: 'phy2',
                question: 'What is the approximate speed of light in a vacuum?',
                options: [
                  '3 × 10⁶ m/s',
                  '3 × 10⁸ m/s',
                  '3 × 10⁴ m/s',
                  '300 m/s',
                ],
                answerIndex: 1,
                explanation:
                    'Light travels at approximately 3 × 10⁸ metres per second in a vacuum.',
              ),
              LearningQuestion(
                id: 'phy3',
                question: 'Which quantity is measured in kilograms?',
                options: ['Force', 'Mass', 'Energy', 'Power'],
                answerIndex: 1,
                explanation: 'The kilogram is the SI base unit of mass.',
              ),
              LearningQuestion(
                id: 'phy4',
                question: 'What is speed?',
                options: [
                  'Distance divided by time',
                  'Mass divided by volume',
                  'Force multiplied by area',
                  'Energy divided by mass',
                ],
                answerIndex: 0,
                explanation:
                    'Average speed is calculated as distance travelled divided by elapsed time.',
              ),
              LearningQuestion(
                id: 'phy5',
                question: 'Which force pulls objects toward Earth?',
                options: ['Friction', 'Magnetism only', 'Gravity', 'Buoyancy'],
                answerIndex: 2,
                explanation:
                    'Earth’s gravitational attraction pulls objects toward its centre.',
              ),
              LearningQuestion(
                id: 'phy6',
                question: 'What is the SI unit of energy?',
                options: ['Newton', 'Joule', 'Ampere', 'Metre'],
                answerIndex: 1,
                explanation: 'Energy is measured in joules (J).',
              ),
              LearningQuestion(
                id: 'phy7',
                question: 'Which instrument measures temperature?',
                options: ['Thermometer', 'Barometer', 'Ammeter', 'Voltmeter'],
                answerIndex: 0,
                explanation:
                    'A thermometer is designed to measure temperature.',
              ),
              LearningQuestion(
                id: 'phy8',
                question:
                    'What happens to the velocity of an object when it accelerates?',
                options: [
                  'It must remain zero',
                  'It changes over time',
                  'Its mass disappears',
                  'Gravity stops acting',
                ],
                answerIndex: 1,
                explanation:
                    'Acceleration is the rate of change of velocity with time.',
              ),
              LearningQuestion(
                id: 'phy9',
                question: 'Which form of energy is associated with motion?',
                options: [
                  'Kinetic energy',
                  'Chemical energy only',
                  'Rest energy only',
                  'Nuclear binding energy only',
                ],
                answerIndex: 0,
                explanation:
                    'Kinetic energy is the energy an object has due to its motion.',
              ),
              LearningQuestion(
                id: 'phy10',
                question: 'What is the SI unit of electric current?',
                options: ['Volt', 'Ohm', 'Ampere', 'Coulomb per metre'],
                answerIndex: 2,
                explanation: 'Electric current is measured in amperes (A).',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'mechanics',
        title: 'Mechanics',
        description: 'Motion, forces, energy and momentum.',
        quizzes: [
          LearningQuiz(
            id: 'mechanics-beginner',
            title: 'Mechanics Basics',
            description: 'A beginner quiz with 10 questions.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'mechanics-1',
                question: 'What is the SI unit of force?',
                options: ['joule', 'newton', 'watt', 'pascal'],
                answerIndex: 1,
                explanation: 'Force is measured in newtons.',
              ),
              LearningQuestion(
                id: 'mechanics-2',
                question: 'What is speed?',
                options: [
                  'distance/time',
                  'time/distance',
                  'mass times volume',
                  'force/time',
                ],
                answerIndex: 0,
                explanation: 'Speed is distance travelled per unit time.',
              ),
              LearningQuestion(
                id: 'mechanics-3',
                question: 'What is the SI unit of energy?',
                options: ['newton', 'watt', 'joule', 'ampere'],
                answerIndex: 2,
                explanation: 'Energy is measured in joules.',
              ),
              LearningQuestion(
                id: 'mechanics-4',
                question:
                    'Which quantity describes change in velocity over time?',
                options: ['density', 'acceleration', 'pressure', 'temperature'],
                answerIndex: 1,
                explanation: 'Acceleration is the rate of change of velocity.',
              ),
              LearningQuestion(
                id: 'mechanics-5',
                question: 'What is the SI unit of mass?',
                options: ['kilogram', 'newton', 'joule', 'metre per second'],
                answerIndex: 0,
                explanation: 'Mass is measured in kilograms.',
              ),
              LearningQuestion(
                id: 'mechanics-6',
                question:
                    'Which law states that an object remains at rest unless acted on by a net force?',
                options: [
                  'Newton first law',
                  'Newton second law',
                  'Newton third law',
                  'Hooke law',
                ],
                answerIndex: 0,
                explanation: 'Newton first law describes inertia.',
              ),
              LearningQuestion(
                id: 'mechanics-7',
                question: 'What is momentum equal to?',
                options: [
                  'mass times velocity',
                  'force times area',
                  'mass divided by time',
                  'energy times distance',
                ],
                answerIndex: 0,
                explanation: 'Momentum is the product of mass and velocity.',
              ),
              LearningQuestion(
                id: 'mechanics-8',
                question: 'Which energy is associated with motion?',
                options: [
                  'chemical energy',
                  'kinetic energy',
                  'gravitational potential only',
                  'nuclear energy only',
                ],
                answerIndex: 1,
                explanation: 'Moving objects have kinetic energy.',
              ),
              LearningQuestion(
                id: 'mechanics-9',
                question: 'What is the SI unit of power?',
                options: ['joule', 'newton', 'watt', 'kilogram'],
                answerIndex: 2,
                explanation: 'Power is measured in watts.',
              ),
              LearningQuestion(
                id: 'mechanics-10',
                question:
                    'If distance is fixed and travel time decreases, average speed will...',
                options: ['decrease', 'stay zero', 'increase', 'become mass'],
                answerIndex: 2,
                explanation:
                    'The same distance covered in less time means greater average speed.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'waves-sound',
        title: 'Waves & Sound',
        description: 'Wave properties, sound and frequency.',
        quizzes: [
          LearningQuiz(
            id: 'waves-sound-beginner',
            title: 'Waves and Sound Basics',
            description: 'A beginner quiz with 10 questions.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'waves-sound-1',
                question: 'What is frequency measured in?',
                options: ['hertz', 'joule', 'newton', 'volt'],
                answerIndex: 0,
                explanation: 'Frequency is measured in hertz.',
              ),
              LearningQuestion(
                id: 'waves-sound-2',
                question:
                    'What is the distance between successive wave crests called?',
                options: ['amplitude', 'wavelength', 'period', 'speed'],
                answerIndex: 1,
                explanation:
                    'Wavelength is the distance between matching points on adjacent waves.',
              ),
              LearningQuestion(
                id: 'waves-sound-3',
                question: 'What does amplitude describe?',
                options: [
                  'maximum displacement from equilibrium',
                  'wave colour',
                  'mass of air',
                  'time zone',
                ],
                answerIndex: 0,
                explanation:
                    'Amplitude measures maximum displacement from the equilibrium position.',
              ),
              LearningQuestion(
                id: 'waves-sound-4',
                question: 'Can sound travel through a vacuum?',
                options: [
                  'yes, easily',
                  'no, it needs a medium',
                  'only at night',
                  'only in water',
                ],
                answerIndex: 1,
                explanation: 'Sound requires a material medium to travel.',
              ),
              LearningQuestion(
                id: 'waves-sound-5',
                question: 'What is the unit of frequency?',
                options: ['hertz', 'metre', 'second squared', 'kilogram'],
                answerIndex: 0,
                explanation: 'Hertz means cycles per second.',
              ),
              LearningQuestion(
                id: 'waves-sound-6',
                question: 'A higher sound frequency is generally heard as...',
                options: [
                  'lower pitch',
                  'higher pitch',
                  'lower speed of light',
                  'no sound',
                ],
                answerIndex: 1,
                explanation: 'Pitch increases with frequency.',
              ),
              LearningQuestion(
                id: 'waves-sound-7',
                question: 'Which wave property is measured in metres?',
                options: ['frequency', 'wavelength', 'period only', 'pitch'],
                answerIndex: 1,
                explanation: 'Wavelength is a distance.',
              ),
              LearningQuestion(
                id: 'waves-sound-8',
                question: 'What is the time for one complete cycle called?',
                options: ['period', 'amplitude', 'wavelength', 'intensity'],
                answerIndex: 0,
                explanation: 'The period is the time taken for one cycle.',
              ),
              LearningQuestion(
                id: 'waves-sound-9',
                question: 'Which type of wave is sound in air?',
                options: [
                  'transverse electromagnetic',
                  'longitudinal mechanical',
                  'static electric',
                  'light wave',
                ],
                answerIndex: 1,
                explanation:
                    'Sound in air propagates through longitudinal pressure variations.',
              ),
              LearningQuestion(
                id: 'waves-sound-10',
                question: 'What happens to frequency when period increases?',
                options: [
                  'frequency increases',
                  'frequency decreases',
                  'frequency is always zero',
                  'frequency becomes mass',
                ],
                answerIndex: 1,
                explanation: 'Frequency and period are inversely related.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'electricity-magnetism',
        title: 'Electricity & Magnetism',
        description: 'Electric circuits, current and magnetic fields.',
        quizzes: [
          LearningQuiz(
            id: 'electricity-magnetism-beginner',
            title: 'Electricity and Magnetism Basics',
            description: 'A beginner quiz with 10 questions.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'electricity-magnetism-1',
                question: 'What is the SI unit of electric current?',
                options: ['ampere', 'volt', 'ohm', 'watt'],
                answerIndex: 0,
                explanation: 'Current is measured in amperes.',
              ),
              LearningQuestion(
                id: 'electricity-magnetism-2',
                question: 'What is the SI unit of voltage?',
                options: ['ampere', 'volt', 'ohm', 'tesla'],
                answerIndex: 1,
                explanation: 'Voltage is measured in volts.',
              ),
              LearningQuestion(
                id: 'electricity-magnetism-3',
                question: 'What is the unit of electrical resistance?',
                options: ['watt', 'joule', 'ohm', 'coulomb per second squared'],
                answerIndex: 2,
                explanation: 'Resistance is measured in ohms.',
              ),
              LearningQuestion(
                id: 'electricity-magnetism-4',
                question: 'Which law relates voltage, current and resistance?',
                options: ['Ohm law', 'Newton law', 'Boyle law', 'Snell law'],
                answerIndex: 0,
                explanation:
                    'Ohm law states that voltage equals current times resistance for an ohmic conductor.',
              ),
              LearningQuestion(
                id: 'electricity-magnetism-5',
                question: 'What does a closed circuit allow?',
                options: [
                  'current to flow',
                  'all charge to disappear',
                  'resistance to become negative',
                  'gravity to stop',
                ],
                answerIndex: 0,
                explanation:
                    'A complete conducting path allows current to flow.',
              ),
              LearningQuestion(
                id: 'electricity-magnetism-6',
                question: 'What is the common symbol for electrical current?',
                options: ['V', 'I', 'R', 'P'],
                answerIndex: 1,
                explanation: 'Current is commonly represented by I.',
              ),
              LearningQuestion(
                id: 'electricity-magnetism-7',
                question: 'What is the SI unit of magnetic field strength B?',
                options: ['tesla', 'watt', 'ampere-hour', 'litre'],
                answerIndex: 0,
                explanation: 'Magnetic flux density B is measured in teslas.',
              ),
              LearningQuestion(
                id: 'electricity-magnetism-8',
                question: 'What happens between opposite magnetic poles?',
                options: [
                  'they repel',
                  'they attract',
                  'they vanish',
                  'they stop gravity',
                ],
                answerIndex: 1,
                explanation: 'Opposite magnetic poles attract.',
              ),
              LearningQuestion(
                id: 'electricity-magnetism-9',
                question:
                    'Which material is commonly attracted strongly by a magnet?',
                options: ['wood', 'plastic', 'iron', 'glass'],
                answerIndex: 2,
                explanation: 'Iron is ferromagnetic.',
              ),
              LearningQuestion(
                id: 'electricity-magnetism-10',
                question:
                    'In a series circuit, the current through each component is...',
                options: [
                  'the same',
                  'always zero',
                  'different by definition',
                  'unmeasurable',
                ],
                answerIndex: 0,
                explanation: 'A series circuit has one path for current.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'heat-thermodynamics',
        title: 'Heat & Thermodynamics',
        description: 'Temperature, heat transfer and thermal energy.',
        quizzes: [
          LearningQuiz(
            id: 'heat-thermodynamics-beginner',
            title: 'Heat and Thermodynamics Basics',
            description: 'A beginner quiz with 10 questions.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'heat-thermodynamics-1',
                question: 'What is the SI unit of temperature?',
                options: ['kelvin', 'joule', 'watt', 'newton'],
                answerIndex: 0,
                explanation:
                    'The SI base unit of thermodynamic temperature is kelvin.',
              ),
              LearningQuestion(
                id: 'heat-thermodynamics-2',
                question: 'Heat naturally flows from...',
                options: [
                  'cold to hot without work',
                  'hotter objects to colder objects',
                  'low mass to high mass only',
                  'vacuum to matter only',
                ],
                answerIndex: 1,
                explanation:
                    'Net heat transfer is from higher temperature to lower temperature.',
              ),
              LearningQuestion(
                id: 'heat-thermodynamics-3',
                question: 'What instrument measures temperature?',
                options: ['barometer', 'thermometer', 'ammeter', 'voltmeter'],
                answerIndex: 1,
                explanation: 'A thermometer measures temperature.',
              ),
              LearningQuestion(
                id: 'heat-thermodynamics-4',
                question:
                    'Which process transfers heat through direct contact?',
                options: [
                  'conduction',
                  'reflection',
                  'refraction',
                  'evaporation only',
                ],
                answerIndex: 0,
                explanation:
                    'Conduction transfers energy through interacting particles.',
              ),
              LearningQuestion(
                id: 'heat-thermodynamics-5',
                question: 'Which heat transfer can occur through a vacuum?',
                options: [
                  'conduction',
                  'convection',
                  'radiation',
                  'none of them',
                ],
                answerIndex: 2,
                explanation: 'Radiation does not require a material medium.',
              ),
              LearningQuestion(
                id: 'heat-thermodynamics-6',
                question: 'What happens to most substances when heated?',
                options: [
                  'they always shrink',
                  'they generally expand',
                  'their mass doubles',
                  'their atoms vanish',
                ],
                answerIndex: 1,
                explanation:
                    'Many materials expand when their temperature increases.',
              ),
              LearningQuestion(
                id: 'heat-thermodynamics-7',
                question: 'What is the SI unit of energy transferred as heat?',
                options: ['joule', 'kelvin', 'metre', 'ampere'],
                answerIndex: 0,
                explanation: 'Heat is energy and is measured in joules.',
              ),
              LearningQuestion(
                id: 'heat-thermodynamics-8',
                question: 'What is evaporation?',
                options: [
                  'liquid changing to gas at its surface',
                  'gas changing directly to solid',
                  'solid changing to liquid only',
                  'freezing',
                ],
                answerIndex: 0,
                explanation: 'Evaporation occurs at a liquid surface.',
              ),
              LearningQuestion(
                id: 'heat-thermodynamics-9',
                question: 'What does insulation aim to do?',
                options: [
                  'increase unwanted heat transfer',
                  'reduce heat transfer',
                  'create energy from nothing',
                  'remove all temperature',
                ],
                answerIndex: 1,
                explanation: 'Insulation reduces the rate of heat transfer.',
              ),
              LearningQuestion(
                id: 'heat-thermodynamics-10',
                question:
                    'What is the boiling point of pure water at standard atmospheric pressure?',
                options: ['0 C', '50 C', '100 C', '200 C'],
                answerIndex: 2,
                explanation:
                    'Pure water boils at about 100 degrees Celsius at 1 atmosphere.',
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  LearningSubject(
    id: 'chemistry',
    title: 'Chemistry',
    description: 'Study matter, elements, reactions and chemical properties.',
    iconKey: 'chemistry',
    topics: [
      LearningTopic(
        id: 'chemistry-fundamentals',
        title: 'Chemistry Fundamentals',
        description: 'Explore atoms, elements, mixtures and chemical changes.',
        quizzes: [
          LearningQuiz(
            id: 'chemistry-fundamentals-beginner',
            title: 'Chemistry Foundations',
            description: 'Review essential concepts about matter and atoms.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'chem1',
                question:
                    'What is the smallest unit of an element that retains its chemical identity?',
                options: ['Cell', 'Atom', 'Tissue', 'Crystal only'],
                answerIndex: 1,
                explanation:
                    'An atom is the smallest unit of an element that retains its chemical identity.',
              ),
              LearningQuestion(
                id: 'chem2',
                question: 'What is the chemical symbol for oxygen?',
                options: ['Ox', 'O', 'Og', 'Oy'],
                answerIndex: 1,
                explanation: 'The chemical symbol for oxygen is O.',
              ),
              LearningQuestion(
                id: 'chem3',
                question: 'What is H₂O commonly known as?',
                options: ['Hydrogen', 'Oxygen', 'Water', 'Hydrogen peroxide'],
                answerIndex: 2,
                explanation:
                    'A water molecule contains two hydrogen atoms and one oxygen atom.',
              ),
              LearningQuestion(
                id: 'chem4',
                question: 'Which particle has a negative electric charge?',
                options: [
                  'Proton',
                  'Neutron',
                  'Electron',
                  'Atomic nucleus as a whole',
                ],
                answerIndex: 2,
                explanation: 'Electrons carry a negative electric charge.',
              ),
              LearningQuestion(
                id: 'chem5',
                question: 'What is the chemical symbol for sodium?',
                options: ['S', 'So', 'Na', 'N'],
                answerIndex: 2,
                explanation:
                    'Sodium’s symbol is Na, from its Latin name natrium.',
              ),
              LearningQuestion(
                id: 'chem6',
                question:
                    'A substance with a pH below 7 is generally described as what at room temperature?',
                options: ['Acidic', 'Neutral', 'Basic', 'Metallic'],
                answerIndex: 0,
                explanation:
                    'At about 25°C, aqueous solutions with pH below 7 are acidic.',
              ),
              LearningQuestion(
                id: 'chem7',
                question: 'Which of these is a noble gas?',
                options: ['Sodium', 'Neon', 'Chlorine', 'Carbon'],
                answerIndex: 1,
                explanation: 'Neon belongs to Group 18, the noble gases.',
              ),
              LearningQuestion(
                id: 'chem8',
                question: 'What does a chemical formula show?',
                options: [
                  'Only the colour of a substance',
                  'The types and relative numbers of atoms',
                  'The age of a sample',
                  'The temperature at which it was discovered',
                ],
                answerIndex: 1,
                explanation:
                    'A chemical formula represents which elements are present and their proportions.',
              ),
              LearningQuestion(
                id: 'chem9',
                question:
                    'Which process changes a liquid into a gas at its surface?',
                options: [
                  'Freezing',
                  'Condensation',
                  'Evaporation',
                  'Deposition',
                ],
                answerIndex: 2,
                explanation:
                    'Evaporation occurs when particles escape from a liquid surface into the gas phase.',
              ),
              LearningQuestion(
                id: 'chem10',
                question:
                    'Which subatomic particle is found in the nucleus and has no electric charge?',
                options: ['Electron', 'Proton', 'Neutron', 'Positron'],
                answerIndex: 2,
                explanation:
                    'Neutrons are electrically neutral particles found in atomic nuclei.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'atomic-structure',
        title: 'Atomic Structure',
        description: 'Atoms, particles, isotopes and electron arrangement.',
        quizzes: [
          LearningQuiz(
            id: 'atomic-structure-beginner',
            title: 'Atomic Structure Basics',
            description: 'A beginner quiz with 10 questions.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'atomic-structure-1',
                question: 'Which particle has a negative electric charge?',
                options: ['proton', 'neutron', 'electron', 'nucleus'],
                answerIndex: 2,
                explanation: 'Electrons carry negative charge.',
              ),
              LearningQuestion(
                id: 'atomic-structure-2',
                question: 'Which particle has a positive electric charge?',
                options: ['electron', 'proton', 'neutron', 'photon'],
                answerIndex: 1,
                explanation: 'Protons carry positive charge.',
              ),
              LearningQuestion(
                id: 'atomic-structure-3',
                question: 'Which particle has no net electric charge?',
                options: ['proton', 'electron', 'neutron', 'ion'],
                answerIndex: 2,
                explanation: 'Neutrons are electrically neutral.',
              ),
              LearningQuestion(
                id: 'atomic-structure-4',
                question: 'Where are protons and neutrons found?',
                options: [
                  'electron shell',
                  'nucleus',
                  'outer orbit only',
                  'chemical bond',
                ],
                answerIndex: 1,
                explanation: 'The nucleus contains protons and neutrons.',
              ),
              LearningQuestion(
                id: 'atomic-structure-5',
                question: 'The atomic number equals the number of...',
                options: ['neutrons', 'protons', 'shells', 'molecules'],
                answerIndex: 1,
                explanation:
                    'Atomic number is defined by the number of protons.',
              ),
              LearningQuestion(
                id: 'atomic-structure-6',
                question: 'Isotopes of an element have different numbers of...',
                options: [
                  'protons',
                  'neutrons',
                  'atomic numbers always',
                  'elements',
                ],
                answerIndex: 1,
                explanation:
                    'Isotopes share proton number but differ in neutron number.',
              ),
              LearningQuestion(
                id: 'atomic-structure-7',
                question: 'A neutral atom has equal numbers of...',
                options: [
                  'protons and electrons',
                  'protons and neutrons always',
                  'neutrons and shells',
                  'ions and molecules',
                ],
                answerIndex: 0,
                explanation:
                    'Equal positive and negative charges make the atom neutral.',
              ),
              LearningQuestion(
                id: 'atomic-structure-8',
                question: 'What is an ion?',
                options: [
                  'an atom or group with net charge',
                  'a neutral neutron',
                  'a type of light',
                  'a unit of mass only',
                ],
                answerIndex: 0,
                explanation:
                    'Ions have gained or lost electrons and carry net charge.',
              ),
              LearningQuestion(
                id: 'atomic-structure-9',
                question:
                    'Which subatomic particle contributes most of an atom\'s volume outside the nucleus?',
                options: [
                  'proton',
                  'neutron',
                  'electron cloud',
                  'nuclear core',
                ],
                answerIndex: 2,
                explanation:
                    'The electron cloud occupies most of the atom\'s volume.',
              ),
              LearningQuestion(
                id: 'atomic-structure-10',
                question: 'What does the mass number represent?',
                options: [
                  'protons only',
                  'neutrons only',
                  'protons plus neutrons',
                  'electrons plus shells',
                ],
                answerIndex: 2,
                explanation:
                    'Mass number is the total number of protons and neutrons.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'chemical-bonding',
        title: 'Chemical Bonding',
        description: 'Ionic, covalent and metallic bonding.',
        quizzes: [
          LearningQuiz(
            id: 'chemical-bonding-beginner',
            title: 'Chemical Bonding Basics',
            description: 'A beginner quiz with 10 questions.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'chemical-bonding-1',
                question: 'An ionic bond involves...',
                options: [
                  'transfer of electrons and attraction of ions',
                  'sharing neutrons',
                  'sharing nuclei',
                  'no electrostatic force',
                ],
                answerIndex: 0,
                explanation:
                    'Ionic bonding is attraction between oppositely charged ions after electron transfer.',
              ),
              LearningQuestion(
                id: 'chemical-bonding-2',
                question: 'A covalent bond usually involves...',
                options: [
                  'sharing electron pairs',
                  'transferring protons between nuclei',
                  'sharing whole atoms',
                  'removing all electrons',
                ],
                answerIndex: 0,
                explanation:
                    'Covalent bonds form when atoms share electron pairs.',
              ),
              LearningQuestion(
                id: 'chemical-bonding-3',
                question: 'Which pair commonly forms an ionic compound?',
                options: [
                  'sodium and chlorine',
                  'two helium atoms',
                  'two neon atoms',
                  'two argon atoms',
                ],
                answerIndex: 0,
                explanation:
                    'Sodium and chlorine form ions that attract electrostatically.',
              ),
              LearningQuestion(
                id: 'chemical-bonding-4',
                question: 'What type of bond is found within a water molecule?',
                options: ['covalent', 'metallic', 'ionic only', 'nuclear'],
                answerIndex: 0,
                explanation:
                    'Oxygen and hydrogen share electrons in covalent bonds.',
              ),
              LearningQuestion(
                id: 'chemical-bonding-5',
                question: 'Why do metals conduct electricity?',
                options: [
                  'mobile electrons carry charge',
                  'their protons move through wire',
                  'they contain no electrons',
                  'they are always liquids',
                ],
                answerIndex: 0,
                explanation: 'Delocalised electrons can move through a metal.',
              ),
              LearningQuestion(
                id: 'chemical-bonding-6',
                question: 'What is a molecule?',
                options: [
                  'two or more atoms chemically bonded',
                  'a single proton',
                  'a charged wire',
                  'a mixture always',
                ],
                answerIndex: 0,
                explanation:
                    'Molecules contain atoms joined by chemical bonds.',
              ),
              LearningQuestion(
                id: 'chemical-bonding-7',
                question: 'What is a chemical formula used for?',
                options: [
                  'showing types and ratios of atoms',
                  'showing temperature only',
                  'measuring force',
                  'listing planets',
                ],
                answerIndex: 0,
                explanation:
                    'Chemical formulas represent elements and atom counts or ratios.',
              ),
              LearningQuestion(
                id: 'chemical-bonding-8',
                question: 'What does a single covalent bond represent?',
                options: [
                  'one shared electron pair',
                  'three shared nuclei',
                  'one proton transfer only',
                  'no electrons',
                ],
                answerIndex: 0,
                explanation:
                    'A single covalent bond consists of one shared pair of electrons.',
              ),
              LearningQuestion(
                id: 'chemical-bonding-9',
                question:
                    'Which substance consists of a giant covalent network?',
                options: [
                  'diamond',
                  'sodium chloride crystal only',
                  'helium gas',
                  'liquid water only',
                ],
                answerIndex: 0,
                explanation:
                    'Diamond is a network of covalently bonded carbon atoms.',
              ),
              LearningQuestion(
                id: 'chemical-bonding-10',
                question: 'What is the main attraction in an ionic lattice?',
                options: [
                  'attraction between opposite charges',
                  'gravity between planets only',
                  'magnetic attraction only',
                  'shared sound waves',
                ],
                answerIndex: 0,
                explanation:
                    'Oppositely charged ions attract in an ionic lattice.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'acids-bases',
        title: 'Acids & Bases',
        description: 'Acidity, alkalinity, pH and neutralisation.',
        quizzes: [
          LearningQuiz(
            id: 'acids-bases-beginner',
            title: 'Acids and Bases Basics',
            description: 'A beginner quiz with 10 questions.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'acids-bases-1',
                question: 'An acid in water increases the concentration of...',
                options: [
                  'hydrogen ions',
                  'oxygen atoms only',
                  'metal atoms',
                  'neutrons',
                ],
                answerIndex: 0,
                explanation:
                    'Acids increase hydrogen ion concentration in aqueous solution.',
              ),
              LearningQuestion(
                id: 'acids-bases-2',
                question: 'A base can neutralise an...',
                options: [
                  'acid',
                  'electron shell',
                  'isotope',
                  'electric current',
                ],
                answerIndex: 0,
                explanation: 'Acids and bases react in neutralisation.',
              ),
              LearningQuestion(
                id: 'acids-bases-3',
                question: 'What is the pH of a neutral solution at about 25 C?',
                options: ['1', '5', '7', '14'],
                answerIndex: 2,
                explanation:
                    'Neutral water has pH approximately 7 at 25 degrees Celsius.',
              ),
              LearningQuestion(
                id: 'acids-bases-4',
                question: 'A solution with pH 2 is...',
                options: ['acidic', 'neutral', 'alkaline', 'always pure water'],
                answerIndex: 0,
                explanation:
                    'A pH below 7 is acidic under standard introductory conditions.',
              ),
              LearningQuestion(
                id: 'acids-bases-5',
                question: 'A solution with pH 12 is...',
                options: ['acidic', 'neutral', 'alkaline', 'metallic'],
                answerIndex: 2,
                explanation:
                    'A pH above 7 is alkaline under standard introductory conditions.',
              ),
              LearningQuestion(
                id: 'acids-bases-6',
                question:
                    'Which indicator is commonly used to estimate pH by colour?',
                options: [
                  'universal indicator',
                  'copper wire',
                  'sugar',
                  'distilled oil',
                ],
                answerIndex: 0,
                explanation:
                    'Universal indicator changes colour across a pH range.',
              ),
              LearningQuestion(
                id: 'acids-bases-7',
                question:
                    'What is commonly produced when an acid reacts with a base?',
                options: [
                  'salt and water',
                  'oxygen only',
                  'pure metal only',
                  'sand and glass',
                ],
                answerIndex: 0,
                explanation: 'Neutralisation commonly produces salt and water.',
              ),
              LearningQuestion(
                id: 'acids-bases-8',
                question:
                    'Which ion is associated with alkaline solutions in the Arrhenius model?',
                options: [
                  'hydroxide ion',
                  'neutron',
                  'chloride only',
                  'electron shell',
                ],
                answerIndex: 0,
                explanation:
                    'Arrhenius bases increase hydroxide ion concentration in water.',
              ),
              LearningQuestion(
                id: 'acids-bases-9',
                question:
                    'What is the approximate pH range of an aqueous solution?',
                options: [
                  '0 to 14 in common introductory examples',
                  'always 7 to 9',
                  'negative 100 to negative 50 only',
                  'always exactly 1',
                ],
                answerIndex: 0,
                explanation:
                    'Many introductory pH examples use a 0 to 14 scale, though values can extend beyond it.',
              ),
              LearningQuestion(
                id: 'acids-bases-10',
                question: 'Which is a common laboratory acid?',
                options: [
                  'hydrochloric acid',
                  'sodium hydroxide',
                  'sodium chloride',
                  'calcium carbonate',
                ],
                answerIndex: 0,
                explanation: 'Hydrochloric acid is a common laboratory acid.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'reactions-stoichiometry',
        title: 'Reactions & Stoichiometry',
        description: 'Reaction types, balancing equations and mole ratios.',
        quizzes: [
          LearningQuiz(
            id: 'reactions-stoichiometry-beginner',
            title: 'Chemical Reactions Basics',
            description: 'A beginner quiz with 10 questions.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'reactions-stoichiometry-1',
                question:
                    'What must be conserved when balancing a chemical equation?',
                options: [
                  'number of atoms of each element',
                  'colour of the container',
                  'temperature only',
                  'shape of the flask',
                ],
                answerIndex: 0,
                explanation:
                    'Balanced equations conserve atoms of each element.',
              ),
              LearningQuestion(
                id: 'reactions-stoichiometry-2',
                question: 'What is a reactant?',
                options: [
                  'starting substance in a reaction',
                  'product formed only',
                  'measuring tool',
                  'reaction container',
                ],
                answerIndex: 0,
                explanation:
                    'Reactants are present before the reaction proceeds.',
              ),
              LearningQuestion(
                id: 'reactions-stoichiometry-3',
                question: 'What is a product?',
                options: [
                  'substance formed by a reaction',
                  'starting substance only',
                  'catalyst always',
                  'laboratory notebook',
                ],
                answerIndex: 0,
                explanation: 'Products are formed in a chemical reaction.',
              ),
              LearningQuestion(
                id: 'reactions-stoichiometry-4',
                question: 'What does a catalyst do?',
                options: [
                  'changes reaction rate without being consumed overall',
                  'changes atoms into elements always',
                  'adds mass from nothing',
                  'stops every reaction',
                ],
                answerIndex: 0,
                explanation:
                    'A catalyst provides an alternative pathway and is regenerated overall.',
              ),
              LearningQuestion(
                id: 'reactions-stoichiometry-5',
                question: 'What is the chemical formula for water?',
                options: ['CO2', 'H2O', 'NaCl', 'O2'],
                answerIndex: 1,
                explanation:
                    'Water contains two hydrogen atoms and one oxygen atom per molecule.',
              ),
              LearningQuestion(
                id: 'reactions-stoichiometry-6',
                question:
                    'What is the coefficient of oxygen when balancing 2H2 + O2 -> 2H2O?',
                options: ['1', '2', '3', '4'],
                answerIndex: 0,
                explanation:
                    'One oxygen molecule supplies the two oxygen atoms in two water molecules.',
              ),
              LearningQuestion(
                id: 'reactions-stoichiometry-7',
                question:
                    'What is the relative formula mass of H2O using H=1 and O=16?',
                options: ['16', '17', '18', '20'],
                answerIndex: 2,
                explanation:
                    'Two hydrogen units plus one oxygen unit gives 2 plus 16 equals 18.',
              ),
              LearningQuestion(
                id: 'reactions-stoichiometry-8',
                question: 'What unit is commonly used for amount of substance?',
                options: ['mole', 'watt', 'pascal', 'tesla'],
                answerIndex: 0,
                explanation: 'The SI unit for amount of substance is the mole.',
              ),
              LearningQuestion(
                id: 'reactions-stoichiometry-9',
                question:
                    'A synthesis reaction generally combines substances to form...',
                options: [
                  'a more complex product',
                  'only separate elements forever',
                  'no products',
                  'only heat',
                ],
                answerIndex: 0,
                explanation:
                    'Synthesis combines reactants into one or more products, often a single compound.',
              ),
              LearningQuestion(
                id: 'reactions-stoichiometry-10',
                question: 'In a chemical equation, the arrow usually means...',
                options: [
                  'yields or produces',
                  'is colder than',
                  'is electrically grounded',
                  'has greater mass always',
                ],
                answerIndex: 0,
                explanation: 'The arrow separates reactants from products.',
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  LearningSubject(
    id: 'information-technology',
    title: 'Information Technology',
    description: 'Understand computers, software, data and digital safety.',
    iconKey: 'computer',
    topics: [
      LearningTopic(
        id: 'it-fundamentals',
        title: 'IT Fundamentals',
        description: 'Learn about hardware, software, files and online safety.',
        quizzes: [
          LearningQuiz(
            id: 'it-fundamentals-beginner',
            title: 'IT Foundations',
            description:
                'Test everyday computer and information technology concepts.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'it1',
                question: 'What does CPU stand for?',
                options: [
                  'Central Processing Unit',
                  'Computer Personal Utility',
                  'Core Program Upload',
                  'Central Print Unit',
                ],
                answerIndex: 0,
                explanation: 'CPU stands for Central Processing Unit.',
              ),
              LearningQuestion(
                id: 'it2',
                question: 'Which device is commonly used to enter text?',
                options: ['Monitor', 'Keyboard', 'Speaker', 'Projector'],
                answerIndex: 1,
                explanation:
                    'A keyboard is a standard input device for entering text.',
              ),
              LearningQuestion(
                id: 'it3',
                question: 'Which is an example of an operating system?',
                options: [
                  'Microsoft Word',
                  'Google Chrome',
                  'Windows',
                  'Adobe Photoshop',
                ],
                answerIndex: 2,
                explanation:
                    'Windows is an operating system that manages computer hardware and software resources.',
              ),
              LearningQuestion(
                id: 'it4',
                question: 'What is RAM primarily used for?',
                options: [
                  'Long-term archival storage',
                  'Temporary working memory',
                  'Printing documents',
                  'Cooling a processor',
                ],
                answerIndex: 1,
                explanation:
                    'RAM temporarily stores data and instructions used by running programs.',
              ),
              LearningQuestion(
                id: 'it5',
                question:
                    'Which file extension commonly identifies a PDF document?',
                options: ['.mp3', '.jpg', '.pdf', '.exe'],
                answerIndex: 2,
                explanation:
                    'The .pdf extension commonly identifies a Portable Document Format file.',
              ),
              LearningQuestion(
                id: 'it6',
                question: 'What is phishing?',
                options: [
                  'A way to improve screen resolution',
                  'A type of printer',
                  'A deceptive attempt to obtain sensitive information',
                  'A method of compressing video',
                ],
                answerIndex: 2,
                explanation:
                    'Phishing uses deceptive messages or sites to trick people into revealing information or taking unsafe actions.',
              ),
              LearningQuestion(
                id: 'it7',
                question: 'Which is a strong account-security practice?',
                options: [
                  'Reuse one password everywhere',
                  'Share passwords publicly',
                  'Use unique passwords and multifactor authentication',
                  'Disable all security updates',
                ],
                answerIndex: 2,
                explanation:
                    'Unique passwords and multifactor authentication reduce the risk of account compromise.',
              ),
              LearningQuestion(
                id: 'it8',
                question: 'What is cloud storage?',
                options: [
                  'Saving data on remote servers accessed over a network',
                  'Keeping files only on paper',
                  'A type of keyboard',
                  'Deleting files automatically every day',
                ],
                answerIndex: 0,
                explanation:
                    'Cloud storage keeps data on remote systems that can be accessed over a network.',
              ),
              LearningQuestion(
                id: 'it9',
                question: 'What is a backup?',
                options: [
                  'A duplicate copy of data for recovery',
                  'A screen brightness setting',
                  'A processor instruction',
                  'A kind of web browser',
                ],
                answerIndex: 0,
                explanation:
                    'A backup is a separate copy used to recover data after loss or damage.',
              ),
              LearningQuestion(
                id: 'it10',
                question: 'What does a web browser do?',
                options: [
                  'Manufactures computer chips',
                  'Displays and interacts with web content',
                  'Replaces all network hardware',
                  'Only edits spreadsheets',
                ],
                answerIndex: 1,
                explanation:
                    'A web browser retrieves and presents web content and lets users interact with websites.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'operating-systems',
        title: 'Operating Systems',
        description: 'Operating system functions, processes and memory.',
        quizzes: [
          LearningQuiz(
            id: 'operating-systems-beginner',
            title: 'Operating Systems Basics',
            description: 'A beginner quiz with 10 questions.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'operating-systems-1',
                question: 'What is a primary role of an operating system?',
                options: [
                  'managing hardware and software resources',
                  'printing web pages only',
                  'replacing the CPU',
                  'creating electricity',
                ],
                answerIndex: 0,
                explanation:
                    'An operating system manages resources and provides services to applications.',
              ),
              LearningQuestion(
                id: 'operating-systems-2',
                question: 'Which is an example of an operating system?',
                options: ['Linux', 'HTML', 'HTTP', 'SQL query'],
                answerIndex: 0,
                explanation: 'Linux is an operating system.',
              ),
              LearningQuestion(
                id: 'operating-systems-3',
                question: 'What is a process?',
                options: [
                  'a program in execution',
                  'a keyboard key',
                  'a web address',
                  'a file extension only',
                ],
                answerIndex: 0,
                explanation: 'A process is a running instance of a program.',
              ),
              LearningQuestion(
                id: 'operating-systems-4',
                question: 'What does multitasking allow a system to do?',
                options: [
                  'manage multiple tasks over time',
                  'run without memory',
                  'remove all software',
                  'turn every file into hardware',
                ],
                answerIndex: 0,
                explanation:
                    'Multitasking lets the OS share processing time among tasks.',
              ),
              LearningQuestion(
                id: 'operating-systems-5',
                question: 'What is virtual memory used for?',
                options: [
                  'using storage to extend the apparent memory space',
                  'increasing screen brightness',
                  'connecting a mouse',
                  'encrypting every website',
                ],
                answerIndex: 0,
                explanation:
                    'Virtual memory uses storage as part of the memory management system.',
              ),
              LearningQuestion(
                id: 'operating-systems-6',
                question: 'Which component schedules CPU time for processes?',
                options: [
                  'operating system scheduler',
                  'monitor stand',
                  'printer cartridge',
                  'web server certificate',
                ],
                answerIndex: 0,
                explanation:
                    'The scheduler selects processes or threads to run.',
              ),
              LearningQuestion(
                id: 'operating-systems-7',
                question: 'What is a file system responsible for?',
                options: [
                  'organising files and directories',
                  'cooling the CPU directly',
                  'creating network cables',
                  'measuring voltage',
                ],
                answerIndex: 0,
                explanation: 'File systems organise stored data and metadata.',
              ),
              LearningQuestion(
                id: 'operating-systems-8',
                question: 'What is a device driver?',
                options: [
                  'software that helps the OS communicate with hardware',
                  'a type of monitor',
                  'a user password',
                  'a spreadsheet formula',
                ],
                answerIndex: 0,
                explanation:
                    'Drivers provide software interfaces to hardware devices.',
              ),
              LearningQuestion(
                id: 'operating-systems-9',
                question: 'Why are user accounts used?',
                options: [
                  'to separate identities and permissions',
                  'to increase battery voltage',
                  'to remove the operating system',
                  'to make every file public',
                ],
                answerIndex: 0,
                explanation:
                    'Accounts support identity, access control and personal settings.',
              ),
              LearningQuestion(
                id: 'operating-systems-10',
                question: 'What is booting?',
                options: [
                  'starting a computer and loading its operating system',
                  'deleting every file',
                  'closing a browser tab',
                  'formatting a paragraph',
                ],
                answerIndex: 0,
                explanation: 'Booting initializes the system and loads the OS.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'web-technologies',
        title: 'Web Technologies',
        description: 'Web pages, browsers, HTML, CSS and HTTP.',
        quizzes: [
          LearningQuiz(
            id: 'web-technologies-beginner',
            title: 'Web Technologies Basics',
            description: 'A beginner quiz with 10 questions.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'web-technologies-1',
                question: 'What does HTML primarily define?',
                options: [
                  'structure and content of web pages',
                  'electric current',
                  'database backups only',
                  'wireless signal strength',
                ],
                answerIndex: 0,
                explanation:
                    'HTML describes the structure and content of web documents.',
              ),
              LearningQuestion(
                id: 'web-technologies-2',
                question: 'What does CSS primarily control?',
                options: [
                  'visual presentation and layout',
                  'server electricity',
                  'CPU instructions',
                  'email delivery only',
                ],
                answerIndex: 0,
                explanation:
                    'CSS styles the appearance and layout of web pages.',
              ),
              LearningQuestion(
                id: 'web-technologies-3',
                question: 'What is JavaScript commonly used for on websites?',
                options: [
                  'interactive behaviour',
                  'measuring temperature',
                  'replacing all HTML files',
                  'routing electrical current',
                ],
                answerIndex: 0,
                explanation:
                    'JavaScript can implement client-side interactivity and application logic.',
              ),
              LearningQuestion(
                id: 'web-technologies-4',
                question: 'What is a web browser?',
                options: [
                  'software used to access and display web content',
                  'a type of operating system kernel only',
                  'a network cable',
                  'a database table',
                ],
                answerIndex: 0,
                explanation: 'Browsers request and render web resources.',
              ),
              LearningQuestion(
                id: 'web-technologies-5',
                question: 'What does HTTP stand for?',
                options: [
                  'Hypertext Transfer Protocol',
                  'High Transfer Text Program',
                  'Host Tracking Tool Process',
                  'Hyperlink Table Transfer Port',
                ],
                answerIndex: 0,
                explanation: 'HTTP is the Hypertext Transfer Protocol.',
              ),
              LearningQuestion(
                id: 'web-technologies-6',
                question:
                    'Which protocol is HTTP with transport encryption commonly called?',
                options: ['HTTPS', 'FTP only', 'SMTP', 'DNS'],
                answerIndex: 0,
                explanation:
                    'HTTPS uses HTTP over a secure encrypted connection, commonly TLS.',
              ),
              LearningQuestion(
                id: 'web-technologies-7',
                question: 'What is a URL used for?',
                options: [
                  'identifying the location of a resource',
                  'measuring file weight',
                  'storing CPU registers',
                  'balancing chemical equations',
                ],
                answerIndex: 0,
                explanation:
                    'A URL identifies a resource and how to locate it.',
              ),
              LearningQuestion(
                id: 'web-technologies-8',
                question: 'What does responsive design aim to do?',
                options: [
                  'adapt layouts to different screen sizes',
                  'force every screen to be identical',
                  'disable mobile access',
                  'remove all text',
                ],
                answerIndex: 0,
                explanation:
                    'Responsive layouts adjust to viewport and device constraints.',
              ),
              LearningQuestion(
                id: 'web-technologies-9',
                question: 'What is a hyperlink?',
                options: [
                  'a clickable reference to another resource or location',
                  'a type of battery',
                  'a programming error only',
                  'a printer setting',
                ],
                answerIndex: 0,
                explanation: 'Hyperlinks connect documents or locations.',
              ),
              LearningQuestion(
                id: 'web-technologies-10',
                question: 'What does a web server generally do?',
                options: [
                  'responds to requests for web resources',
                  'only edits photos locally',
                  'replaces a browser screen',
                  'measures magnetic fields',
                ],
                answerIndex: 0,
                explanation:
                    'Web servers handle requests and return resources or responses.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'cybersecurity',
        title: 'Cybersecurity',
        description: 'Digital safety, threats, authentication and privacy.',
        quizzes: [
          LearningQuiz(
            id: 'cybersecurity-beginner',
            title: 'Cybersecurity Basics',
            description: 'A beginner quiz with 10 questions.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'cybersecurity-1',
                question: 'What is phishing?',
                options: [
                  'deceptive attempts to steal information',
                  'a secure backup method',
                  'a type of monitor',
                  'a file compression format',
                ],
                answerIndex: 0,
                explanation:
                    'Phishing uses deceptive messages or sites to obtain sensitive information.',
              ),
              LearningQuestion(
                id: 'cybersecurity-2',
                question: 'What is a strong password practice?',
                options: [
                  'use long unique passwords',
                  'reuse one short password everywhere',
                  'share passwords publicly',
                  'write passwords in public posts',
                ],
                answerIndex: 0,
                explanation:
                    'Long unique passwords reduce the impact of guessing and credential reuse.',
              ),
              LearningQuestion(
                id: 'cybersecurity-3',
                question: 'What is multi-factor authentication?',
                options: [
                  'using two or more different authentication factors',
                  'using only a username',
                  'turning off every update',
                  'sharing a password with friends',
                ],
                answerIndex: 0,
                explanation:
                    'MFA combines different factor types to strengthen login security.',
              ),
              LearningQuestion(
                id: 'cybersecurity-4',
                question: 'Why install security updates?',
                options: [
                  'to fix known vulnerabilities',
                  'to guarantee no future risks',
                  'to delete all personal files',
                  'to disable authentication',
                ],
                answerIndex: 0,
                explanation: 'Updates often patch security flaws and bugs.',
              ),
              LearningQuestion(
                id: 'cybersecurity-5',
                question: 'What is encryption used for?',
                options: [
                  'making data unreadable without the appropriate key',
                  'making all data public',
                  'increasing monitor resolution',
                  'removing every password',
                ],
                answerIndex: 0,
                explanation:
                    'Encryption protects confidentiality by transforming data using cryptographic keys.',
              ),
              LearningQuestion(
                id: 'cybersecurity-6',
                question: 'What should you do with a suspicious attachment?',
                options: [
                  'verify the sender and avoid opening until trusted',
                  'open it immediately',
                  'forward it to everyone',
                  'disable security software first',
                ],
                answerIndex: 0,
                explanation:
                    'Unexpected attachments may contain malware or phishing content.',
              ),
              LearningQuestion(
                id: 'cybersecurity-7',
                question: 'What is malware?',
                options: [
                  'software designed to cause harm or misuse systems',
                  'a normal keyboard layout',
                  'a secure network cable',
                  'a type of monitor stand',
                ],
                answerIndex: 0,
                explanation:
                    'Malware includes malicious software such as viruses and ransomware.',
              ),
              LearningQuestion(
                id: 'cybersecurity-8',
                question: 'What is a backup?',
                options: [
                  'a separate copy used for recovery',
                  'a public password',
                  'a type of phishing message',
                  'a replacement for every update',
                ],
                answerIndex: 0,
                explanation: 'Backups help restore data after loss or damage.',
              ),
              LearningQuestion(
                id: 'cybersecurity-9',
                question: 'Why use screen locks on devices?',
                options: [
                  'to reduce unauthorised access',
                  'to increase internet speed always',
                  'to remove encryption',
                  'to make files public',
                ],
                answerIndex: 0,
                explanation:
                    'A screen lock helps prevent access by unauthorised people.',
              ),
              LearningQuestion(
                id: 'cybersecurity-10',
                question: 'What is social engineering?',
                options: [
                  'manipulating people to reveal information or take unsafe actions',
                  'repairing a broken CPU physically',
                  'compressing image files',
                  'designing a web page layout',
                ],
                answerIndex: 0,
                explanation:
                    'Social engineering exploits human trust or behaviour rather than only technical flaws.',
              ),
            ],
          ),
        ],
      ),
      LearningTopic(
        id: 'cloud-computing',
        title: 'Cloud Computing',
        description: 'Cloud services, deployment and scalable resources.',
        quizzes: [
          LearningQuiz(
            id: 'cloud-computing-beginner',
            title: 'Cloud Computing Basics',
            description: 'A beginner quiz with 10 questions.',
            difficulty: DifficultyLevel.beginner,
            estimatedMinutes: 10,
            questions: [
              LearningQuestion(
                id: 'cloud-computing-1',
                question: 'What is cloud computing?',
                options: [
                  'providing computing resources over a network on demand',
                  'storing files only on paper',
                  'using a computer without software',
                  'a type of keyboard',
                ],
                answerIndex: 0,
                explanation:
                    'Cloud computing provides services such as storage and compute remotely.',
              ),
              LearningQuestion(
                id: 'cloud-computing-2',
                question: 'Which is an example of cloud storage?',
                options: [
                  'online file storage service',
                  'a local pencil case',
                  'a printed notebook only',
                  'a disconnected keyboard',
                ],
                answerIndex: 0,
                explanation:
                    'Cloud storage keeps data on remotely managed storage systems.',
              ),
              LearningQuestion(
                id: 'cloud-computing-3',
                question: 'What does IaaS provide?',
                options: [
                  'virtualised computing infrastructure',
                  'finished office documents only',
                  'a physical paper manual',
                  'only email messages',
                ],
                answerIndex: 0,
                explanation:
                    'Infrastructure as a Service offers resources such as virtual machines and networks.',
              ),
              LearningQuestion(
                id: 'cloud-computing-4',
                question: 'What does SaaS provide?',
                options: [
                  'software delivered as a service',
                  'only bare network cables',
                  'a CPU chip without software',
                  'a paper archive',
                ],
                answerIndex: 0,
                explanation:
                    'Software as a Service lets users access hosted applications.',
              ),
              LearningQuestion(
                id: 'cloud-computing-5',
                question: 'What does scalability mean in cloud systems?',
                options: [
                  'adjusting resources to demand',
                  'deleting all user accounts',
                  'fixing capacity forever',
                  'removing the network',
                ],
                answerIndex: 0,
                explanation:
                    'Scalability allows resources to grow or shrink with workload needs.',
              ),
              LearningQuestion(
                id: 'cloud-computing-6',
                question: 'What is a public cloud?',
                options: [
                  'services offered over shared provider infrastructure',
                  'a computer that can never connect to a network',
                  'a single paper file',
                  'a private notebook',
                ],
                answerIndex: 0,
                explanation:
                    'Public cloud services are provided to multiple customers on provider infrastructure.',
              ),
              LearningQuestion(
                id: 'cloud-computing-7',
                question: 'What is a private cloud?',
                options: [
                  'cloud infrastructure dedicated to one organisation',
                  'a public website only',
                  'a type of browser history',
                  'a USB keyboard',
                ],
                answerIndex: 0,
                explanation:
                    'A private cloud is dedicated to a single organisation.',
              ),
              LearningQuestion(
                id: 'cloud-computing-8',
                question:
                    'Why is access management important in cloud services?',
                options: [
                  'to control who can use resources and data',
                  'to remove all passwords',
                  'to make every file public',
                  'to stop all backups',
                ],
                answerIndex: 0,
                explanation:
                    'Access controls restrict use to authorised identities and roles.',
              ),
              LearningQuestion(
                id: 'cloud-computing-9',
                question: 'What is a cloud region?',
                options: [
                  'a geographic area containing cloud infrastructure locations',
                  'a password format',
                  'a spreadsheet formula',
                  'a kind of monitor',
                ],
                answerIndex: 0,
                explanation:
                    'Providers organise infrastructure into geographic regions.',
              ),
              LearningQuestion(
                id: 'cloud-computing-10',
                question: 'What is one benefit of cloud backups?',
                options: [
                  'data can be recovered after local device failure',
                  'they guarantee zero risk',
                  'they make passwords unnecessary',
                  'they prevent every outage',
                ],
                answerIndex: 0,
                explanation:
                    'A separate cloud copy can support recovery if a local device is lost or damaged.',
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
