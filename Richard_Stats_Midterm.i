{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "provenance": [],
      "collapsed_sections": [],
      "include_colab_link": true
    },
    "kernelspec": {
      "name": "python3",
      "display_name": "Python 3"
    },
    "language_info": {
      "name": "python"
    }
  },
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "view-in-github",
        "colab_type": "text"
      },
      "source": [
        "<a href=\"https://colab.research.google.com/github/youngbull23/Data-Science-/blob/main/Richard_Stats_Midterm.i\" target=\"_parent\"><img src=\"https://colab.research.google.com/assets/colab-badge.svg\" alt=\"Open In Colab\"/></a>"
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "# STA 2023 Midterm Project\n",
        "\n",
        "Directions:\n",
        "\n",
        "*   Use any and all resources available to you\n",
        "*   Comment and explain the code\n",
        "*   Answer the questions to the best of your abilities\n",
        "*   There are no points for pain: ask for help\n",
        "\n",
        "Save this notebook to your GitHub and submit the link."
      ],
      "metadata": {
        "id": "WyqM99KnfwFM"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "import numpy as np\n",
        "import matplotlib.pyplot as plt"
      ],
      "metadata": {
        "id": "ZE7xzRUigBYy"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "## Part 1: Getting your data\n",
        "\n",
        "Create a google form to input your data.\n",
        "Follow the same method as [Lab 5](https://colab.research.google.com/drive/1zYvyhrz2wVnJXlZqj_PpxOxplfS3LN9Y?usp=sharing)."
      ],
      "metadata": {
        "id": "tkn5UxLMg4GS"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "import pandas as pd\n",
        "def get_database(url): # This function loads the google spreadsheet\n",
        "    url_head = \"https://docs.google.com/spreadsheets/d/\"\n",
        "    url_foot = \"/gviz/tq?tqx=out:csv&sheet=\"\n",
        "    url_body = url.split('/')[5]\n",
        "    sheet_name = \"1\"\n",
        "    url_csv = url_head + url_body + url_foot + sheet_name\n",
        "    df = pd.read_csv(url_csv, sep=',', skiprows=0)\n",
        "    return df"
      ],
      "metadata": {
        "id": "B0XQVmQIgdrp"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "Put your form url here:"
      ],
      "metadata": {
        "id": "e3G1Q_8rjlLI"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "url = 'https://docs.google.com/spreadsheets/d/1XJhAqJmvsQZ_7MiH7OMNV3Sqljy2clhZnOd6ry5JvRI/edit?usp=sharing'"
      ],
      "metadata": {
        "id": "PfAztwghjql2"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "data = get_database(url)"
      ],
      "metadata": {
        "id": "_SA4UhnqjyhY"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "circumferences = data\n",
        "diameters = data"
      ],
      "metadata": {
        "id": "HwjOm5sgj2JA"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "Plot your data points"
      ],
      "metadata": {
        "id": "INpIcEh1mUKn"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "plt.title(\"Circle Diameter vs Circumference\")\n",
        "\n",
        "plt.xlabel( 'Diameters') \n",
        "plt.ylabel( 'Circumferences') \n",
        "\n",
        "plt.plot"
      ],
      "metadata": {
        "id": "uoX4t7tIj8id"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "## Part 2: Linear Fit\n",
        "\n",
        "Follow the steps in the [Linear Fit notebook]() to run a linear fit on your data."
      ],
      "metadata": {
        "id": "IhT_tn8ym8N8"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "best_loss = 100000000\n",
        "\n",
        "best_m = None\n",
        "best_b = None\n",
        "\n",
        "for m_guess in np.linspace(0,10,100):\n",
        "    for b_guess in np.linspace(0,10,100):\n",
        "\n",
        "        y_guess = m_guess * diameters + b_guess \n",
        "\n",
        "        loss = np.sum((y_guess)**2)\n",
        "\n",
        "        if loss < best_loss:\n",
        "\n",
        "            best_m = m_guess\n",
        "            best_b = b_guess\n",
        "            best_loss = loss\n"
      ],
      "metadata": {
        "id": "KZn5uJ31nk4X"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# the form of y=mx+b"
      ],
      "metadata": {
        "id": "FdCo2xmdaEnu"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "Plot the line of best fit:\n",
        "\n",
        "Use blue dots for the collected data and a red line for the estimate."
      ],
      "metadata": {
        "id": "I0KofkS9p7hu"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "plt.title('Linear Fit of Circles')\n",
        "\n",
        "plt.xlabel('Diameter')\n",
        "plt.ylabel('Circumference')\n",
        "\n",
        "# Plot the collected data\n",
        "plt.plot(..., label='Observations') # inner measurement of a circle \n",
        "\n",
        "y_estimate = ...\n",
        "\n",
        "# Plot the line of best fit\n",
        "plt.plot(..., label=f'Estimate: $y = {...} x + {...}$')\n",
        "\n",
        "plt.legend();"
      ],
      "metadata": {
        "id": "xe8G9X7DqACm"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "The estimated relationship is:\n",
        "\n",
        "$C = ? D + ?$"
      ],
      "metadata": {
        "id": "4zCAPG3upXN9"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# C is for the higher variable to find the right percentage "
      ],
      "metadata": {
        "id": "J4hyor-zaX5K"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "## Part 3: Interpretation\n",
        "\n",
        "Answer the questions in text cells"
      ],
      "metadata": {
        "id": "7FBlUtdwt_hd"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# breaks up a fraction of the sum numerator "
      ],
      "metadata": {
        "id": "KUOX1e25qOX5"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "#### Question 1:\n",
        "\n",
        "What do $m$ and $b$ represent in these equations?"
      ],
      "metadata": {
        "id": "9xIvwJhOuGDh"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# represents the slope of a line "
      ],
      "metadata": {
        "id": "55_1WY2Vq6Nh"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "#### Question 2:\n",
        "\n",
        "Guess what the correct values $m$ and $b$ should be."
      ],
      "metadata": {
        "id": "_7xl4z8kubLo"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# y=mx+b+"
      ],
      "metadata": {
        "id": "DzZqWcw7rJaz"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "\n",
        "\n"
      ],
      "metadata": {
        "id": "Te_52DvOuhZ-"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "#### Question 3:\n",
        "\n",
        "Does it make sense to include $b$ in the parameters?"
      ],
      "metadata": {
        "id": "2yrRt2wMubSC"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# no not essential "
      ],
      "metadata": {
        "id": "DUM0s6CqrkSx"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [],
      "metadata": {
        "id": "F0gbHr8_uiWi"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "## Bonus:\n",
        "\n",
        "These problems are extra credit. You may use any resources, but be sure to explain your code."
      ],
      "metadata": {
        "id": "_3LN79rPujMz"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "#### Bonus 1: Plot the squared errors from your line of best fit"
      ],
      "metadata": {
        "id": "wk0Ox4nqvFcT"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "plt.title(\"Fit Errors\")\n",
        "\n",
        "plt.xlabel(\"Diameter\")\n",
        "plt.ylabel(\"Squared Error\")\n",
        "\n",
        "squared_error = ...\n",
        "\n",
        "plt.plot(..., 'b.', label = \"Errors\")\n",
        "\n",
        "plt.legend();"
      ],
      "metadata": {
        "id": "O8IQn-B_vXAN"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "#### Bonus 2: Plot the errors as a histogram"
      ],
      "metadata": {
        "id": "ojVobjtBwK9o"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "plt.title(\"Errors\")\n",
        "\n",
        "..."
      ],
      "metadata": {
        "id": "WJkR3s9kwujU"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "What distribution does this histogram look like?"
      ],
      "metadata": {
        "id": "k9nm1qADyFiA"
      }
    },
    {
      "cell_type": "code",
      "source": [],
      "metadata": {
        "id": "LD52JHHssnsB"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [],
      "metadata": {
        "id": "r2Vo3k0xyKiK"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "#### Bonus 3: Find the circle with the largest error. \n",
        "Hint: use np.max"
      ],
      "metadata": {
        "id": "qfDuImTvrF5V"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "largest_error = ... "
      ],
      "metadata": {
        "id": "k7ShpKK6vWrH"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "#### Bonus 4: Remove the circles with the 2 largest errors and run the fit again.\n"
      ],
      "metadata": {
        "id": "oQCq4D4uwZ7I"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "..."
      ],
      "metadata": {
        "id": "EjddA54wwKPY"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "What is the difference in your error?"
      ],
      "metadata": {
        "id": "V2jyayR-yOvF"
      }
    },
    {
      "cell_type": "markdown",
      "source": [],
      "metadata": {
        "id": "F1ZCdkHyyY9x"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "#### Bonus 5: Find and explain a better method of fitting this data"
      ],
      "metadata": {
        "id": "1y-okVy_w22o"
      }
    },
    {
      "cell_type": "code",
      "source": [],
      "metadata": {
        "id": "sfOiajQCxH_7"
      },
      "execution_count": null,
      "outputs": []
    }
  ]
}