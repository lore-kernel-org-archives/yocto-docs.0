Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1695AC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 11:57:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.11352.1670587050105778873
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 03:57:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O5RinIPm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9428B20007
	for <docs@lists.yoctoproject.org>; Fri,  9 Dec 2022 11:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670587047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BDLGyJtpYtElCHgMkmL02oXeY5u+6R8g4qgHkvdq2Xk=;
	b=O5RinIPmJQK9U5E551hsE+miEQXUAf97ZOpQaczD60YWBu3sCRgxVCNf1NSlpx/vFGBeiC
	cq90SaE0CpVpyWbGCXdbjS0eDRMyhwCw3PxBn8L53ZkYsPAPuEmNkboTU4tJ2heSbfJz3d
	3w1MfaBe32A4I5uZUsFHgWZjDN0aVM9P2L1Bu1G8EDnuesiw0UtGSz4Ck67qBJPgDYkrKK
	LhPpy5dlRNXANkmBTT+N2CQyzCPHtAzNG0Rrq6Ay/F0dvrRH4KxtB5KTQOoDYfJJucpdj4
	c1174yA4I704zaEDah66I17PfEFYMA4MILY7ovOPGUID2heD82wT3ntvXNgPSQ==
Message-ID: <8b825482-2507-b2e1-0bb4-9f74eb0b2a35@bootlin.com>
Date: Fri, 9 Dec 2022 12:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [docs] [PATCH] manuals: fix double colons
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <20221208094158.532375-1-michael.opdenacker@bootlin.com>
 <952ece4b-be2a-dace-6d1b-510c8e863c4c@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <952ece4b-be2a-dace-6d1b-510c8e863c4c@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 11:57:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3535

Hi Quentin,

Am 09.12.22 um 10:57 schrieb Quentin Schulz via lists.yoctoproject.org:
>> -   Although the Minnow Board BSP is unused, the Metadata remains and is
>> -   being used here just as an example.
>> -
>> -::
>> +``yocto-kernel-cache`` (i.e. 
>> ``yocto-kernel-cache/bsp/minnow/minnow.scc``)::
>
> Double space here.


Fixed. Many thanks for the review !
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


