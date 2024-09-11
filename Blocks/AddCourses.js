const courses = [
    {
        DisplayName: "College Algebra",
        Description: "Functions and their properties, polynomial and rational functions, exponential and logarithmic functions, systems of equations and inequalities, sequences, and series.",
        Level: 100,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    },
    {
        DisplayName: "Precalculus",
        Description: "Advanced algebraic concepts, trigonometry, complex numbers, conic sections, polar coordinates, and an introduction to limits.",
        Level: 100,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    },
    {
        DisplayName: "Calculus I",
        Description: "Limits, continuity, derivatives, applications of derivatives, the Mean Value Theorem, and introduction to integrals.",
        Level: 100,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    },
    {
        DisplayName: "Calculus II",
        Description: "Techniques of integration, applications of integrals, sequences and series, parametric equations, polar coordinates.",
        Level: 200,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    },
    {
        DisplayName: "Calculus III",
        Description: "Partial derivatives, multiple integrals, vector calculus, line integrals, Green's Theorem, Stokes' Theorem.",
        Level: 200,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    },
    {
        DisplayName: "Linear Algebra",
        Description: "Matrices, determinants, vector spaces, linear transformations, eigenvalues and eigenvectors, applications to differential equations.",
        Level: 200,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    },
    {
        DisplayName: "Differential Equations",
        Description: "First-order differential equations, higher-order linear differential equations, systems of differential equations, Laplace transforms, applications in physics and engineering.",
        Level: 200,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    },
    {
        DisplayName: "Abstract Algebra",
        Description: "Groups, rings, fields, homomorphisms, factorization, and polynomial rings.",
        Level: 300,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    },
    {
        DisplayName: "Real Analysis",
        Description: "Sequences and series of real numbers, limits, continuity, differentiability, Riemann integrals, sequences, and series of functions.",
        Level: 300,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    },
    {
        DisplayName: "Complex Analysis",
        Description: "Complex numbers, analytic functions, complex integration, Cauchy's Theorem, Laurent series, residue calculus.",
        Level: 300,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    },
    {
        DisplayName: "Topology",
        Description: "Topological spaces, continuous functions, compactness, connectedness, fundamental groups, and covering spaces.",
        Level: 300,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    },
    {
        DisplayName: "Probability and Statistics",
        Description: "Probability theory, random variables, probability distributions, statistical inference, hypothesis testing, regression analysis.",
        Level: 200,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    },
    {
        DisplayName: "Numerical Analysis",
        Description: "Numerical methods for solving equations, numerical integration and differentiation, numerical solutions to differential equations, error analysis.",
        Level: 300,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    },
    {
        DisplayName: "Discrete Mathematics",
        Description: "Logic, set theory, combinatorics, graph theory, algorithms, and their applications.",
        Level: 200,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    },
    {
        DisplayName: "Mathematical Modeling",
        Description: "Formulating mathematical models for real-world problems, solving models using analytical and numerical methods, interpreting results.",
        Level: 300,
        Semester: "",
        Icon: "Plus",
        Category: "Math"
    }
];


