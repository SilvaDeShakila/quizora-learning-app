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
                options: [
                  'A loop',
                  'A constant',
                  'A comment',
                  'A data type',
                ],
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
                options: [
                  'Queue',
                  'Stack',
                  'Binary search tree',
                  'Hash table',
                ],
                answerIndex: 1,
                explanation:
                    'A stack follows last-in, first-out: the most recently added item is removed first.',
              ),
              LearningQuestion(
                id: 'ds2',
                question: 'Which data structure normally follows FIFO order?',
                options: [
                  'Stack',
                  'Heap',
                  'Queue',
                  'Call frame',
                ],
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
                question: 'What is a hash table designed to support efficiently?',
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
                question: 'Which structure is commonly used to represent hierarchical data?',
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
                question: 'What is the time complexity of reading an element by index in a typical array?',
                options: [
                  'O(log n)',
                  'O(n)',
                  'O(n²)',
                  'O(1)',
                ],
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
                question: 'Why is choosing a suitable data structure important?',
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
                options: [
                  'ORDER BY',
                  'GROUP BY',
                  'WHERE',
                  'CREATE TABLE',
                ],
                answerIndex: 2,
                explanation:
                    'WHERE specifies the condition that rows must satisfy to be included in the query result or affected by an operation.',
              ),
              LearningQuestion(
                id: 'db6',
                question: 'What does database normalisation primarily aim to reduce?',
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
                options: [
                  'DROP',
                  'ALTER',
                  'SELECT',
                  'TRUNCATE',
                ],
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
                question: 'Why should database applications use parameterised queries?',
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
                question: 'Which protocol is commonly used to transfer web pages?',
                options: [
                  'HTTP',
                  'SMTP',
                  'FTP only',
                  'DHCP',
                ],
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
                question: 'What is the purpose of a network switch in a typical LAN?',
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
                question: 'Which transport protocol provides a reliable, ordered byte stream?',
                options: [
                  'UDP',
                  'ARP',
                  'TCP',
                  'ICMP',
                ],
                answerIndex: 2,
                explanation:
                    'TCP provides a reliable, ordered byte stream through mechanisms such as acknowledgements, retransmissions and sequencing.',
              ),
              LearningQuestion(
                id: 'net8',
                question: 'What is the main distinction between bandwidth and latency?',
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
];

