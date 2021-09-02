Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.577.1630605031357207241
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Sep 2021 10:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id E3585100005;
	Thu,  2 Sep 2021 17:50:28 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: add line continuations for aesthetics
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <9490f67c-af80-2517-737f-f05591c9a0bb@crashcourse.ca>
 <20210830091723.ercjocjlom2yond6@fedora>
 <5458d17c-ba98-7e9a-e351-8f91dbbd6912@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <e9d56be9-4f0b-feef-7ee5-2d1d883796d2@bootlin.com>
Date: Thu, 2 Sep 2021 19:50:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5458d17c-ba98-7e9a-e351-8f91dbbd6912@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

On 8/30/21 11:26 AM, Robert P. J. Day wrote:
> On Mon, 30 Aug 2021, Quentin Schulz wrote:
>
>> Hi Robert,
>>
>> On Mon, Aug 30, 2021 at 05:00:39AM -0400, Robert P. J. Day wrote:
>>> Not a fan of lengthy lines that require horizontal scrolling,
>>> so add line continuations.
>>>
>>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>>
>> It is the content of the recipe afterall, so not sure it's desired?
>> Will let Michael/Nicolas decide.


Right, not sure there's much added value in tweaking real code. I also
checked the epub and pdf output and the lines are automatically wrapped.

>>
>> In any case, this code is out of sync, e.g. WITHOUT_XATTR is now
>> embedded in a bb.utils.contains check. Since you're sending patch
>> for this already, do you mind sending a patch for this too please?
>   in cases like this, it's pretty much a given that any recipe will be
> out of date in a while, but i don't think that's a big deal -- the
> idea is just to present a *concept*, not to guarantee that the recipe
> matches exactly the current version. i am willing to be corrected,
> though.


What could be embarrassing is when the code no longer works, so this
would be a reason for keep example code reasonably up to date. However,
I agree we shouldn't try to always keep the code excerpts in sync with
the actual code. Unless we find a way to fetch the source code directly
from the git repositories ?

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

