#######################################################################
### DEFINE GLOBAL VARIABLES
## FOR CALCULATING LADD
age    <- 70 # lifetime age (from EFH)
lifeyr <- c(1, 1/age, 2/age, 3/age, 5/age, 5/age, 5/age, 49/age) # calculating duration of ExpoKidslifestages

## LIFESTAGES TABLES
# Table based on EFH lifestages
efh <- c("Birth to < 1 month",
         "1 to < 3 months",
         "3 to < 6 months",
         "6 to < 12 months",
         "1 to < 2 years",
         "2 to < 3 years",
         "3 to < 6 years",
         "6 to < 11 years",
         "11 to < 16 years",
         "16 to < 21 years",
         "21 to < 70 years",
         "Birth to < 70 years")

# ExpoKids lifestage table
expokids <- c("Young Infant","Young Infant","Young Infant","Young Infant",
              "Infant","Infant",
              "Young Child",
              "Child",
              "Young Youth",
              "Youth",
              "Adult",
              "Lifetime")
# Years spent in ExpoKids lifestages
years <- c(1, 1, 1, 1, 2, 2, 3, 5, 5, 5, 49, 70)

# ===== #
## PLOTTING COLOR PALLETTE
# colortab <- c("Dust"="#FF6600","Soil"="#660000","Water"="#000099",
#               "Breast Milk"="#660066", "Dairy"="#CC0066","Fish"="#33CCCC",
#               "Meat"="#CC0000", "Grains"="#FFCC00","Vegetables"="#006600",
#               "Fruit"="#66CC33")

colortab1 <- c(
            # CSS color,  # Steve Pfeiffer's informal description of the color
               "#e1f3f8", # lightest aqua
               "#1B9E77", # teal
               "#D95F02", # burnt orange
               "#7570B3", # blue-ish purple
               "#E7298A", # deep pink 
			   "#66A61E", # mossy green
               "#E6AB02", # dandelion
               "#A6761D", # light brown-ish
               "#666666", # gray
			   "black"
              )

# didn't use these because OSIM had concerns about color-blind-friendliness
# bar graphs/nvd3 colors
#colortab1 <- c("#FF6600",
#               "#660000",
#               "#000099",
#               "#660066",
#               "#CC0066",
#               "#CC0000",
#               "#33CCCC",
#               "#006600",
#               "#66CC33",
#               "#FFCC00",
#               "#FFFFCC",
#               "FF99CC",
#               "#00666",
#               "#808080") # extra colors
# highcharts
#colortab2 <-
#  c("rgba(102, 0   , 102 ,0.85)", #breast milk
#    "rgba(204, 0   , 102 ,0.85)", #dairy
#    "rgba(255, 102 , 0   ,0.85)", #dust
#    "rgba(51 , 204 , 204 ,0.85)", #fish
#    "rgba(102, 204 , 51  ,0.85)", #fruit
#    "rgba(255, 204 , 0   ,0.85)", #grains
#    "rgba(204, 0   , 0   ,0.85)", #meat
#    "rgba(102, 0   , 0   ,0.85)", #soil
#    "rgba(0  , 102 , 0   ,0.85)", #veg
#    "rgba(0  , 0   , 153 ,0.85)", #water

#    "rgba(255,255,204,0.85)", # other
#    "rgba(229,225,204,0.85)", # other
#    "rgba(0  ,102,102,0.85)",# other
#    "rgba(128,128,128,0.85)" # other
#  )

#######################################################################
#######################################################################
