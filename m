Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.10186.1631722802386074126
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 09:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3A9A7FF808;
	Wed, 15 Sep 2021 16:20:00 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] [PATCH] manuals: delete unmaintained history sections
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210914145930.371537-1-michael.opdenacker@bootlin.com>
 <20210915105931.yonsqyxkb67ytjim@fedora>
 <e88e2062-128d-6b3b-09c4-50f916535553@bootlin.com>
 <4D8E093F-E713-4BA3-88D2-1BEF4B8C9726@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d6bf7791-2128-5ddf-eba8-885d84c68081@bootlin.com>
Date: Wed, 15 Sep 2021 18:19:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4D8E093F-E713-4BA3-88D2-1BEF4B8C9726@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 9/15/21 5:49 PM, Quentin Schulz wrote:
> Isn't this patch about removing this page?
>
> Having at least a link in the documentation (might be to some URL outside of docs) to highlight when a release was.. released and when it went EOL. Also the name and number of the release.

I agree that we need proper documentation about release and EOL dates
for each release, and not just a wiki page. I'm tracking this:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14503However, it may
be useful indeed to keep track of the YP version for
>> which the documentation was generated. Otherwise, for copies that are
>> not published on our website, the only way to figure this out seems to
>> be the latest version mentioned in the migration guides.
>>
>> Something such as "Last updated on Sep 13, 2021, for Yocto Project
>> release 3.4" in the common footer, instead of just "Last updated on Sep
>> 13, 2021". I could use "&YOCTO_DOC_VERSION;" to get this and it would
>> work without extra effort from the people managing the releases.
>>
>> What do you think?
>>
> I think those are different topics, so I may not have conveyed my idea the way I intended to.
>
> On that topic, I can suggest Something like "Yocto Project documentation release 3.4 - Last updated on Sep 13, 2021"?
>
> But yeah, it could be a good idea especially if the footer is at the bottom of each page on a PDF version of the doc.


Sure, I'll propose another change to address this.

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

