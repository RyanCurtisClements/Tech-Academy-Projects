#Live-Project

##Introduction
As part of my final course at the Tech Academy, I participated in a two week 
sprint building out their Job Placement Interface to be added to the program.

The main focus of this interface was using the ASP.NET MVC design pattern to 
manage user accounts for students. This was a great learning experience for 
me to understand how to code alongside other people, and to see first-hand how 
features can change and evolve over the course of development.

At the beginning of the sprint, I was intimidated by the large amount of legacy 
code, and I primarily worked on [front end stories](#front-end-stories) doing 
the basic work of aligning buttons and other page elements correctly.

However, after doing a deep dive into the inner workings of the project, I grew 
confident enough to tackle a couple important [back-end-stories](#back-end-stories) 
which targeted crucial features.

I am not able to share the entirety of the source code, as this project is owned 
by The Tech Academy, but in the sections below I have included snippets of the 
code which I completed along with short explanations of the work I did in each 
instance.

##Front End Stories
* [Styling JPHires Create Buttons](#Styling-JPHires-Create-Buttons)
* [Styling JPApplications Delete View](#Styling-JPApplications-Delete-View)
* [Check Admin Login](#Check-Admin-Login)
* [Styling Analytics View](#Styling-Analytics-View)
* [JPApplications Checkboxes Alignment](#JPApplications-Checkboxes-Alignment)
* [Styling JPBulletins Edit View](#Styling-JPBulletins-Edit-View)

##Back End Stories
* [Salary Conversion](#Salary-Conversion)
* [JPStudent Rework](#JPStudent-Rework)

###Styling JPHires Create Buttons
As I stated above, many of the stories I tackled in my first week had to do with aligning buttons properly.
For this first story, the "Back to List" button was indented towards the center of the form, but the "Submit"
button was aligned with the left edge of the form.

Our instructor directed us not to use inline styling, so that was one of the first changes I made. One of the first
things I noticed was that although a div containing both the inputs had in fact been given the "justify-content-between"
property, it was not a flexible container, which meant the property would not be applied. Also, another div 
had been given the "jphires-right-align" class, which was not present anywhere in the stylesheet and thus
was also not applied.

To solve these issues, I simply removed the unused classes, tagged the id of the div for the form-group, made it a 
flexible container, and gave it the "justify-content: center" property to align the buttons to the middle of the form.

    //Before

    //View
        <div class="form-group" id="hires-button">
            <div class="row justify-content-between">
                <div class="col-md-6 col-sm-5">
                    <input type="submit" value="Submit" class="btn btn-default" />
                </div>
                <div class="col-md-6 col-sm-5 jphires-right-align">
                    <input type="button" value="Back to List" class="btn btn-default" onclick="location.href='@Url.Action("Index", "JPHires")'" />
                </div>
            </div>
        </div>

    //Styling
        #hires-create {
        margin-left: 15%;
        margin-top: 50px;
        }

        #hires-create a {
            color:red;
        }

        #hires-button .btn {
        margin-left: -2px;
        margin-top: 7px;
        }

    //After

    //View
        <div class="form-group" id="hires-button">
            <div class="row">
                <div class="col-md-6 col-sm-5">
                    <input type="submit" value="Submit" class="btn btn-default" />
                </div>
                <div class="col-md-6 col-sm-5">
                    <input type="button"  value="Back to List" class="btn btn-default" onclick="location.href='@Url.Action("Index", "JPHires")'" />
                </div>
            </div>
        </div>

    //Styling
        #hires-create {
        margin-left: 15%;
        margin-top: 50px;
        }

        #hires-create a {
            color:red;
        }

        #hires-button {
            justify-content:space-between;
            display: flex;
        }

        #hires-button .btn {
            margin-left: -2px;
            margin-top: 7px;
        }

    
*Jump to: [Front End Stories](#front-end-stories), [Back End Stories](#back-end-stories), [Page Top](#live-project)*

###Styling JPApplications Delete View
The second story I tackled involved more complicated formatting than the first. My basic task was to beautify the
JPApplications Delete View and make it look a bit more professional. All of the information from the table was bunched
up on the left side of the page, with no spacing in between elements. Also, the "Back to List" link was in the form
of a simple hyperlink, whereas the "Delete" link was properly formatted as a button.

The first thing I did was switch from using <dl>, <dt> and <dd> tags to using <tr>, <th> and <td> tags. The <dl-horizontal> 
tag is used in bootstrap to create a list of terms and definitions of those terms, which can be aligned side by side 
or not as the browser resizes. While this was a neat feature, I didn't feel that it was a good fit for our data. On the 
other hand, the <tr> tag establishes a table with header cells and standard data cells, which was a much better match.

    //Before

    <h3>Are you sure you want to delete this?</h3>
    <div>
        <dl class="dl-horizontal">
            <dt>
                @Html.DisplayNameFor(model => model.JPCompanyName)
            </dt>

            <dd>
                @Html.DisplayFor(model => model.JPCompanyName)
            </dd>

            <dt>
                @Html.DisplayNameFor(model => model.JPJobTitle)
            </dt>

            <dd>
                @Html.DisplayFor(model => model.JPJobTitle)
            </dd>

            <dt>
                @Html.DisplayNameFor(model => model.JPJobCategory)
            </dt>

            <dd>
                @Html.DisplayFor(model => model.JPJobCategory)
            </dd>

            <dt>
                @Html.DisplayNameFor(model => model.JPCompanyCity)
            </dt>

            <dd>
                @Html.DisplayFor(model => model.JPCompanyCity)
            </dd>

            <dt>
                @Html.DisplayNameFor(model => model.JPCompanyState)
            </dt>

            <dd>
                @Html.DisplayFor(model => model.JPCompanyState)
            </dd>

            <dt>
                @Html.DisplayNameFor(model => model.JPApplicationDate)
            </dt>

            <dd>
                @Html.DisplayFor(model => model.JPApplicationDate)
            </dd>
        </dl>

        @using (Html.BeginForm()) {
            @Html.AntiForgeryToken()

            <div class="form-actions no-color">
                <input type="submit" value="Delete" class="btn btn-default" /> |
                @Html.ActionLink("Back to List", "Index")
            </div>
        }
    </div>

    // After

    <h3 id="deleteAppHead">Are you sure you want to delete this?</h3>

    <div class="container" id="deleteAppContainer">
        <div class="col-sm-12">
            <table>
                <tr>
                    <th class="deleteAppTable">
                        @Html.DisplayNameFor(model => model.JPCompanyName)
                    </th>
                </tr>

                <tr>
                    <td class="deleteAppTable">
                        @Html.DisplayFor(model => model.JPCompanyName)
                    </td>
                </tr>

                <tr>
                    <th class="deleteAppTable">
                        @Html.DisplayNameFor(model => model.JPJobTitle)
                    </th>
                </tr>

                <tr>
                    <td class="deleteAppTable">
                        @Html.DisplayFor(model => model.JPJobTitle)
                    </td>
                </tr>

                <tr>
                    <th class="deleteAppTable">
                        @Html.DisplayNameFor(model => model.JPJobCategory)
                    </th>
                </tr>

                <tr>
                    <td class="deleteAppTable">
                        @Html.DisplayFor(model => model.JPJobCategory)
                    </td>
                </tr>

                <tr>
                    <th class="deleteAppTable">
                        @Html.DisplayNameFor(model => model.JPCompanyCity)
                    </th>
                </tr>

                <tr>
                    <td class="deleteAppTable">
                        @Html.DisplayFor(model => model.JPCompanyCity)
                    </td>
                </tr>

                <tr>
                    <th class="deleteAppTable">
                        @Html.DisplayNameFor(model => model.JPCompanyState)
                    </th>
                </tr>

                <tr>
                    <td class="deleteAppTable">
                        @Html.DisplayFor(model => model.JPCompanyState)
                    </td>
                </tr>

                <tr>
                    <th class="deleteAppTable">
                        @Html.DisplayNameFor(model => model.JPApplicationDate)
                    </th>
                </tr>

                <tr>
                    <td class="deleteAppTable">
                        @Html.DisplayFor(model => model.JPApplicationDate)
                    </td>
                </tr>
            </table>
        </div>
                @using (Html.BeginForm())
        {
            @Html.AntiForgeryToken()

            <div class="form-actions no-color">
                <input type="submit" id="deleteAppLeftBtn" value="Delete" class="btn btn-default" />
                <input type="button" id="deleteAppRightBtn" value="Back to List" class="btn btn-default" onclick="location.href='@Url.Action("Index", "JPApplications")'" />
            </div>
        }

    </div>

Obviously there are a few other changes that I made to this View in addition to switching out the tags used for the 
table. The next adjustment I made was to change the "Back to List" link from an Html.ActionLink into a button like 
the "Delete" input.

After that, I went through and inserted ids and classes where I wanted to format elements of the page. I used ids 
for the container div, the table header, and the buttons at the bottom of the table. For the individual table 
elements, I used the class "deleteAppTable" so I could tag them all at once.

Once I had created my class and ids, I then went ahead and made a section in the stylesheet for this View and made 
my formatting changes.

/**************
    Styling for JPApplications Delete View
**************/

    #deleteAppContainer {
        max-inline-size: max-content;
        margin-left: 0;
    }

    .deleteAppTable {
        text-align: left;
    }

    #deleteAppHead {
        text-align: left;
    }

    #deleteAppRightBtn {
        float:right;
    }

    #deleteAppLeftBtn {
        float:left;
    }

