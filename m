Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.5055.1630485005360863820
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Sep 2021 01:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 20FF7C0015;
	Wed,  1 Sep 2021 08:30:02 +0000 (UTC)
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] virtual providers don't apply to runtime dependencies?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <09ae7be-46c4-ab72-542-a450f6132b5b@crashcourse.ca>
 <0af509d5adc926ade1439a011d03e26687773e74.camel@linuxfoundation.org>
 <d39a9c39-f618-a02d-f188-87172318f3bc@bootlin.com>
 <b759d81-504e-3ca9-e07c-55d0d826ffae@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <832238bb-60bf-dfe7-36ad-fe52f9f3ba1f@bootlin.com>
Date: Wed, 1 Sep 2021 10:30:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b759d81-504e-3ca9-e07c-55d0d826ffae@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

On 9/1/21 10:12 AM, Robert P. J. Day wrote:
>   *sigh* ... i feel responsible for opening yet another can of worms.


Don't worry, it was a nice opportunity at least for me to clarify some
notions and it will allow to improve recipes in OE core.

Thanks for everything!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

