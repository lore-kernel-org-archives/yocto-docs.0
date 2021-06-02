Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.14282.1622645405068142607
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Jun 2021 07:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 19DE9C0004;
	Wed,  2 Jun 2021 14:50:02 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] docs: replace ``FOO`` by :term:`FOO` where possible
To: Quentin Schulz <foss@0leil.net>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <20210527184117.80067-1-foss@0leil.net>
 <CAP71Wjy9rLUs3kF7k9jjK04p8K4qLbqvzKXRtOQiKhOctxffxw@mail.gmail.com>
 <707599b21e074097e0a8a89873354a8c@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <65a33804-8952-b322-3103-1a758920a0fe@bootlin.com>
Date: Wed, 2 Jun 2021 16:50:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <707599b21e074097e0a8a89873354a8c@0leil.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Quentin, Nicolas,

On 5/29/21 5:15 PM, Quentin Schulz wrote:
>
> It works without making it explicit where the term is defined and I
> think it's what we want. Because if the term is only defined in
> Bitbake, itll find it anyway so all good. And the day we decide to
> "duplicate" the entry in the YP docs, it'll point to the one from YP,
> no maintenance needed so really neat :)
>
> I can make separate patches if you want but I would not like to add
> bitbake prefix.
>
> I've rewritten the script now and it's a bit smarter (no need to call
> sphinx.ext.intersphinx module). If there's interest I can try to make
> it even nicer and add it to the doc repo for future use since when
> we'll document more variables, if they are already highlihted
> somewhere else, it'll stay this way unless this script is run again.


Nicolas, did you think about it? Quentin seems to be waiting for your
feedback to send his v2 with the updated script.

I'd vote for keeping the script in the repository for future use as you
suggest, Quentin. You may copy it to ./tools/ or ./documentation/tools/

Thanks in advance,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

