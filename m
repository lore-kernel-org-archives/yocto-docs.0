Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.4689.1623223624165513731
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 00:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 642D7240007;
	Wed,  9 Jun 2021 07:27:01 +0000 (UTC)
Subject: Re: [docs] [PATCH v2] test-manual: add initial reproducible builds documentation
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <16868CB8BF8EEF84.10003@lists.yoctoproject.org>
 <20210608095853.48522-1-michael.opdenacker@bootlin.com>
 <54e468ef-829c-b821-b08e-881907c71f33@bootlin.com>
 <0591116ff6dcf30424f4a36ada7248898b7a1527.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <0b2ff6b0-da25-0203-4ae5-1022fab5b7f0@bootlin.com>
Date: Wed, 9 Jun 2021 09:27:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0591116ff6dcf30424f4a36ada7248898b7a1527.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Richard,

On 6/8/21 3:10 PM, Richard Purdie wrote:
> On Tue, 2021-06-08 at 12:01 +0200, Michael Opdenacker wrote:
>> So, this was my pass (fixing typos and style, adding references, adding
>> more punctuation, breaking long sentences), so that other people can
>> offer their review now.
> Looks good, thanks!


Thanks for confirming!
For my own convenience (that will be easier to process your "YP
compatible" changes which assume this one is accepted), I merged these
changes into master-next.

If any of you have suggestions to improve or correct the text, you can
send me a patch against master-next, or just comments to the V2 patch
which I'll integrate manually.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

