Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61BBC4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 16:37:12 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.20085.1706805425580879161
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 08:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ouR6ngCv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFAC12000C;
	Thu,  1 Feb 2024 16:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706805423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZDXyJ4Qkrm4uznl/nCsOhxiQwvUhxis/hWKrGMaKNU=;
	b=ouR6ngCvzW43KrXX1ACUROnfjrJRI3A3hPzom6yHHk4gcph/prSFB296/wRBoEs3dleMHm
	Pkc/WfwtMGeaK4eSDSuzmZUstnwq/3lZZ7sfts7aVGDv8YGzWRFbjxwBRAjA4PLKUg8Qku
	QIuSGudFY/i2Z8mlL1vbCCN3jTUfmnzL8zH9qQ60Z3301dPFRJ619C5aZn3wVGWrCEF31T
	sQfp2buA0GfbXQif/dlFgI9PWk+cz8a3QVpUECmrofP2eqFHscjsXRmvDiVzGMbTAU3qU6
	kgLNJV231EfPNJjGrii+QQiwgKlCbWxoxdpapSCuPk1bN/5bqQ1bdE71Hk/Epg==
Message-ID: <4b38d1ff-aed4-46bb-8174-7739283eddfc@bootlin.com>
Date: Thu, 1 Feb 2024 17:37:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] Possibility to use 'noindex' or rel="canonical" to stop
 Google from indexing old versions of documentation?
Content-Language: en-US
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Michael Halstead <mhalstead@linuxfoundation.org>
References: <DM8PR12MB5430C1F3DF524811569BF9A08B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
 <df129fbff9b6a2c77be7354b302307e7b67ce806.camel@linuxfoundation.org>
 <DM8PR12MB5430B9DFA3D7B1DABD0C4EE28B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
 <17AEEAA999A6674A.16647@lists.yoctoproject.org>
 <6c7033a2-1215-49d2-8624-a79274953244@bootlin.com>
 <DM8PR12MB5430164F89E5CD002A55C5DF8B7D2@DM8PR12MB5430.namprd12.prod.outlook.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <DM8PR12MB5430164F89E5CD002A55C5DF8B7D2@DM8PR12MB5430.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 01 Feb 2024 16:37:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4804

Hi Chris

On 1/30/24 at 22:04, chris.laplante@agilent.com wrote:
> Hi Michael,
>
>> Another idea was to dynamically modify HTML directly from sphinx-
>> static/switchers.js, as we do to warn about documentation for outdated
>> releases. This way, we could leverage the existing logic.
>> However, I'm reading that the web crawlers probably won't apply the JS code
>> and just read the original HTML...
> I found at least one reference in Google documentation suggesting this should work: https://developers.google.com/search/docs/crawling-indexing/javascript/javascript-seo-basics#avoid-soft-404s.
>
> I think it's definitely worth a shot.


Thanks for this useful reference. If Google says this, it's worth trying 
and it should be quite easy to add to our existing 
sphinx-static/switchers.js code.
Cheers
Michael.

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


