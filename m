Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C83C433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 17:21:51 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.8974.1639761711063794521
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Dec 2021 09:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4832010000E
	for <docs@lists.yoctoproject.org>; Fri, 17 Dec 2021 17:21:49 +0000 (UTC)
Subject: Re: [docs] [PATCH] overview-manual: add details about hash
 equivalence
To: docs@lists.yoctoproject.org
References: <16C19A718ADC2220.17299@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <25f448d7-22aa-2df4-ab48-fed4dc40ab17@bootlin.com>
Date: Fri, 17 Dec 2021 18:21:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16C19A718ADC2220.17299@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Dec 2021 17:21:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2312


On 12/17/21 6:18 PM, Michael Opdenacker wrote:
> +-  :term:`bitbake:BB_HASHSERVE`, specifying a local or remote Hash
> +   Equivalence server to use.
> +
> +-  ``BB_HASHSERVE_UPSTREAM``, when ``BB_HASHSERVE = "auto"``,
> +   allowing to connect the local server to an upstream one.


A V2 of this patch will be sent when my patch to document
BB_HASHSERVE_UPSTREAM is accepted in BitBake. I will add a proper
reference to this variable then.

Thanks in advance for your reviews.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


