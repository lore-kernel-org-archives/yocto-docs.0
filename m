Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.5073.1617869369586695179
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Apr 2021 01:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A9F79240019;
	Thu,  8 Apr 2021 08:09:27 +0000 (UTC)
Subject: Re: [docs] [PATCH] docs: add a top level page for bitbake documentation
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 docs@lists.yoctoproject.org
References: <20210407163506.148438-1-nicolas.dechesne@linaro.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <00dcbef6-8cce-e0f5-cbcd-ffa7e6140a5f@bootlin.com>
Date: Thu, 8 Apr 2021 10:09:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210407163506.148438-1-nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/7/21 6:35 PM, Nicolas Dechesne wrote:
> The top level index file includes a link to the Bitbake
> documentation. This link is static, however the location of the
> Bitbake documentation depends on the intersphinx configuration. As
> such, when looking at an old YP docs release, the link to the bitbake
> documentation is always the same (and wrong).
>
> Since we cannot use a cross reference in a toc index, this patch
> creates an intermediate page for bitbake documentation, and in that
> page we insert the right link to the bibtake documentation
> (e.g. :doc:`bitbake:index`) which will be adjusted dynamically based
> on intersphinx config.
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>


Tested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Thanks!

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

