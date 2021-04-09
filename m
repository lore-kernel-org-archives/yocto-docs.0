Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.5522.1617951824687223792
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Apr 2021 00:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0FEE0240002;
	Fri,  9 Apr 2021 07:03:41 +0000 (UTC)
Subject: Re: [docs] [PATCH] docs: add a top level page for bitbake documentation
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 docs@lists.yoctoproject.org
References: <20210407163506.148438-1-nicolas.dechesne@linaro.org>
 <1673D39EEB18536F.6806@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <a248c2e9-e4da-d60b-ca1e-231d11751639@bootlin.com>
Date: Fri, 9 Apr 2021 09:03:41 +0200
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


Pushed to the "master-next" branch.

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

