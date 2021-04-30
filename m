Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.577.1619802989996268732
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 10:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from [192.168.1.25] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B39E3240002;
	Fri, 30 Apr 2021 17:16:27 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] trying to keep the variable glossary up to date
To: Quentin Schulz <quentin.schulz@streamunlimited.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <e1a39395-2a7c-895f-a977-d6baf87fba94@crashcourse.ca>
 <20210430122936.sytnerrfegtofdbz@qschulz>
 <1b73959f-136e-884c-c05c-d8abfea6ee3@crashcourse.ca>
 <20210430132857.u3ho2pcqfkaajscq@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <a1547a53-2100-7808-b4f9-1449e2de6958@bootlin.com>
Date: Fri, 30 Apr 2021 19:16:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430132857.u3ho2pcqfkaajscq@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

On 4/30/21 3:28 PM, Quentin Schulz wrote:
> BB* variables at least in the bitbake docs.
>
> Variables not used directly by bitbake (if openembedded-core/poky was
> not there), should be in YP docs.
>
> BB* variables can be described in YP docs too if the docs could benefit
> from a more YP-specific description compared to bitbake's.
>
> I don't think we need to be strict on what makes it to YP docs from the
> bitbake docs.
>
> In any case, if doc is sent, we can always decide where to put it. The
> thing is to get people to contribute patches to the doc whenever they
> contribute code.

This sounds like a good plan. I'll try to keep an eye on incoming
patches and comment on them when a documentation update is needed.

We probably won't have a perfect solution in which every variable
appears in the glossary, but at least we can do our best, as the
glossary looks like a useful resource for users.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

