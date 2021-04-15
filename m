Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.7662.1618496284198423443
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 07:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.10] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id D9371200004;
	Thu, 15 Apr 2021 14:18:01 +0000 (UTC)
Cc: Quentin Schulz <quentin.schulz@streamunlimited.com>,
 Paul Eggleton <paul.eggleton@linux.microsoft.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 08/13] ref-manual: add passwd-expire to EXTRA_USERS_PARAMS
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <c973665acd8a5259b19ab512b2ae7f6d10848cb5.1618358456.git.paul.eggleton@linux.microsoft.com>
 <20210414081303.kciysuaevt3bhjtg@qschulz>
 <CAP71WjxiU5pfmCkybgaqijUz1LbMoe5_3tJcQDuYWeSsm+hxgg@mail.gmail.com>
 <1b5dc85a-24ab-379d-47ef-6d11229f71da@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <de95f1a5-8c0e-8bb2-dc51-84aab8eaf487@bootlin.com>
Date: Thu, 15 Apr 2021 16:18:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1b5dc85a-24ab-379d-47ef-6d11229f71da@crashcourse.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

On 4/14/21 10:36 AM, Robert P. J. Day wrote:
>   i recall sending such a patch a while back, but for whatever reason,
> it did not apply cleanly so it was shelved.


I'll be happy to make a new version, thanks!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

