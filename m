Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.8200.1616168413960680698
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 08:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.9] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BC22720018;
	Fri, 19 Mar 2021 15:40:10 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] Inconsistent use of "cd ~/poky" and "cd poky" in the manuals
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <9c893145-b926-10ca-35f0-ce4348110d49@bootlin.com>
 <3d828cd45f59e3a7cf2f8966fd3cefd2bb24bb89.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <4b9e108e-0d6e-d1ce-a771-5d05a0209bc3@bootlin.com>
Date: Fri, 19 Mar 2021 16:40:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3d828cd45f59e3a7cf2f8966fd3cefd2bb24bb89.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Richard,

Thanks for your advise!

On 3/19/21 4:34 PM, Richard Purdie wrote:
> On Fri, 2021-03-19 at 16:32 +0100, Michael Opdenacker wrote:
>> On the other hand, my second idea was to stop assuming that poky was
>> cloned from the home directory, and propose a patch that replaces
>> "~/poky/" by "poky/" everywhere, assuming that people using the Yocto
>> Project know how to use their brains anyway and understand where they're
>> storing their data ;-)
>>
>> What would be your preference? Has this already been discussed?
> I've never spotted that :)

That's the advantage of being new to the project.

I hope I won't lose it to quickly ;)

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

