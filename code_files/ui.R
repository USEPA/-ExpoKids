library(DT)
library(rCharts)
library(readxl)
library(reshape2)
library(shinydashboard)
library(tidyr)

ui <- fluidPage(
				#useShinyjs(),
                tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),
                tags$body(class="html wide-template"),
                fluidRow(
                				HTML	("
                						<header class='masthead clearfix' role='banner'>
                							<img alt='' class='site-logo' src='https://www.epa.gov/sites/all/themes/epa/logo.png'>
                							<div class='site-name-and-slogan'>
                								<h1 class='site-name'>
                									<a href='https://www.epa.gov/' rel='home' title='Go to the home page'>
                										<span>US EPA</span>
                									</a>
                								</h1>
                								<div class='site-slogan'>United States Environmental Protection Agency</div>
                							</div>
                							<div class='region-header'>
                								<div class='block-epa-core-gsa-epa-search' id='block-epa-core-gsa-epa-search'></div>
                							</div>
                						</header>
                						<nav class='nav main-nav clearfix' role='navigation'>
                							<div class='nav__inner'>
                								<h2 class='element-invisible'>Main menu</h2>
                								<ul class='menu' role='menu'>
                									<li class='expanded active-trail menu-item' role='presentation'>
                										<a class='active-trail menu-link' href='https://www.epa.gov/environmental-topics' role='menuitem' title='View links to the most popular pages for each of EPA&#8217s top environmental topics.'>Environmental Topics</a>
                									</li>
                									<li class='menu-item' role='presentation'>
                										<a class='menu-link' href='https://www.epa.gov/laws-regulations' role='menuitem' title='View links to regulatory information by topic and sector, and to top pages about environmental laws, regulations, policies, compliance, and enforcement.'>Laws &amp; Regulations</a>
                									</li>
                									<li class='expanded menu-item' role='presentation'>
                										<a class='menu-link' href='https://www.epa.gov/aboutepa' role='menuitem' title='Learn more about our mission, organization, and locations.'>About EPA</a>
													</li>
													<li class='menu-item' role='presentation' style='padding: 0.7143em 1.5714em; right:10vw;'>
														<form class='epa-search' method='get' action='https://search.epa.gov/epasearch/epasearch'>
															<label class='element-hidden' for='search-box'>Search</label>
															<input class='form-text' placeholder='Search EPA.gov' name='querytext' id='search-box' value=''>
															<button class='epa-search-button' id='search-button' title='Search' data-gtm-vis-recent-on-screen-42870_124='2573' data-gtm-vis-first-on-screen-42870_124='2573' data-gtm-vis-total-visible-time-42870_124='100' data-gtm-vis-has-fired-42870_124='1'>Search</button>
															<input type='hidden' name='areaname' value=''>
															<input type='hidden' name='areacontacts' value=''>
															<input type='hidden' name='areasearchurl' value=''>
															<input type='hidden' name='typeofsearch' value='epa'>
															<input type='hidden' name='result_template' value='2col.ftl'>
														</form> <!-- /search -->
													</li>
                								</ul>
                							</div>
                						</nav>
                						<div class='mobile-nav' id='mobile-nav'>
                							<div class='mobile-bar clearfix'>
                								<label class='menu-button' for='mobile-nav-toggle'>Menu</label>
                							</div>
                							<input checked id='mobile-nav-toggle' type='checkbox'>
                							<div class='mobile-links element-hidden' id='mobile-links' style='height:2404px;'>
                								<ul class='mobile-menu'>
                									<li class='expanded menu-item'>
                										<a class='menu-link' href='https://www.epa.gov/environmental-topics' tabindex='-1' title='View links to the most popular pages for each of EPA&#8217s top environmental topics.'>Environmental Topics</a>
                									</li>
                									<li class='menu-item'>
                										<a class='menu-link' href='https://www.epa.gov/laws-regulations' tabindex='-1' title='View links to regulatory information by topic and sector, and to top pages about environmental laws, regulations, policies, compliance, and enforcement.'>Laws &amp; Regulations</a>
                									</li>
                									<li class='expanded menu-item'>
                										<a class='menu-link' href='https://www.epa.gov/aboutepa' tabindex='-1' title='Learn more about our mission, organization, and locations.'>About EPA</a>
                									</li>
                								</ul>
                							</div>
                						</div>
                						<section class='main-content clearfix' style='margin-left:5vw; margin-right:5vw;' id='main-content' lang='en' role='main' tabindex='-1'>
                							<div class='region-preface clearfix'>
                								<div class='block-views-revision-hublinks-block' id='block-views-revision-hublinks-block'>
                									<div class='view view-revision-hublinks view-id-revision_hublinks'>
                										<span class='related-info'><strong>Go to:</strong></span>
                										<ul class='menu pipeline'>
                											<li class='menu-item'>
                												<a href='https://www.epa.gov/expobox'>EPA ExpoBox</a>
                											</li>
                										</ul>
														
                										<span class='related-info'></span>
                										<ul class='menu pipeline'>
                											<li class='menu-item'>
                												<a href='https://ecomments.epa.gov/expobox/' style='position:absolute; right:40vw;'>Contact Us</a>
                											</li>
                										</ul>														
														
                									</div>
                								</div>
                								<div class='block block-pane block-pane-epa-web-area-connect' id='block-pane-epa-web-area-connect'>
                									<ul class='menu utility-menu'>
                										<li class='menu-item'>
														<!--
                											
														-->
                										</li>
                									</ul>
                								</div>
                							</div>
                							<div class='main-column clearfix'><!--googleon:all-->
                								<h1  class='page-title'>EPA ExpoKids</h1>
                								<div class='panel-pane pane-node-content'>
                									<div class='pane-content'>
                										<div class='node node-page clearfix view-mode-full'>
                										</div>
                									</div>
                								</div>
                								<p>Learn more about the <a href='https://www.epa.gov/expobox/expokids-data-visualization-tool-aggregate-exposure-lifestage-and-media'>ExpoKids Data Visualization Tool for Aggregate Exposure by Lifestage and Media</a> . </p>
												<h5>Background:</h5>
												<p>
													ExpoKids was first developed as an R-based data visualization tool to help characterize aggregate environmental exposure during childhood, through a collaboration between two of EPA’s organizations: the Office of the Administrator (AO) and the Office of Research & Development (ORD).  This ExpoKids Shiny app was developed from the ExpoKids R tool.  It displays aggregate exposure estimates of chemicals across developmental and adult lifestages for 10 oral media (dust, breastmilk, water, vegetables, <i>etc.</i>).
												</p>
												<p>
												Five ExpoKids graph types can be produced:
												</p>
												<ol>
													<li class='backgroundListItem'>Average Daily Dose (<abbr title='Average Daily Dose'>ADD</abbr>) by lifestage</li>
													<li class='backgroundListItem'>Lifetime Average Daily Dose (<abbr title='Lifetime Average Daily Dose'>LADD</abbr>) by lifestage</li> 
													<li class='backgroundListItem'><abbr title='Average Daily Dose'>ADD</abbr> for an individual exposure pathway by lifestage</li>
													<li class='backgroundListItem'><abbr title='Lifetime Average Daily Dose'>LADD</abbr> for an individual exposure pathway by lifestage</li>
													<li class='backgroundListItem'>Percent <abbr title='Average Daily Dose'>ADD</abbr> by lifestage</li>
												</ol> 
												<p>
													ExpoKids <i>v.</i> 1.1 is compatible with EPA’s Exposure Factors Interactive Resource for Scenarios Tool (<a href=https://www.epa.gov/expobox/exposure-factors-interactive-resource-scenarios-tool-expofirst>ExpoFIRST</a>).  ExpoFIRST is a standalone tool, which uses the EPA’s <a href='https://www.epa.gov/expobox/about-exposure-factors-handbook'>Exposure Factors Handbook</a> to provide deterministic potential dose estimates for user-defined <abbr title='Average Daily Dose'>ADD</abbr>s by lifestage. 
												</p>
											</div>
											</section>
											<br>
                						")
                        ),
                fluidRow(
						HTML("<div style='margin-left:10vw; margin-right:5vw;'>"),
                        dashboardPage(
                                            dashboardHeader(title=""),
                                            dashboardSidebar(
                                                            # Create Excel upload button
                                                            fileInput(inputId="inFile",
                                                                      label="Upload an Excel file.",
                                                                      buttonLabel="Upload",
                                                                      placeholder="No file loaded.",
                                                                      accept=c(".xlsx")
                                                                     ),
                                                            # Create app tabs
                                                            sidebarMenu(
                                                                        menuItem("How To Use This App", tabName= "tab0"),
                                                                        menuItem("Uploaded Table",      tabName  = "tab1"),
                                                                        menuItem("Lifestage Tables",    tabName  = "tab2"),
                                                                        menuItem("Lifestage Graphs",    tabName  = "graph1"),
                                                                        menuItem("Media Graphs",        tabName  = "graph2"),
                                                                        menuItem("Summary Graphs",      tabName  = "graph3")
                                                                       )
                                                            ),
                                            dashboardBody(
                                                          tags$head(
                                                                    # Prevents double scroll bar
                                                                    tags$style(HTML('.wrapper {height: auto !important; position:relative; overflow-x:hidden; overflow-y:hidden}'))
                                                                   ),
                                                          tabItems(
                                                                  tabItem(
                                                                          tabName = "tab0",
                                                                          h2("How to Use the ExpoKids Shiny App"),
                                                                          fluidRow(
                                                                                  box(
                                                                                      width = 9,
																					  HTML("
																					       <br>
																					       <p><h6>Prior to Using ExpoKids:</h6></p>
																							<ol>
																							  <li class='backgroundListItem'>Identify media-specific exposure data from the literature or other source for a chemical of interest.</li>
																							  <li class='backgroundListItem'>Compile your ADDs by media using the format in the <a href='https://github.com/USEPA/ExpoKids/raw/master/ExpoKids_sample_data_file_December_2020.xlsx'>ExpoKids sample data file (Dec 2020) (Excel)</a>.</li>
																							</ol>
																							<br>
																							<p><h6>Using ExpoKids:</h6></p>
																							<ol>
																							  <li class='backgroundListItem'>Download the <a href='https://github.com/USEPA/ExpoKids/raw/master/ExpoKids_sample_data_file_December_2020.xlsx'>ExpoKids sample data file (Dec 2020) (Excel)</a>.</li>
																							  <li class='backgroundListItem'>Scroll past the background information and disclaimer to use the ExpoKids Shiny app.  Click the 'Upload' button on the top-left corner of the navigation bar on the left side of the page.  You will be prompted to select the spreadsheet on your computer (from the second step listed under 'Prior to Using ExpoKids') containing the <abbr title='Average Daily Dose'>ADD</abbr>s.</li>
																							  <li class='backgroundListItem'>Click the buttons on the left to generate the various graphs.  Note that you can switch from 'stacked' to 'grouped' (and select or deselect media) by clicking on the little circles in the legend at the top of each graph.  Note also that, for the Media Graphs, there is one tab for ADD and another tab for LADD.</li>
																							  <li class='backgroundListItem'>To download the graphs produced by ExpoKids for your data, right-click the graph.  You can save it in several different file types.</li>
																							</ol>
																					       ")
                                                                                     )
                                                                                  )
                                                                         ),
                                                                  tabItem(
                                                                          tabName = "tab1",
                                                                          h2("Uploaded ADD Table (mg/kg-d)"),
                                                                          fluidRow(
                                                                                  box(
                                                                                      width = 12,
                                                                                      collapsible = T,
                                                                                      tableOutput(outputId = "first_tab")
                                                                                     )
                                                                                  )
                                                                         ),
                                                                  tabItem(
                                                                          tabName = "tab2",
                                                                          h2("Lifestage Tables"),
                                                                          fluidRow(
                                                                                  box(
                                                                                      width=12,
                                                                                      title="Average Daily Dose (ADD) Table (mg/kg-d])",
                                                                                      collapsible=T,
                                                                                      tableOutput(outputId="add_tab"),
                                                                                      footer="The lifestage column calculation considers the duration in years of each lifestage."
                                                                                     )
                                                                                  ),
                                                                          fluidRow(
                                                                                  box(
                                                                                      width=12,
                                                                                      title="Lifetime Average Daily Dose (LADD) Table (mg/kg-d)",
                                                                                      collapsible=T,
                                                                                      tableOutput(outputId="ladd_tab")
                                                                                     )
                                                                                  )
                                                                         ),
                                                                  tabItem(
                                                                          tabName = "graph1",
                                                                          h2("Lifestage Graphs"),
                                                                          fluidRow(
                                                                                   box(
                                                                                      showOutput("p_ADD","nvd3"),
                                                                                      title="ADD by Lifestage Graph",width=9,collapsible=T
                                                                                      )
                                                                                  ),
                                                                          fluidRow(
                                                                                   box(
                                                                                      showOutput("p_LADD","nvd3"),
                                                                                      title="LADD by Lifestage Graph",width=9,collapsible=T
                                                                                      )
                                                                                  ),
                                                                          fluidRow(
                                                                                   box(
                                                                                      showOutput("p_perlife","nvd3"),
                                                                                      title="ADD Cumulative Percent by Lifestage",width=9,collapsible=T
                                                                                      )
                                                                                  )
                                                                         ),
                                                                  tabItem(
                                                                          tabName = "graph2",
                                                                          fluidRow(
                                                                                    h2("Media Graphs",align="center"),
                                                                                    box(
                                                                                        width=3,
                                                                                        checkboxGroupInput("media2", label=h3("Media")),
                                                                                        actionButton("select", "Select All", icon = icon("ok-sign", lib = "glyphicon")),
                                                                                        actionButton("deselect","Deselect All",icon = icon("ok-circle", lib = "glyphicon")),
                                                                                        actionButton("button", "Show Graphs", style = "color: white; background-color:#0a85ab")
                                                                                       )
                                                                                  ),
                                                                          fluidRow(
                                                                                    tabBox(
                                                                                          width = "12", height = "4300",
                                                                                          tabPanel(
                                                                                                  "ADD",
                                                                                                  textOutput("text"),
                                                                                                  textOutput("text2"),
                                                                                                  textOutput("text3"),
                                                                                                  uiOutput("p_addmedia")
																								  # textOutput("print_myTagList")
                                                                                                  ),
                                                                                          tabPanel(
                                                                                                  "LADD",
                                                                                                  uiOutput("p_laddmedia")
                                                                                                  )
                                                                                          )
                                                                                  )
                                                                         ),
                                                                  tabItem(
                                                                          tabName="graph3",
                                                                          fluidRow(
                                                                                    h2("Summary Graphs",align="center")
                                                                                  ),
                                                                          fluidRow(
                                                                                    box(
                                                                                        showOutput("p_sum","nvd3"),
                                                                                        title="ADD Graph",width=9,collapsible=T
                                                                                       )
                                                                                  ),
                                                                          fluidRow(
                                                                                    box(
                                                                                        showOutput("p_persum","nvd3"),
                                                                                        title="Cumulative Percent",width=9,collapsible=T
                                                                                       )
                                                                                  )
                                                                         )
                                                                  )
                                                         )
                                      ),
						HTML("</div>")
						),
				fluidRow(
							column(width=1,
									""
								  ),
							column(width=10,
									HTML("
										<div>
											<br>
											<h5>Disclaimer:</h5>
											<p>
												This application was developed by the United States Environmental Protection Agency (EPA). No warranty expressed or implied is made regarding the accuracy
												or utility of the system, nor shall the act of distribution constitute any such warranty. Any reference to specific commercial products, processes, or services by service mark,
												trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by
												EPA. The EPA seal and logo shall not be used in any manner to imply endorsement of any commercial product or activity
												by EPA or the United States Government. This application has been reviewed in accordance with EPA policy
												and has been approved for external and free use. The views expressed in this application do not necessarily represent the views
												or policies of the Agency. Although a reasonable effort has been made to assure that the results obtained are correct,
												this application is experimental. Therefore, the author and the EPA are not responsible and assume no liability whatsoever
												for any results or any use made of the results obtained from this application, nor for any damages or litigation that result
												from the use of the application for any purpose.
											</p>
											<h6>Version 1.1, Last Updated in February 2021</h6>
											<br>
											<h6>Created by Mona Dai & Steve Pfeiffer, United States Environmental Protection Agency</h6>
											<br>
											<br>
										</div>
										")
								  )
						),
                fluidRow(
                				HTML	("
                						<footer class='EPA-main-footer clearfix' role='contentinfo'>
                							<div class='main-footer__inner'>
                								<div class='region-footer'>
                									<div class='block-pane-epa-global-footer' id='block-pane-epa-global-footer'>
                										<div class='row cols-3'>
                											<div class='col size-1of3'>
                												<div class='col__title'>Discover.</div>
                												<ul class='menu'>
                													<li><a href='https://www.epa.gov/accessibility'>Accessibility</a></li>
                													<li><a href='https://www.epa.gov/aboutepa/administrator-gina-mccarthy'>EPA Administrator</a></li>
                													<li><a href='https://www.epa.gov/planandbudget'>Budget &amp; Performance</a></li>
                													<li><a href='https://www.epa.gov/contracts'>Contracting</a></li>
                													<li><a href='https://www.epa.gov/home/grants-and-other-funding-opportunities'>Grants</a></li>
                													<li><a href='https://19january2017snapshot.epa.gov'>January 19, 2017 Web Snapshot</a></li>
                													<li><a href='https://www.epa.gov/ocr/whistleblower-protections-epa-and-how-they-relate-non-disclosure-agreements-signed-epa-employees'>No FEAR Act Data</a></li>
                													<li><a href='https://www.epa.gov/privacy'>Privacy</a></li>
                												</ul>
                											</div>
                											<div class='col size-1of3'>
                												<div class='col__title'>Connect.</div>
                												<ul class='menu'>
                													<li><a href='https://www.data.gov/'>Data.gov</a></li>
                													<li><a href='https://www.epa.gov/office-inspector-general/about-epas-office-inspector-general'>Inspector General</a></li>
                													<li><a href='https://www.epa.gov/careers'>Jobs</a></li>
                													<li><a href='https://www.epa.gov/newsroom'>Newsroom</a></li>
                													<li><a href='https://www.epa.gov/open'>Open Government</a></li>
                													<li><a href='https://www.regulations.gov/'>Regulations.gov</a></li>
                													<li><a href='https://www.epa.gov/newsroom/email-subscriptions'>Subscribe</a></li>
                													<li><a href='https://www.usa.gov/'>USA.gov</a></li>
                													<li><a href='https://www.whitehouse.gov/'>White House</a></li>
                												</ul>
                											</div>
                											<div class='col size-1of3'>
                												<div class='col__title'>Ask.</div>
                												<ul class='menu'>
                													<li><a href='https://www.epa.gov/home/forms/contact-us'>Contact Us</a></li>
                													<li><a href='https://www.epa.gov/home/epa-hotlines'>Hotlines</a></li>
                													<li><a href='https://www.epa.gov/foia'>FOIA Requests</a></li>
                													<li><a href='https://www.epa.gov/home/frequent-questions-specific-epa-programstopics'>Frequent Questions</a></li>
                												</ul>
                												<div class='col__title'>Follow.</div>
                												<ul class='social-menu'>
                													<li><a class='menu-link social-facebook' href='https://www.facebook.com/EPA'>Facebook</a></li>
                													<li><a class='menu-link social-twitter' href='https://twitter.com/epa'>Twitter</a></li>
                													<li><a class='menu-link social-youtube' href='https://www.youtube.com/user/USEPAgov'>YouTube</a></li>
                													<li><a class='menu-link social-flickr' href='https://www.flickr.com/photos/usepagov'>Flickr</a></li>
                													<li><a class='menu-link social-instagram' href='https://www.instagram.com/epagov'>Instagram</a></li>
                												</ul>
                												<p class='last-updated'>Last updated in February 2021</p>
                											</div>
                										</div>
                									</div>
                								</div>
                							</div>
                						</footer>
                	           ")
                        )
               )