async function addCoursesToSmartObject(courses) {
    const properties = courses.map(course => ({
        DisplayName: "ID",
        IsRequired: false,
        PropertyType: "Autonumber",
        Value: "",
        Description: "The key used to identify a specific record.",
        Name: "ID",
        Type: "Property",
        Serialized_Array: ""
    }, {
        DisplayName: "Title",
        IsRequired: false,
        PropertyType: "Text",
        Value: course.DisplayName,
        Description: "",
        Name: "Title",
        Type: "Property",
        Serialized_Array: ""
    }, {
        DisplayName: "Description",
        IsRequired: false,
        PropertyType: "Text",
        Value: course.Description,
        Description: "",
        Name: "Description",
        Type: "Property",
        Serialized_Array: ""
    }, {
        DisplayName: "Level",
        IsRequired: false,
        PropertyType: "Number",
        Value: course.Level,
        Description: "",
        Name: "Level",
        Type: "Property",
        Serialized_Array: ""
    }, {
        DisplayName: "Semester",
        IsRequired: false,
        PropertyType: "Text",
        Value: course.Semester,
        Description: "",
        Name: "Semester",
        Type: "Property",
        Serialized_Array: ""
    }, {
        DisplayName: "icon",
        IsRequired: false,
        PropertyType: "Text",
        Value: course.Icon,
        Description: "",
        Name: "icon",
        Type: "Property",
        Serialized_Array: ""
    }, {
        DisplayName: "Category",
        IsRequired: false,
        PropertyType: "Text",
        Value: course.Category,
        Description: "",
        Name: "Category",
        Type: "Property",
        Serialized_Array: ""
    }));

    const body = JSON.stringify([{
        smartobject: {
            guid: "30c93355-cd38-4151-9ff7-558aa783691d",
            resultName: "Primary_30c93355-cd38-4151-9ff7-558aa783691d_30c93355-cd38-4151-9ff7-558aa783691d",
            method: {
                name: "DxIAROkP3PQD0FbGufYNK_sYSN8Y9uCNPnXRVoKSuyWr50cRVMCJc3T5TziZkmsR3XtO-1kKnMZ9UZAPSUTOH1S6OHDs3NPEd7SS3OhlhzAvIQfplC5izHwwIBByUBYG0"
            },
            properties: {
                Guid: {
                    value: "5bbda6a0-e139-4f75-a6ca-2271cecb1d9e"
                }
            },
            parameters: {
                inputproperties__smartproperty___: {
                    value: JSON.stringify(properties)
                },
                methodname: {
                    value: "Create"
                }
            },
            results: [{
                targetID: "66eaf885-fdb8-b65b-71eb-f4efa0718d35_67aa1d7a-efc4-4c42-99e5-94871bdda213",
                targetType: "Control",
                sourceType: "ObjectProperty",
                sourceID: "SmartObjectResultRow____SmartObjectResultRow___",
                sourceInstanceID: null,
                targetInstanceID: "66eaf885-fdb8-b65b-71eb-f4efa0718d35"
            }]
        },
        metadata: {
            methodexecuted: "DxIAROkP3PQD0FbGufYNK_sYSN8Y9uCNPnXRVoKSuyWr50cRVMCJc3T5TziZkmsR3XtO-1kKnMZ9UZAPSUTOH1S6OHDs3NPEd7SS3OhlhzAvIQfplC5izHwwIBByUBYG0",
            typeofview: "Capture",
            objectid: "30c93355-cd38-4151-9ff7-558aa783691d"
        }
    }]);

    const response = await fetch("https://psemea.onk2.com/Management/Runtime/AjaxCall.ashx", {
        headers: {
            "accept": "application/xml, text/xml, */*, application/json; q=0.01",
            "accept-language": "en-US,en-GB-oxendict;q=0.9,en-GB;q=0.8,en;q=0.7",
            "content-type": "application/json",
            "priority": "u=1, i",
            "request-context": "appId=cid-v1:dac3a731-cb96-436b-b93d-5d3904c1cf79",
            "request-id": "|O3zVl.1eRj5",
            "sec-ch-ua": "\"Not/A)Brand\";v=\"99\", \"Google Chrome\";v=\"103\", \"Chromium\";v=\"103\"",
            "sec-ch-ua-mobile": "?0",
            "sec-ch-ua-platform": "\"Windows\"",
            "sec-fetch-dest": "empty",
            "sec-fetch-mode": "cors",
            "sec-fetch-site": "cross-site",
            "x-client-data": "CJK2yQEIpbbJAQjBtskBCKmdygEIt7XKAQ=="
        },
        referrerPolicy: "strict-origin-when-cross-origin",
        body: body,
        method: "POST",
        mode: "cors",
        credentials: "omit"
    });

    const data = await response.json();
    console.log(data);
}

addCoursesToSmartObject(courses);
