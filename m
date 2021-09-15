Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.7398.1631711712598296719
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 06:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id ACEF9200007;
	Wed, 15 Sep 2021 13:15:10 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: delete unmaintained history sections
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210914145930.371537-1-michael.opdenacker@bootlin.com>
 <20210915105931.yonsqyxkb67ytjim@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <e88e2062-128d-6b3b-09c4-50f916535553@bootlin.com>
Date: Wed, 15 Sep 2021 15:15:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915105931.yonsqyxkb67ytjim@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Thanks for the review!

On 9/15/21 12:59 PM, Quentin Schulz wrote:
> Hi Michael,
>
> On Tue, Sep 14, 2021 at 04:59:30PM +0200, Michael Opdenacker wrote:
>> This deletes the history sections in each sub-manual,
>> which didn't add any value, given that they didn't list
>> the changes from one Yocto Project version to the next.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> I think it would still make sense to have this information somewhere in
> the docs, to at least highlight how old the release you're using is.
>
> Something like:
> https://wiki.yoctoproject.org/wiki/Releases
> but in the docs.
>
> I assume we would need to handle this docs.yoctoproject.org wide and not
> per release as otherwise it'll fall out of sync again.
>
> In any case, just food for thoughts.


I'm not sure about the usefulness of a table that is just in parallel
with the Yocto Project versions, as in what we have today (e.g. on
https://docs.yoctoproject.org/kernel-dev/history.html).

However, it may be useful indeed to keep track of the YP version for
which the documentation was generated. Otherwise, for copies that are
not published on our website, the only way to figure this out seems to
be the latest version mentioned in the migration guides.

Something such as "Last updated on Sep 13, 2021, for Yocto Project
release 3.4" in the common footer, instead of just "Last updated on Sep
13, 2021". I could use "&YOCTO_DOC_VERSION;" to get this and it would
work without extra effort from the people managing the releases.

What do you think?

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

