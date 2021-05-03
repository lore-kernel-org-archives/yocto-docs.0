Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.36009.1620057208977869008
 for <docs@lists.yoctoproject.org>;
 Mon, 03 May 2021 08:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from [10.0.0.19] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 28C471BF20B;
	Mon,  3 May 2021 15:53:25 +0000 (UTC)
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] sdk-manual: various cleanups to intro.rst
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <f8833f4-34ab-98d2-ede1-881bf279ee60@crashcourse.ca>
 <BB89D528-4B9B-4E2A-808E-F679154865B2@0leil.net>
 <600b21c7-859d-ae19-4d2d-19e3807a79d9@bootlin.com>
 <73edbf27-7a4a-b1ab-a674-c89483566336@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <28ac87f4-6a76-8cfa-7528-40d020b97b56@bootlin.com>
Date: Mon, 3 May 2021 17:53:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <73edbf27-7a4a-b1ab-a674-c89483566336@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

On 5/3/21 4:30 PM, Robert P. J. Day wrote:
>
>   i've noticed the prevalence of unnecessary prose in lots of places.
> example:
>
>   "To frobnicate the fubar, run the following command:"
>
> when it should say simply:
>
>   "To frobnicate the fubar, run:"
>
> and so on.

Definitely agree. Indeed, there are many instances of "the following"
worth inspecting.

I've also found unnecessary instances of "exists", such as:

"support also exists for systemd"

while I would just say:

"systemd is also supported"

And this was a simple case!

>
>   i can't remember who said it, but some literary giant once said
> something like, "half my time is spent writing, the other half
> throwing away what shouldn't be there."


I cannot find the original quote, but yes, it makes sense. I'll probably
get a new pass on my copy of the "Elements of Style" book :)

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

