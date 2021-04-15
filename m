Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.1478.1618511314160642851
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 11:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from [192.168.1.25] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 049F820004;
	Thu, 15 Apr 2021 18:28:31 +0000 (UTC)
Subject: Re: [docs] [PATCH] manuals: simplify colon usage
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org,
 Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <167613DD803B4636.18329@lists.yoctoproject.org>
 <c0301119-4642-4f26-ce90-71679c433a40@bootlin.com>
 <20210415165530.udervizadnby6v6w@qschulz>
 <a45556a5-78f8-1c3e-ae36-335636981efa@bootlin.com>
 <7BD96963-1AFA-4FD8-9805-281EEE50C8C0@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9087a1af-3ac4-b42b-f408-cbd4cce86dec@bootlin.com>
Date: Thu, 15 Apr 2021 20:28:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7BD96963-1AFA-4FD8-9805-281EEE50C8C0@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 4/15/21 8:14 PM, Quentin Schulz wrote:
>
> I used ag -R ":\n\s*::" to find them. 

Very cool! I didn't know this command but I won't forget it, thanks :)

Indeed, I'll add another patch fixing those, which are equivalent, but
not looking as bad as ": ::" on the same line.

I'll keep this for tomorrow ;), and will update my (so far private)
bitbake changes too.

Thanks again

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