*Jump to: [Front End Stories](#front-end-stories), [Back End Stories](#back-end-stories), [Page Top](#live-project)*

###Check Admin Login
In this story, I was working to fix a bug where admin accounts could fill out forms that should only be accessible 
to student accounts. There were three different Models with this issue, JPApplications, JPCurrentJobs and JPHires.

First I looked at JPApplications, which did not check the active login's account type before allowing the user to 
submit form data. To solve this issue, I encapsulated the form's "Submit" and "Back to List" buttons with an 
if-else statement to check the user's role. If the user was not an admin, the buttons appeared at the bottom of 
the form as usual. If the user was an admin, they would would get an error message instructing them to sign up 
for a student account and a link to do so.

    //Before

        <div class="form-group" id="inline1">
            <div class="row justify-content-between">
                <div class="col-md-6 col-sm-5">
                    <input type="submit" value="Submit" class="btn btn-default jpAppBtn" />
                </div>
                <div class="col-md-6 col-sm-5 jphires-right-align">
                    <input type="button" value="Back to List" class="btn btn-default" onclick="location.href='@Url.Action("StudentIndex", "JPApplications")'" />
                </div>
            </div>
        </div>
                
    //After

        if (User.Identity.IsAuthenticated && !User.IsInRole("Admin"))
        {
            <div class="form-group" id="inline1">
                <div class="row justify-content-between">
                    <div class="col-md-6 col-sm-5">
                        <input type="submit" value="Submit" class="btn btn-default jpAppBtn" />
                    </div>
                    <div class="col-md-6 col-sm-5">
                        <input type="button" value="Back to List" class="btn btn-default" id="hires-button-right" onclick="location.href='@Url.Action("StudentIndex", "JPApplications")'" />
                    </div>
                </div>
            </div>
        }
        else
        {
            <div class="form-group" id="inline1">
                <div class="text-center">
                    <a href="../Account/Register" id="JPApplications-Create-error-text">You must be registered and logged in as a student to create an application.</a>
                </div>
            </div>
        }

After I'd done this for the JPApplications Create View, I went in and added a similar if-else statement 
to the bottom of the form in the JPCurrentJobs Create View.

    //Before

        <div class="form-group center-block">
            <div class="col-md-10 no-left-gutter">
                <input type="submit" value="Create" class="btn btn-default" />
                <input type="button" class="btn btn-default pull-right" value="Back to List" onclick="location.href='@Url.Action("Index", "JPCurrentJobs")'" />
            </div>
        </div>

    //After

    @if (User.Identity.IsAuthenticated && !User.IsInRole("Admin"))
    {
        <div class="form-group">
            <div class="col-md-10">
                <input type="submit" value="Create" class="btn btn-default" />
                <input type="button" class="btn btn-default" id="hires-button-right" value="Back to List" onclick="location.href='@Url.Action("Index", "JPCurrentJobs")'" />
            </div>
        </div>
    }
    else
    {
        <div class="form-group">
            <div id="JPCurrentJobs-Create-error-message">
                <a href="../Account/Register" id="JPCurrentJobs-Create-error-text">You must register and be logged in as a student in order to log your current job.</a>
            </div>
        </div>
    }

The JPHires Create View already contained code similar to what I created for the other two Views, but the 
existing error message merely instructed the user to register and log-in (which fails to address users 
who ARE logged in, just as admins), and the link uses an absolute path when it should have used a relative
path, so I adjusted it slightly.

    //Before

        <div class="form-group">
            <div class="text-center">
                <a href="http://localhost:51507/Account/Register"> You must be registered and logged in before you can create a new hire.</a>
            </div>
        </div>

    //After

        <div class="form-group">
            <div class="text-center">
                <a href="../Account/Register"> You must be registered and logged in as a student before you can create a new hire.</a>
            </div>
        </div>

Once I'd made these changes, all that was left was for me to do was create sections in the stylesheet 
and properly format my additions.

    /*************
        Styling for JPApplications Create View
    *************/

    #JPApplications-Create-error-text {
        color: red;
    }

    /**************
    Styling for JPCurrentJobs Create View
    **************/

    #JPCurrentJobs-Create-error-message {
        padding-left: 5%;
    }
    #JPCurrentJobs-Create-error-text {
        color:red;
    }

