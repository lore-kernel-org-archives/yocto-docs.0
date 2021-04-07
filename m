Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.5933.1617796452900751305
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Apr 2021 04:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1269040007;
	Wed,  7 Apr 2021 11:54:10 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [master-next] Pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <03e26f4b-2dfe-33a2-3eea-607a0f088cc0@bootlin.com>
 <6acad11074eda38fc1cca3c6f128a702d10d9522.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <794b2b6c-31e6-9eb2-5479-280e9091b6bb@bootlin.com>
Date: Wed, 7 Apr 2021 13:54:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6acad11074eda38fc1cca3c6f128a702d10d9522.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Richard,

On 4/6/21 11:36 PM, Richard Purdie wrote:
>
> Thanks, the commits themselves look good, the commit messages needed
> a little tweaking. There was a Signed-off-by line that went missing. I
> added it back since it was in the on-list version of the patch. I also
> tweaked the shortlogs a little so they were more consistent. I tend to
> do this with patches as a maintainer just to have some kind of consistency
> when people search repositories.
>
> No need to redo this pull request as I've tweaked it (I want to get to a
> release build!), just info for next time! :)


Thanks for the guidance and for eventually taking the time to fix the
commit messages by yourself. Indeed, I hadn't touched the commits that
were already in master-next, but I should have. I'll be extra careful
next time.

About the commit without S-O-B, that's my fault. I must have forgotten
"-s" when I split a patch in two to have a better shortlog. Good to know
that the commits themselves looked all right.

Thanks again!

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

