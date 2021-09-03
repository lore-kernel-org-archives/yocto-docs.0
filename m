Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.593.1630689168683937376
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Sep 2021 10:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3281FC000D;
	Fri,  3 Sep 2021 17:12:39 +0000 (UTC)
Subject: Re: [docs] [PATCH] README: update manual list and names, online docs URL
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <5ae42459-99a9-c7fc-45a2-3f3cf6345ce@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ec4b0df7-eb8b-878b-7910-e949c457f2a7@bootlin.com>
Date: Fri, 3 Sep 2021 19:12:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5ae42459-99a9-c7fc-45a2-3f3cf6345ce@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/29/21 9:04 AM, Robert P. J. Day wrote:
> Minor tweaks to top-level README:
>   - add missing line for overview manual
>   - correct manual names to match their *actual* names
>   - point reader at docs.yoctoproject.org for online docs
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>


Thanks for the patch!

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged in master-next.

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

