Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.6145.1621329528085159315
 for <docs@lists.yoctoproject.org>;
 Tue, 18 May 2021 02:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 70BD9240003
	for <docs@lists.yoctoproject.org>; Tue, 18 May 2021 09:18:44 +0000 (UTC)
Subject: Re: [docs] [PATCH 0/6] Simplify style around the use of the "exist" verb
To: docs@lists.yoctoproject.org
References: <167EE1EFBB61D5C1.24280@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <81376c30-8ec7-b422-3b97-3a2d42ca4ea0@bootlin.com>
Date: Tue, 18 May 2021 11:18:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <167EE1EFBB61D5C1.24280@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

On 5/14/21 10:35 AM, Michael Opdenacker wrote:
> This patchset, split by manual (or small group of manuals) to
> ease the review process, addresses the excess use of the verb
> "exist", which is either vague at best, or yields expressions
> which can be replaced by much simpler and natural ones.
>
> The resulting text is not always shorter, but should at least
> be easier to read.
>
> By trying to simplify such expressions, further style simplifications
> are sometimes implemented on the corresponding text, as well as a few formating
> fixes, together with missing reference additions.
>
> Note that many paragraphs modified this way could further be simplified,
> as well as other ones. However, this will have to be addressed in an
> iterative and progressive way.
>
> Michael Opdenacker (6):
>   ref-manual: simplify style
>   kernel-dev manual: simplify style
>   dev-manual: simplify style
>   sdk-manual: simplify style and fix formating
>   overview-manual: simplify style and add missings references
>   manuals: simplify style

Merged these changes into the master-next branch of "yocto-docs", and
will submit a pull request for inclusion in master by the end of the week.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

