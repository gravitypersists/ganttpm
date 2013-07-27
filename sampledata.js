define([], function(){
  return {
    "time": [0, 100],
    "day": "M",
    "tasks": {
      "Photographs" : {
        "PersonA": [[0, 100]],
        "PersonB": [[25, 75]],
        "PersonC": [[0, 100]],

        "tasks": {
          "Photographer's Dashboard": {
            "PersonA": [[0, 100]],
            "PersonC": [[0, 100]],

            "tasks": {
              "Upload": {
                "PersonA": [[0,15], [50, 60]]
              },

              "Manage uploaded pics": {
                "PersonA": [[15, 50], [60, 100]],
                "PersonC": [[50, 100]],

                "tasks": {
                  "Delete existing photos": {
                    "PersonA":[[15,50]]
                  },
                  "Add tags": {
                    "PersonA":[[60,100]]
                  },
                  "Transfer to album": {
                    "PersonC":[[50,100]]
                  }
                }
              },

              "Albums": {
                "PersonC": [[0,50]]
              }
            }
          },

          "Gallery viewer": {
            "PersonB": [[25, 75]]
          }
        }
      },

      "Accounts" : {
        "PersonD": [[0, 100]],
        "PersonB": [[0, 25], [75, 100]],

        "tasks" : {
          "Login page": {
            "PersonD": [[0, 50]],
            "PersonB": [[0, 25], [75, 100]]
          },
          "Signup page": {
            "PersonD": [[25,100]]
          }
        }
      }
    }
  }
})