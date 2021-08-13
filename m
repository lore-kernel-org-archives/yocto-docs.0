Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.34464.1628847728593225934
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 02:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7B6F520003;
	Fri, 13 Aug 2021 09:42:06 +0000 (UTC)
Cc: Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH v3] kickstart: document which options accept units
To: o.mandel@menlosystems.com, docs@lists.yoctoproject.org
References: <20210813083743.g4a2iax2ybxusamc@fedora>
 <20210813084855.9693-1-o.mandel@menlosystems.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <5d86b0c6-3106-7410-9338-ff33ebe38473@bootlin.com>
Date: Fri, 13 Aug 2021 11:42:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813084855.9693-1-o.mandel@menlosystems.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Olaf,

Many thanks for the patch, and thanks to Quentin for the review!

On 8/13/21 10:48 AM, o.mandel@menlosystems.com wrote:
>  
> --  ``--offset (in KBytes)``: This option is a Wic-specific option that
> +-  ``--offset``: This option is a Wic-specific option that
>     says to place a partition at exactly the specified offset. If the
>     partition cannot be placed at the specified offset, the image build
> -   will fail.
> +   will fail. Specify as an integer value optionally followed by one of
> +   the units "s" / "S" for 512Byte sector, "k" / "K" for kibibyte, "M"
> +   for mebibyte and "G" for gibibyte. The default unit if none is given
> +   is "k".
>  

I replaced "512Byte" by "512 byte".
Don't hesitate to protest if you disagree!

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into the "master-next" branch.

Thanks again!

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

