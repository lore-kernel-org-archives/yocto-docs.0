Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.5047.1617869551353497767
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Apr 2021 01:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5F9AF1C0006;
	Thu,  8 Apr 2021 08:12:27 +0000 (UTC)
Subject: Re: [docs] [PATCH] docs: add a top level page for bitbake documentation
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 docs@lists.yoctoproject.org
References: <20210407163506.148438-1-nicolas.dechesne@linaro.org>
 <1673D39EEB18536F.6806@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <3b0e4ab6-3717-3bd3-5495-e126774aa837@bootlin.com>
Date: Thu, 8 Apr 2021 10:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1673D39EEB18536F.6806@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/8/21 10:09 AM, Michael Opdenacker wrote:
> On 4/7/21 6:35 PM, Nicolas Dechesne wrote:
>> The top level index file includes a link to the Bitbake
>> documentation. This link is static, however the location of the
>> Bitbake documentation depends on the intersphinx configuration. As
>> such, when looking at an old YP docs release, the link to the bitbake
>> documentation is always the same (and wrong).
>>
>> Since we cannot use a cross reference in a toc index, this patch
>> creates an intermediate page for bitbake documentation, and in that
>> page we insert the right link to the bibtake documentation
>> (e.g. :doc:`bitbake:index`) which will be adjusted dynamically based
>> on intersphinx config.
>>
>> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>
> Tested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>


By the way, why don't I see this patch on Patchwork yet?
https://patchwork.openembedded.org/project/docs/patches/

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

