***Review GDPR patterns https://open-security-summit.org/working-sessions/pre-summit/gdpr-patterns/ - open questions & comments***

*As it relates to risk management:*

* Would be great if we could come up with a risk score for the data flow itself by combining a number of different metrics through the flow. Any idea on how to start ?
* a combination of data held + retention policy could probably get us a good measure of value at risk that could be beneficial to support investment decisions.

*As it relates to the data flow:*

* On Lawful processing – we need to be careful with wording there. Just because you don’t have a purpose for processing doesn’t imply you don’t have a lawful basis for it. The example may be misleading if we agree on the former, as expectedly you WILL have a contract/agreement of some kind with them, you may just not need to process it within the flow but be authorized as an organization to do it. The risk of saying you don’t have a lawful basis when you don’t have a requirement to process is that you may end up overstating risk. If you don’t have either, that would be a maximum risk score
* How much we need to standardize categories, or don’t we ?
* Can JIRA for GRC be used to aggregate pattern data automatically ?

*As it relates to ‘GDPR Pattern driven by Threat Model’:*

*	A valuable condition to add when assessing ‘Purpose of processing’ where the answer is ‘none’ and it’s a Personal data field the ‘Data security’ assessment should determine it’s appropriate treatment from a logging perspective. These can be one of four treatments
	* Log anyway – where the technical capability limits the feasibility of determining logging or database requirements based on individual data fields. Should be marked as a legacy pattern to assess further based on volumes and other currently applied controls
	* Drop data field – do not store in logs or databases. Risk avoidance measure
	* Anonymize  - where you don’t have a business need for the data or a requirement to preserve format but wish to keep a record of the transaction. These should be based on hashing techniques, where feasible and appropriate
	* Pseudonymize – where you don’t have a business need for the data but have a requirement to preserve format, for instance storing part of CVV data when storing credit card information or when aggregating information for analytics purposes.

*As it relates to the ‘Security Principles & Goals Framework:*

* Over a third may not be applicable in the context of data flow mapping ?
* A combination of this Data flow mapping and some JIRA GRC integration to address the wider governance aspects of compliance would be a brilliant idea with great benefits to the organizations using them as you could almost automate all the risk assessment.

*As it relates to the 'GDPR Workshop sessions – Working doc'*

* Do you need different response types regarding different levels of sensitivity of data? The regulated data is personal information, and even if you hosted sensitive personal information the reporting mechanisms etc would expectedly be the same and elicit the same process/response ? Why would you need a different approach ?
* GDPR obliges you to have a record of processing activities. I would suggest that these data flows are NOT a direct part of that register, but instead something that feeds into it in an aggregated way.
* I suggest the processing register is either based on applications provided or platforms used, depending on what makes better sense for each business, and what we’d do with these GDPR patterns is assess if they represent any material change from a processing perspective and enact a change if that’s the case.
* I could see a workflow whereby at the beginning of a commercial relationship you assess the contract and the supplier by introducing the relevant information from a GRC perspective, that then flows into the establishment of data flows as a result of the contracted service where these patterns are assessed, culminating with an update as required to the data processing register of the platform or application and an accurate measure of a) applied controls both at organizational and technical level and b) residual risk exposure and potentially value at risk

*General Updates/Issues to be logged:*

* Mapping misspelled as Maping in ‘Appropriate security measures’