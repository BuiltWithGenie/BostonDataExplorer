# Boston House Prices

Demo app for the [Boston House Prices](https://www.kaggle.com/datasets/vikrishnan/boston-house-prices) dataset. Created with GenieBuilder, Genie
and Julia.

## Installation

Clone the repository and install the dependencies:

First `cd` into the project directory then run:

```bash
$> julia --project -e 'using Pkg; Pkg.instantiate()'
```

Then run the app

```bash
$> julia --project
```

```julia
julia> using GenieFramework; Genie.loadapp(); Server.isrunning || up() # start server
```

## Usage

Open your browser and navigate to `http://localhost:8000/`

---

Alternatively, register/login at <https://geniecloud.app> and import the app. You can then deploy it to the cloud.