Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.7414.1631712028452979372
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 06:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 26EAF1BF20B;
	Wed, 15 Sep 2021 13:20:25 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] manuals: replace Freenode by Libera Chat as IRC host
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <e2e971ad0d00ea02456bdf5010015c1031fe2d77.camel@linuxfoundation.org>
 <20210915064830.2191396-1-michael.opdenacker@bootlin.com>
 <CAP71Wjzfi4Lm7-NBmawMYh-3qxSfR9W6b_7rHYg6X0+NWb9SnQ@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <73c7e09d-167f-d107-521a-43a97cd64f6c@bootlin.com>
Date: Wed, 15 Sep 2021 15:20:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAP71Wjzfi4Lm7-NBmawMYh-3qxSfR9W6b_7rHYg6X0+NWb9SnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Nico,

On 9/15/21 9:22 AM, Nicolas Dechesne wrote:
>
>
> On Wed, Sep 15, 2021 at 8:48 AM Michael Opdenacker
> <michael.opdenacker@bootlin.com
> <mailto:michael.opdenacker@bootlin.com>> wrote:
>
>     Fixes [YOCTO #14546]
>     This also replaces the "#poky" channel (inactive)
>     by "#oe", which is more actively used.
>
>     Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com
>     <mailto:michael.opdenacker@bootlin.com>>
>
>
> Good catch! Thanks for the patch. Looks good to me.


Thank you for the review. Merged into master-next.

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

