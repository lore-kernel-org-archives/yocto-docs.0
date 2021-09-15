Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.9894.1631720991142228247
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 08:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C1DAB60004;
	Wed, 15 Sep 2021 15:49:48 +0000 (UTC)
Date: Wed, 15 Sep 2021 17:49:47 +0200
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org,
 Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: Re: [docs] [PATCH] manuals: delete unmaintained history sections
In-Reply-To: <e88e2062-128d-6b3b-09c4-50f916535553@bootlin.com>
References: <20210914145930.371537-1-michael.opdenacker@bootlin.com> <20210915105931.yonsqyxkb67ytjim@fedora> <e88e2062-128d-6b3b-09c4-50f916535553@bootlin.com>
Message-ID: <4D8E093F-E713-4BA3-88D2-1BEF4B8C9726@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 15, 2021 3:15:10 PM GMT+02:00, Michael Opdenacker <michael=2E=
opdenacker@bootlin=2Ecom> wrote:
>Hi Quentin,
>
>Thanks for the review!
>
>On 9/15/21 12:59 PM, Quentin Schulz wrote:
>> Hi Michael,
>>
>> On Tue, Sep 14, 2021 at 04:59:30PM +0200, Michael Opdenacker wrote:
>>> This deletes the history sections in each sub-manual,
>>> which didn't add any value, given that they didn't list
>>> the changes from one Yocto Project version to the next=2E
>>>
>>> Signed-off-by: Michael Opdenacker <michael=2Eopdenacker@bootlin=2Ecom>
>> I think it would still make sense to have this information somewhere in
>> the docs, to at least highlight how old the release you're using is=2E
>>
>> Something like:
>> https://wiki=2Eyoctoproject=2Eorg/wiki/Releases
>> but in the docs=2E
>>
>> I assume we would need to handle this docs=2Eyoctoproject=2Eorg wide an=
d not
>> per release as otherwise it'll fall out of sync again=2E
>>
>> In any case, just food for thoughts=2E
>
>
>I'm not sure about the usefulness of a table that is just in parallel
>with the Yocto Project versions, as in what we have today (e=2Eg=2E on
>https://docs=2Eyoctoproject=2Eorg/kernel-dev/history=2Ehtml)=2E
>

Isn't this patch about removing this page?

Having at least a link in the documentation (might be to some URL outside =
of docs) to highlight when a release was=2E=2E released and when it went EO=
L=2E Also the name and number of the release=2E

We currently state that the doc you're looking at is outdated but there is=
 a difference between being 6 months behind and being 5 years behind =F0=9F=
=98=81

The issue is that what is stored in this link should not need to be update=
d for every docs branch otherwise it will fall out-of-date pretty quickly=
=2E

>However, it may be useful indeed to keep track of the YP version for
>which the documentation was generated=2E Otherwise, for copies that are
>not published on our website, the only way to figure this out seems to
>be the latest version mentioned in the migration guides=2E
>
>Something such as "Last updated on Sep 13, 2021, for Yocto Project
>release 3=2E4" in the common footer, instead of just "Last updated on Sep
>13, 2021"=2E I could use "&YOCTO_DOC_VERSION;" to get this and it would
>work without extra effort from the people managing the releases=2E
>
>What do you think?
>

I think those are different topics, so I may not have conveyed my idea the=
 way I intended to=2E

On that topic, I can suggest Something like "Yocto Project documentation r=
elease 3=2E4 - Last updated on Sep 13, 2021"?

But yeah, it could be a good idea especially if the footer is at the botto=
m of each page on a PDF version of the doc=2E

Cheers,
Quentin
