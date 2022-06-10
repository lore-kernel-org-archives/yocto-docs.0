Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F85FC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 14:46:50 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.27886.1654872402237118692
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 07:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mmfZJh9N;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0E387200004;
	Fri, 10 Jun 2022 14:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654872400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bQfdH1hOpj23EK1myxYRxQI82mjKafQnCG9tcxTV5T4=;
	b=mmfZJh9NF4mdigUBOKB+As9o91HEKO58wLAcQzwZbAAwsRPjYJQTtJz1zApdS3xBQTH21p
	zT4QJcCLnsmj9q/TPUiZqE/WUfIJeJ0AJsY5QoiU+iQz1wBFSNCy23kvTNwCHG6nBvXrKk
	eV4KiA/HkF6K8ZOuJ5TdmIwEhu+lqa6isam8I1aIVRzUCQVXGEqFRu0MAofCG6NO80jLz8
	59kWoqdu6sP1lmV/4gcUbnjlJROCRDypvlxQ/36+34OnxYR9j4J8Jnbkx6gJ6PE28MMSPP
	GN9WfYkrVCUIe1cj3zuqNCoURM4pgsaqRuuDGRwOPjWdsRGgF8q+jk4GImsGSQ==
Message-ID: <9b5bd24d-5b93-10b2-78e4-94076ac9aef3@bootlin.com>
Date: Fri, 10 Jun 2022 16:46:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [docs] [PATCH] Revert "docs: conf.py: fix cve extlinks caption
 for sphinx <4.0"
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org
References: <20220610143401.2239827-1-michael.opdenacker@bootlin.com>
 <8bdf4db2-03da-fb6f-a6e6-1c40c7f4e47e@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <8bdf4db2-03da-fb6f-a6e6-1c40c7f4e47e@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jun 2022 14:46:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2980


On 6/10/22 16:41, Quentin Schulz wrote:
> Hi Michael,
>
> On 6/10/22 16:34, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> This reverts commit c9922076f5c1285d9cfd6aff8ce5b6635d88222f,
>> and allows to avoid this new warning which appears with Sphinx 5.0.1:
>>
>> WARNING: extlinks: Sphinx-6.0 will require a caption string to 
>> contain exactly one '%s' and all other '%' need to be escaped as '%%'.
>
> Missing SoB.
>
> In any case, NACK until we use a newer Sphinx for building the docs 
> with the autobuilder (currently 3.2.1) otherwise we get 
> CVE-%s-<CVE_ID> instead of CVE-<CVE_ID>.
>
> We'd need a patch that bumps the minimum version of Sphinx to build 
> the docs (in conf.py, needs_sphinx), revert the patch and use a new 
> docs_buildtools in the autobuilder. Without this you're just fixing 
> your a build issue on your local PC and failing the autobuilder.
>
> We do not have a "stable" release available yet on 
> https://autobuilder.yocto.io/pub/buildtools/ so we'd need to create 
> one. I know Richard made an attempt a few months ago when we added 
> Sphinx recipe inside poky (specifically for creating the docs 
> buildtools).
>
> Nothing impossible, but, today, this patch is doing more harm than good.


Understood, thanks!
Then, I'll disable the turning of warnings into errors on my PC, waiting 
for an upgrade to Sphinx.
Thanks for the quick reply!

I'll file a new bug to keep track of this.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


