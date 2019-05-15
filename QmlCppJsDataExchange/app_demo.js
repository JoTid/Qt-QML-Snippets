
//----------------------------------------------------------------------------------------------------------------------
// some variables 
//
var numberOfRuns = 0;
var runCounter;
var timeInterval;
var figureSelection;

//--------------------------------------------------------------------------------------------------------------------//
// runApplicationScrip()                                                                                              //
// update QML items and call C++ functions                                                                            //
//--------------------------------------------------------------------------------------------------------------------//  
function runApplicationScrip()
{
	runInfo.text = "run " + runCounter;

	myCircle1.visible = false
	myCircle2.visible = false
	myCircle3.visible = false

	myRectangle1.visible = false
	myRectangle2.visible = false
	myRectangle3.visible = false


	var randomNumber = Math.floor(Math.random() * 3)
	if (randomNumber === 1)	{
		if (figureSelection === "Circle")
		{
			myCircle1.visible = true
		} else
		{
			myRectangle1.visible = true
		}
	} else if (randomNumber === 2) {
		if (figureSelection === "Circle")
		{
			myCircle2.visible = true	
		} else
		{
			myRectangle2.visible = true
		}
    } else {
		if (figureSelection === "Circle")
		{
			myCircle3.visible = true
		} else
		{
			myRectangle3.visible = true
		}
	}

	
	numberOfRuns--;
	runCounter++;
	if (numberOfRuns > 0)
	{
		CppApplication.msleep(timeInterval)
		runApplicationScrip();
	} 
}

//--------------------------------------------------------------------------------------------------------------------//
// myJsFunction()                                                                                                     //
//                                                                                                                    //
//--------------------------------------------------------------------------------------------------------------------// 
function myJsFunction(figure, interval, runs)
{
	console.log("Call myJsFunction() from QML! Perfom flash of " + figure + " at " + interval + "ms for " + runs + " runs...");

	// provide a value to C++ application by calling its function
	CppApplication.cppApplicationFunction("This function is called from JS function that is triggered by QML...");

	//--------------------------------------------------------------------------------------------------- 
	// trigger script running only if it stopped
	//
	if (numberOfRuns != 0)
	{
		console.warn("Script is already running...");
	} else 
	{
		console.warn("Start script application...");
		numberOfRuns = runs;
		runCounter = 1;
		timeInterval = interval;
		figureSelection = figure;

		runApplicationScrip()
	}
}
