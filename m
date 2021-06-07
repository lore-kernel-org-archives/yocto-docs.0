Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.33392.1623055078960767511
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 01:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id DE5F2200009;
	Mon,  7 Jun 2021 08:37:56 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [docs] [PATCH] docs: replace ``FOO`` by :term:`FOO` where possible
To: Quentin Schulz <foss@0leil.net>
References: <20210527184117.80067-1-foss@0leil.net>
 <CAP71Wjy9rLUs3kF7k9jjK04p8K4qLbqvzKXRtOQiKhOctxffxw@mail.gmail.com>
 <707599b21e074097e0a8a89873354a8c@0leil.net>
 <65a33804-8952-b322-3103-1a758920a0fe@bootlin.com>
 <CAP71Wjy+_tu6VAdWOZAFqfYeE3UQgYDcufFw2LJwOY0NM6efUg@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <a7b2178f-f6c7-4332-1b70-aa3c3835947f@bootlin.com>
Date: Mon, 7 Jun 2021 10:37:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAP71Wjy+_tu6VAdWOZAFqfYeE3UQgYDcufFw2LJwOY0NM6efUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Quentin,

On 6/2/21 7:26 PM, Nicolas Dechesne wrote:
>
>
> On Wed, Jun 2, 2021 at 4:50 PM Michael Opdenacker
> <michael.opdenacker@bootlin.com
> <mailto:michael.opdenacker@bootlin.com>> wrote:
>
>     Quentin, Nicolas,
>
>     On 5/29/21 5:15 PM, Quentin Schulz wrote:
>     >
>     > It works without making it explicit where the term is defined and I
>     > think it's what we want. Because if the term is only defined in
>     > Bitbake, itll find it anyway so all good. And the day we decide to
>     > "duplicate" the entry in the YP docs, it'll point to the one
>     from YP,
>     > no maintenance needed so really neat :)
>     >
>     > I can make separate patches if you want but I would not like to add
>     > bitbake prefix.
>     >
>     > I've rewritten the script now and it's a bit smarter (no need to
>     call
>     > sphinx.ext.intersphinx module). If there's interest I can try to
>     make
>     > it even nicer and add it to the doc repo for future use since when
>     > we'll document more variables, if they are already highlihted
>     > somewhere else, it'll stay this way unless this script is run again.
>
>
>     Nicolas, did you think about it? Quentin seems to be waiting for your
>     feedback to send his v2 with the updated script.
>
>
> Yes, I agree with last message from Quentin. He is right, we don't
> need to prefix with bitbake. 
>  
>
>
>     I'd vote for keeping the script in the repository for future use
>     as you
>     suggest, Quentin. You may copy it to ./tools/ or
>     ./documentation/tools/
>
>
> I think we tend to use ./scripts in a few other places, but it's a
> minor detail.
>
> Perhaps this script can be turned into a sphinx extension eventually,
> and emit warnings ;)


Am I right to expect a V2 from you? As far as I understood, you were
proposing to update the script quoted in the commit message.

On the other hand, if you don't have time, I'll be happy to take your
V1, as the patch contents are already correct...

Thanks in advance,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

