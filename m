Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.16129.1621241445572581408
 for <docs@lists.yoctoproject.org>;
 Mon, 17 May 2021 01:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B129DFF806;
	Mon, 17 May 2021 08:50:43 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [RFC 1/3] Makefile: allow epub and latexpdf outputs to use diagrams from SVG sources
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
 <20210515071219.307241-2-michael.opdenacker@bootlin.com>
 <CAP71Wjy+5HU9ZHWfiWKNu8wArLP8x4FMFmQURvrqubHZsr1JCQ@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <bfc9a5cd-a8c9-a5fe-a060-0025d9bf6f26@bootlin.com>
Date: Mon, 17 May 2021 10:50:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAP71Wjy+5HU9ZHWfiWKNu8wArLP8x4FMFmQURvrqubHZsr1JCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Nicolas,

On 5/17/21 12:12 AM, Nicolas Dechesne wrote:
>
>     +SVG2PNG       = inkscape
>     +SVG2PDF       = inkscape
>
>
> It is a new host dependency, we need to update the README and have a
> meaningful error message.

Yes, depending on the solution that is used, I'll update the list of
package requirements.

I guess we will also have to install those on the autobuilder machine(s)
too, otherwise it will break. Will this be manual, or is there a file we
need to fill so that the right packages are automatically installed on
the autobuilder(s)?

Thanks

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