*Jump to: [Front End Stories](#front-end-stories), [Back End Stories](#back-end-stories), [Page Top](#live-project)*

###Styling Analytics View
This was a rather simple little story where I was assigned the task of prevented overflow, centering items 
on the page, and shrinking the gap between the end of page-specific content and "footer" content. I only 
had to use a couple of tags to accomplish this, I first of all made the infoboxes flexible and then used 
the "justify-content:center" property to center items. Then I gave the page wrapper the "overflow:hidden" 
property to hide the unnecessary white space on the page. And finally, I simply decreased the value of the 
padding-bottom property to lessen the bottom gap.

    //Before

        /***********************************
            Analytics.cshtml Styling
        *********************************/
    .borderAnalytics {
        border: 1px solid #1a2b51;
        margin: 5px;
        position: relative;
    }

    #buttonAnalytics {
        margin-bottom: 6px;
        
    #Carousel {
        margin: -70px 0px 0px 160px;
        padding-bottom: 160px;
    }

    #Carousel {
        padding-bottom: 160px;
    }

    //After 

    /***********************************
        Analytics.cshtml Styling
    *********************************/
	
    .infoBoxesAnalytics {
        display: flex;
        justify-content: center;
        align-items: stretch;
    }

    #wrapperAnalytics {
        overflow: hidden;
    }

    .borderAnalytics {
        border: 1px solid #1a2b51;
        margin: 5px;
        position: relative;
        display: inline-block;
    }

    #buttonAnalytics {
        margin-bottom: 6px;
    }

    #Carousel {
            margin: -70px 0px 0px 160px;
            padding-bottom: 60px;
    }

