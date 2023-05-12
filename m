Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE10AC77B7C
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 08:13:31 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.18902.1683879209896367233
 for <docs@lists.yoctoproject.org>;
 Fri, 12 May 2023 01:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KasdKZDp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 32D30C0002;
	Fri, 12 May 2023 08:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683879208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhiPjCBeF5SCLbPYeYjuN7zTFY5vlXNQ1ZTD7oQhYus=;
	b=KasdKZDpiNKr+eWje+gwapzaddqyoyFJArzozEs2eoNFoyKsw99Cd5lG0DEI4RaUaiPFe/
	PpX/MiJ31rJM64FzHFvvMmBFNEb4DS7yX5pq7JtloXNXqIzW8qBjn+W7Uux+ViuekciORb
	riBUdy2aaFnQfQG4SwX6yM9haFWc8w+egNs/LQ3ia7kONqU+FnNQfJmp4FfanTLjyvdi9h
	VNF5ioGOl20Br3gVKJffXGDx1NIXTvIRCeUJuvIZrPTaXQsaAt1lVevDPZYrxdtATS2fbh
	Pzyl9cUndTo64l8Z/8s/Q43HtrJl/bYB+yO3CUHaD7DYaSMrNfkxTX68Y2o/Nw==
Message-ID: <5a6bbc2e-ab65-933d-080b-7fcb38fc4f79@bootlin.com>
Date: Fri, 12 May 2023 10:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH 2/2] ref-manual: document uboot-sign class and variables
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>
References: <20230511161140.2387483-1-michael.opdenacker@bootlin.com>
 <20230511161140.2387483-2-michael.opdenacker@bootlin.com>
 <ee686b0e-410f-6ff8-2a10-be6fbb6446cc@seco.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <ee686b0e-410f-6ff8-2a10-be6fbb6446cc@seco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 May 2023 08:13:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3935

Hi Sean,

On 11.05.23 at 20:51, Sean Anderson wrote:
>
>> +-  :term:`UBOOT_FIT_GENERATE_KEYS`: allows to generate the keys
>> +   if they don't exist yet.
> Remove the "allows to"


Fixed, thanks

>
>> +-  :term:`UBOOT_FIT_HASH_ALG`: hash algorithm for the FIT image.
>> +-  :term:`UBOOT_FIT_KEY_GENRSA_ARGS`: ``openssl genrsa`` arguments.
>> +-  :term:`UBOOT_FIT_KEY_REQ_ARGS`: ``openssl req`` arguments.
>> +-  :term:`UBOOT_FIT_SIGN_ALG`: signature algorithm for the FIT image.
>> +-  :term:`UBOOT_FIT_SIGN_NUMBITS`: size of the private key for FIT image
>> +   signing.
>> +-  :term:`UBOOT_FIT_KEY_SIGN_PKCS`: format for the public key certificate
>> +   for FIT image signing.
> Maybe "algorithm" instead of "format"? The format stays the same (a
> binary blob), but what's changing is the way the data is interpreted.

Sure, done.

>
>> +-  :term:`UBOOT_FITIMAGE_ENABLE`: enables the generation of a U-Boot FIT image.
> enables -> enable


Good catch. Thanks.
All these fixes are now in master-next.

Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


