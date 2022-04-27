Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E81DC433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 16:07:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.10326.1651075664174501836
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 09:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=guwcQo98;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2777FFF808;
	Wed, 27 Apr 2022 16:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651075662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gRvgHqj7oNAOqzmWGDorUY/ONf89htvCmJImUO0BvQY=;
	b=guwcQo9871zaAZcsG6EwtHh3ptCrRtjuHW4VMMaxt0DIpm6n448Fbzn/aSWh8TTvGhQexJ
	+jjAHN/rqbXrEwH6eA6UxenVKAy6gWIGxhkCulZCHGyA+Ejw/NfAT2ps8nN5ath06u+kN4
	G4LIUXYS5/EifKR03Aq8Mm8UpDH9HdQdyqhGDIF0A6bo4zSa2nKIl3ufgM9uMDMwP1U/Nq
	jynQTTsLAd62NfJLDX0yrG5ERtoUVzBHKNtddHcEAIGfJBkTrmqfz7+zMW/BBNBAIy1JGX
	6tPXQwojgLAWFIFsXm6dwzc7+UrOrbSlGm81Fn3EtglACzmJ6p7MCy4QrXehcg==
Message-ID: <8e983999-b237-3881-b5af-e7934193b089@bootlin.com>
Date: Wed, 27 Apr 2022 18:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] Sstate cache for version 4.0.999?
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <6c3311c1-801b-b17a-44a1-ca76017e9e94@bootlin.com>
 <f413500a-5a0e-a17c-5dc4-c702fd2ff1aa@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <f413500a-5a0e-a17c-5dc4-c702fd2ff1aa@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 16:07:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2897

Hi Quentin,

On 4/27/22 11:59, Quentin Schulz wrote:
> As a side note, the current default docs being the kirkstone (4.0.999)
> branch is something I deem temporary. The issue is that the migration
> manuals and release notes of kirkstone 4.0 *tag* are not up-to-date.
> The ones in kirkstone branch are up-to-date.


I guess that is what causes the 4.0 documentation to be out of date. For
example, in
https://docs.yoctoproject.org/4.0/migration-guides/migration-4.0.html#release-notes-for-4-0-kirkstone,
there is still the temporary section called "Changes for release notes"
(https://docs.yoctoproject.org/4.0/migration-guides/migration-4.0.html#changes-for-release-notes).

>
> I need to write something on the wiki to explain the issue and
> requirements so we can work on fixing this sooner than later.


Do we need a 4.0 patch for run-docs-build?
Sorry, got lost with all the recent changes.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


