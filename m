Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.16485.1621241131400586631
 for <docs@lists.yoctoproject.org>;
 Mon, 17 May 2021 01:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A9F536000B;
	Mon, 17 May 2021 08:45:29 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [RFC 0/3] add support for diagrams generated from SVG sources
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
 <CAP71WjxpKO1hXb5wEgXeiHVt4EwfeEc08cTz88CG7684Eu-KJw@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <c9b30dd5-b153-b966-be59-fb936caedc6d@bootlin.com>
Date: Mon, 17 May 2021 10:45:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAP71WjxpKO1hXb5wEgXeiHVt4EwfeEc08cTz88CG7684Eu-KJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Nicolas,

On 5/17/21 12:11 AM, Nicolas Dechesne wrote:
>
>
>
> Getting more svg files is definitely the way to go.. thanks for
> starting this. It seems like there are sphinx extensions to convert
> images as needed, e.g.
> https://www.sphinx-doc.org/en/master/usage/extensions/imgconverter.html
> <https://www.sphinx-doc.org/en/master/usage/extensions/imgconverter.html>
> or
> https://github.com/sephalon/sphinxcontrib-svg2pdfconverter
> <https://github.com/sephalon/sphinxcontrib-svg2pdfconverter>
> which seems to support inkscape:
> https://github.com/sephalon/sphinxcontrib-svg2pdfconverter/blob/master/sphinxcontrib/inkscapeconverter.py
> <https://github.com/sephalon/sphinxcontrib-svg2pdfconverter/blob/master/sphinxcontrib/inkscapeconverter.py> 
>
> Have you looked into that or not?


Not yet, but this sounds like a much better option for converting SVG to
PNG and PDF, rather than having to do this manually in the Makefile.
I will try to use those.

Thanks for the great suggestion!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

