Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.14953.1626112233051710293
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Jul 2021 10:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 293EF20000A;
	Mon, 12 Jul 2021 17:50:30 +0000 (UTC)
Subject: Re: [docs] [PATCH] docs: remove image-mklibs references
To: Patrick Williams <patrick@stwcx.xyz>, docs@lists.yoctoproject.org
References: <20210709130331.369607-1-patrick@stwcx.xyz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <7b5c156c-ce13-74fd-7aac-2fd539cadc14@bootlin.com>
Date: Mon, 12 Jul 2021 19:50:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709130331.369607-1-patrick@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Patrick,

On 7/9/21 3:03 PM, Patrick Williams wrote:
> The image-mklibs bbclass was removed from OE-Core with
> commit 908df863b419d1cad7317153101fc827e7e3a354 and
> corresponding changes to local.conf.sample were made
> in meta-yocto with c8c8f284eb2abe7e1352850a885454487cc01986.
>
> Remove all references to image-mklibs from the documentation
> as it is no longer supported.
>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>


Thanks for the update. I see that Richard took care of merging it.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

