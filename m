Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.17456.1630332349567671865
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 07:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id D1DA524000C;
	Mon, 30 Aug 2021 14:05:46 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: pass False to d.getVar() for devpyshell example
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <fe6cf3af-6c9f-a4c0-9f5b-48beccdb11ae@crashcourse.ca>
 <20210830131054.rivxseengnuju4sz@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <27d0517e-552c-d5df-09fc-ecd94534a77e@bootlin.com>
Date: Mon, 30 Aug 2021 16:05:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830131054.rivxseengnuju4sz@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 8/30/21 3:10 PM, Quentin Schulz wrote:
> Hi Robert,
>
> On Mon, Aug 30, 2021 at 08:05:30AM -0400, Robert P. J. Day wrote:
>> In the example in section 3.9, the call to d.getVar() needs to have
>> the additional arugment of "False" so that the output is not expanded.
>>
>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>
>> ---
>>
>>   pretty sure it works this way.
>>
> The second positional argument is indeed "expand", which by default is
> true.
>
> Reviewed-by: Quentin Schulz <foss@0leil.net>


Tested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Now merged in "master-next".

Thanks for the patch and the review!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

