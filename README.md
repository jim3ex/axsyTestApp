# axsyTestApp
Repo for Axsy Test Application

Welcome to the axsyTestApp repo. If you have any questions, please contact jim.holland@me.com. 

This is the basic app as per the spec. With the scale of the source data know, I decided to have a very simple API interface and focus on the CoreData for the offline experience. The app simple pulls the entire meta database in on startup if not in CoreData. The next stage would be to implement RESTKit or augment the API access code to allow for a more controlled download.

All high level requirments have been met. Search can be added very quckly if required but I have now used my 4 hr. budget!

The app is universal and uses UISplitViewController for iPad.

If more time, I would have implemented the login page with a modal view that is only dismissed on sucessful login. I would have stored passwords in the keychain.

I have used mogenerator to build easily maintanable classes to back the CoreData model.


