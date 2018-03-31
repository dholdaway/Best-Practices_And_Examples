# The Right To Be Forgotten

## Overview
Part of the GDPR is the right to be forgotten. It's actually the "right to erasure".

In short, people can withdraw their consent at any time for pretty much any reason. The person owns their data, not you, and they can take it back.

## Complying with requests
Data controllers need to comply with requests without undue delays (like pretending the email doesn't exist) - and at the latest within a month.

Note that it's the responsibility of the data controller. That might be you if it's your website (or your company), but in most instances as a web professional it's probably your client who's the controller.

It's a good idea to give them an update on this responsibility, and make it clear you're not a legal expert and they should consult with one if they're unsure.

### Letting third parties know
As the data controller, if you've handed the data to third parties / data processors then you need to let them know too. This is why it's so important to document what data is being processed where and why, else you'll find it really difficult to comply with the law when a request comes in.

## When you don't have to comply
Rarely. But there are a few exceptions, including...

> - to exercise the right of freedom of expression and information;
>- to comply with a legal obligation for the performance of a public interest task or exercise of official authority.
>- for public health purposes in the public interest;
>- archiving purposes in the public interest, scientific research historical research or statistical purposes; or
>- the exercise or defence of legal claims.

From [ICO](https://ico.org.uk/for-organisations/guide-to-the-general-data-protection-regulation-gdpr/individual-rights/right-to-erasure/).

## Can you charge for removal?
Nope.

## Storing form entries in my CMS
A common feature of a CMS is to store submitted form entries in the database. Make sure that your software allows you (and your client) to remove entries from here.

Some forms have particularly sensitive information uploaded to them. For example a job application form might include a CV upload field. Be really careful here. That's some sensitive data you're handling.

More widely, consider why you need them in your CMS database at all. It's an additional place for data to go wrong, and they're usually emailed to an inbox anyway.

Consider purging form entries each week or so. Less unnecessary data on your hands, less stress for you - less risk to individuals.


## What about backed up data?
This gets tricky. Deleting data from backups ruins the integrity of a backup. But regardless of the completely reasonable technical argument, you simply can't be keeping people's data once they've asked for it to be removed and comply with the law.

An important distinction here is whether you keep _archives_ or _backups_. When you consider the rules for complying with requests, you can build a backup retention policy that complies with the regulations and still offers you a solid backup.

Long-term archives are even trickier. Do you _really_ need them? If you do, you'd probably need to access the archives and delete the relevant data from them too.

### Mayday! Mayday!
Say you deleted someone at 2PM, but had a need to recover yesterday's backup at 5PM. Suddenly that person's back. And you're no longer complying with the law.

It's wise to keep temporary record of who has asked for what to be removed (and then safely discard of that when it's safe) so that in the event of having to recover a backup you can re-delete the data.

Bake this into your backup and recovery procedures.

---

[⏪ Back](https://github.com/madebymutual/GDPR-ePR-Guide/blob/master/en/toc.md)
