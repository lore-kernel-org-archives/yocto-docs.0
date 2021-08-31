Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.9324.1630430649750616353
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 10:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 00307240004;
	Tue, 31 Aug 2021 17:24:07 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: explicit that devpyshell is a task
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210830141750.66210-1-michael.opdenacker@bootlin.com>
 <20210831081245.o5od4ngeoepl2sww@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <62c642bd-1baa-520e-6bb9-9676a3dd56dd@bootlin.com>
Date: Tue, 31 Aug 2021 19:24:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831081245.o5od4ngeoepl2sww@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 8/31/21 10:12 AM, Quentin Schulz wrote:
> Hi Michael,
>
> On Mon, Aug 30, 2021 at 04:17:50PM +0200, Michael Opdenacker wrote:
>> Without this, readers could think that "devpyshell" is a script,
>> at least until they read the remainder of the section.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reviewed-by: Quentin Schulz <foss@0leil.net>


Thanks for the review!
Merged into master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

