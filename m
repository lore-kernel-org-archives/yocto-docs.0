Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCE5C433FE
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 16:29:17 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.3254.1633451355888726516
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 09:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E18E1C0013;
	Tue,  5 Oct 2021 16:29:11 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH 2/4] docs: sphinx-static: switchers.js: correctly
 highlight obsolete releases
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <20210928162202.749990-1-quentin.schulz@theobroma-systems.com>
 <20210928162202.749990-2-quentin.schulz@theobroma-systems.com>
 <CAP71WjzPeZJQsesFc=uweY9=C_QyDOR3UmX5YE4qnWLEVkdWLA@mail.gmail.com>
 <20211005141141.xmaltlqoju27rd4h@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <0c6caeec-da66-2bc1-1f6f-6e93c7dd009f@bootlin.com>
Date: Tue, 5 Oct 2021 18:29:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005141141.xmaltlqoju27rd4h@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Oct 2021 16:29:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1915

Quentin, Nicolas,

Thanks for the proposals!

On 10/5/21 4:11 PM, Quentin Schulz wrote:
> This is a different topic but yes we should settle on some solution that
> is better than this. We could have a separate git repo somewhere for
> that file. Then I can think of two solutions:
>
> 1) git clone this repo as part of the documentation
>  publishing/development, which is "nicer" because it's explicit the
>  switchers.js is the same for all releases but it's still just a cleaner
>  way to implement the find command above,
>
> 2) have the web server serve this js in a
>  docs.yoctoproject.org/somepath/switchers.js and add this path to the
>  sphinx template, though we would need to think of a way to not need
>  internet access on local development but I'm sure we can think of some
>  hackish way :)


I'd vote for 1), which looks cleaner. The file served by the webserver
would be in a git repository anyway.

>
> Also, I would very much like we have a similar mechanism for the
> theme_override.css for Sphinx because I've fixed a few things in the
> last few months and those aren't shown on old releases.
>
>> I've faced issues when trying to load an 'external' XML file into the
>> docs website (something to deal with proxy or permissions..).. so I
>> tried to have the 'release information' in one structure (in
>> switchers.js as an intermediate step), which looks like that:
>>
>> +  var all_versions = [
>> +    {'version' : 'dev', 'name' : 'dev (3.3)', 'show' : 'yes'},
>> +
>> +    {'version' : '3.2',   'show' : 'yes'},
>> +
>> +    {'version' : '3.1.3', 'show' : 'yes', 'docbook' : 'yes'},
>> +    {'version' : '3.1.2', 'show' : 'yes', 'docbook' : 'yes', 'state'
>> : 'outdated'},
>> +    {'version' : '3.1.1', 'show' : 'yes', 'docbook' : 'yes', 'state'
>> : 'outdated'},
>> +    {'version' : '3.1',   'show' : 'yes', 'docbook' : 'yes', 'state'
>> : 'outdated'},
>> +
>> +    {'version' : '3.0.4', 'show' : 'yes', 'docbook' : 'yes', 'state'
>> : 'obsolete'},
>> +    {'version' : '3.0.3', 'show' : 'no', 'docbook' : 'yes', 'state' :
>> 'obsolete'},
>> +    {'version' : '3.0.2', 'show' : 'no', 'docbook' : 'yes', 'state' :
>> 'obsolete'},
>> +    {'version' : '3.0.1', 'show' : 'no', 'docbook' : 'yes', 'state' :
>> 'obsolete'},
>> +    {'version' : '3.0',   'show' : 'no', 'docbook' : 'yes', 'state' :
>> 'obsolete'},
>> +
>> +    {'version' : '2.7.4', 'show' : 'yes', 'docbook' : 'yes', 'state'
>> : 'obsolete'},
>> +    {'version' : '2.7.3', 'show' : 'no', 'docbook' : 'yes', 'state' :
>> 'obsolete'},
>> +    {'version' : '2.7.2', 'show' : 'no', 'docbook' : 'yes', 'state' :
>> 'obsolete'},
>> +    {'version' : '2.7.1', 'show' : 'no', 'docbook' : 'yes', 'state' :
>> 'obsolete'},
>> +    {'version' : '2.7',   'show' : 'no', 'docbook' : 'yes', 'state' :
>> 'obsolete'},
>> +  ];
>>
>> At least, it becomes straightforward to insert a new release in the
>> table.. I am not sure I ever showed that.. so adding more to the
>> discussion.. I am sure the project would benefit from an overall
>> releases information database in a few other places, so that could be
>> extended.
>>
>>  [1] https://urldefense.proofpoint.com/v2/url?u=http-3A__git.yoctoproject.org_cgit_cgit.cgi_yocto-2Dautobuilder-2Dhelper_tree_scripts_run-2Ddocs-2Dbuild&d=DwIBaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=IkqJJb6C5WoayEw2QGUj-ZxPis-lTJKhRZGrreYumxY&s=xoOeS1RNOATX4K5WSvEy7WE1VZbB9hXH_f_BWQ_Ea1g&e= 
>>
> I don't know how far we are from implementing *a* new (hopefully) better
> solution for this, so shall I just go on with the dictionary suggested
> above?
>
> You probably did and I probably forgot since then :)
>
> Lastly, you talked about on IRC or in another mail I don't remember that
> you would very much see this array in a separate file so that it can be
> reused in other parts (and why not in some automation
> tests/scripts/builds/whatever) so that we only have to maintain one file
> and everything depending on releases and in which state they are, etc..
> would be gathered at the same place. I guess we could put this info into
> a json file that is then loaded and parsed by the javascript though we
> have to make sure the parsing of the JSON is safe, which is another
> topic in itself :)


By the way, it would also be nice to include the release date and EOL
date (which could be in the past... that's another way of marking a
release as obsolete). This way, we could have the information of whether
a release is obsolete or otherwise until when it will supported, in the
documentation itself and on the release pages too, and not just on a
wiki page.

This would address https://bugzilla.yoctoproject.org/show_bug.cgi?id=14503

Quentin, am I right to assume that we're waiting for further decisions
on this thread before merging your commits? Or do you think we could
already merge some of them?

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