*Jump to: [Front End Stories](#front-end-stories), [Back End Stories](#back-end-stories), [Page Top](#live-project)*

###JPApplications Checkboxes Alignment
*Jump to: [Front End Stories](#front-end-stories), [Back End Stories](#back-end-stories), [Page Top](#live-project)*

###Styling JPBulletins Edit View
*Jump to: [Front End Stories](#front-end-stories), [Back End Stories](#back-end-stories), [Page Top](#live-project)*

###Salary Conversion
I rather enjoyed working on this story because it allowed me to experiment with JQuery, which is something 
that was very new to me. Essentially, students who wished to record a hiring could either input a number 
for hourly wages or a yearly salary. If the student entered an hourly wage, we wanted to convert that into 
an equivalent yearly salary with the assumption that the student would work around 2080 hours in a year. 
Regardless of whether the student submitted a yearly or hourly rate, the student's wage was to be recorded 
as an annual salary. Sadly, the code as written did not do this, meaning students earning $30 an hour were 
shown to be earning $30 a year.

    @section Scripts {
        @Scripts.Render("~/bundles/jqueryval")
        <script>
            $(document).ready(function () {
                $("input[value='Hourly']").click(function () {
                    var salary = $("#job-salary-input").val();
                    console.log(salary);
                    console.log(salary * 2080);
                })
            });
        </script>
    }

In the existing code, the JQuery script operated as follows; after the page is fully loaded, it waits 
for the "Hourly" radio button to be clicked. Once this button is clicked, it then assigns the value in 
the "job-salary-input" field to var salary, prints var salary to the console, and then prints the result 
of var salary multiplied by 2080 to the console. While the console readout confirmed that these operations 
were taking place, we were failing to reassign our variable's value after the multiplication function 
has been completed.

    @section Scripts {
        @Scripts.Render("~/bundles/jqueryval")

        <script>
            $(document).ready(function () {

                function CalcForHourly(hourlySalary) {
                    return hourlySalary * 2080;
                }

                $("#job-salary-input").blur(function () {
                    var salary = $("#job-salary-input").val();

                    $("input[value='Hourly']").click(function () {
                        $("input[value='Submit']").click(function () {
                            $("#job-salary-input").val(CalcForHourly(salary));
                        })
                    })
                })
            })
        </script>
    }

The JQuery script I wrote is more complicated to take into account several different possibilities. 
First, when the page is fully loaded we have a named function "CalcForHourly" which takes a 
variable "hourlySalary" and returns that variable multiplied by 2080. Then, we have an unnamed 
function which assigns the value in the "job-salary-input" field to var salary once focus leaves 
the field in question. In other words, the "blur" event method is set to trigger when the user 
clicks outside of the box. This is an improvement over assigning the value when the button is 
selected because some users may click the button before inputting values, which would result in 
incorrect information being returned.

Next, we have a function waiting to trigger if the Hourly button is clicked. Upon that click, 
the script then prepares to trigger the next function if the Submit button is clicked. It was 
important to wait for the form to be submitted, because users may initially input a value that 
is incorrect, and we want to give them the opportunity to make changes before submitting their 
information.

Once the Submit button is clicked, we call our CalcForHourly function on the salary variable, 
which multiplies the variable by 2080 and the result is then assigned to "job-salary-input", 
giving us our approximate yearly salary.

*Jump to: [Front End Stories](#front-end-stories), [Back End Stories](#back-end-stories), [Page Top](#live-project)*

###JPStudent Rework
*Jump to: [Front End Stories](#front-end-stories), [Back End Stories](#back-end-stories), [Page Top](#live-project)*