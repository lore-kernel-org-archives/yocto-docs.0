Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.21761.1627919248979525797
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 08:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id DE98F200004;
	Mon,  2 Aug 2021 15:47:26 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] manuals: initial documentation for CVE management
To: Steve Sakoman <steve@sakoman.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <169784CA8E208BFA.17923@lists.yoctoproject.org>
 <20210802145454.12521-1-michael.opdenacker@bootlin.com>
 <CAOSpxdYZoZneKxnkASheZeFkJL_3DeOdjJy7NwTjoAfueiWasw@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <e0f025b8-103a-db08-6681-98f54ad7840a@bootlin.com>
Date: Mon, 2 Aug 2021 17:47:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOSpxdYZoZneKxnkASheZeFkJL_3DeOdjJy7NwTjoAfueiWasw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Quentin, Steve,

On 8/2/21 5:10 PM, Steve Sakoman wrote:
> On Mon, Aug 2, 2021 at 4:55 AM Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
>> This starts to document vulnerability management
>> and the use of the CVE_PRODUCT variable
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> This looks good!  Thanks for documenting this.  I'll pull this into
> the dunfell docs too.


Thanks for the reviews. I merged the change into master-next
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

