#Create dframe dataframe with base name, sex and funny data
dframe <- data.frame(
  person =        c("Stan", "Francine", "Steve", "Roger", "Hayley", "Klaus"),
  sex    = factor(c("M",    "F",        "M",     "M",     "F",      "M")),
  funny  = factor(c("High", "Med",      "Low",   "High",  "Med",    "Med"))
)

# Bind age column to dframe dataframe
age    <-         c(41,     41,         15,      1600,    21,       60)
dframe <- cbind(dframe, age)