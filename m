Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.8262.1616168743433327203
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 08:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.9] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1EF1C1C0005;
	Fri, 19 Mar 2021 15:45:40 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Inconsistent use of "cd ~/poky" and "cd poky" in the manuals
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <9c893145-b926-10ca-35f0-ce4348110d49@bootlin.com>
 <3d828cd45f59e3a7cf2f8966fd3cefd2bb24bb89.camel@linuxfoundation.org>
 <CAP71Wjyp=jERgyCfajb-nziCbD=HchJ0hbRte_VaBZwmBTtzPA@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <14061b03-f679-8919-1cc4-c4e24144f196@bootlin.com>
Date: Fri, 19 Mar 2021 16:45:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAP71Wjyp=jERgyCfajb-nziCbD=HchJ0hbRte_VaBZwmBTtzPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Nico,

On 3/19/21 4:38 PM, Nicolas Dechesne wrote:
> On Fri, Mar 19, 2021 at 4:34 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2021-03-19 at 16:32 +0100, Michael Opdenacker wrote:
>>> On the other hand, my second idea was to stop assuming that poky was
>>> cloned from the home directory, and propose a patch that replaces
>>> "~/poky/" by "poky/" everywhere, assuming that people using the Yocto
>>> Project know how to use their brains anyway and understand where they're
>>> storing their data ;-)
>>>
>>> What would be your preference? Has this already been discussed?
>> I've never spotted that :)
>>
>> I'd think changing to poky/ would be more consistent, we don't require
>> it to be in ~ but its just an opinion...
> Regardless of the solution, consistency is definitely needed!
>
> So let me propose a 3rd way :) We could assume that poky is install in
> $POKY and use that all over the place. If anyone wants to copy/paste
> snippet from the doc, they would just need to define the POKY env var.


But then, we would be introducing a new environment variable, and some
people may wrongly assume it's used in the code somewhere too, though
it's only for the convenience of documentation... This could be
confusing new users.

Just my two cents, though. You know new users much better than I do.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

