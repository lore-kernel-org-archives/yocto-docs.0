Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91452C433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 17:24:52 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.12054.1637342691596956131
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 09:24:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DC31F240006
	for <docs@lists.yoctoproject.org>; Fri, 19 Nov 2021 17:24:49 +0000 (UTC)
Subject: Re: [docs] [PATCH] [honister] ref-manual: drop support for Ubuntu
 16.04
To: docs@lists.yoctoproject.org
References: <16B8F9CBFB89646A.995@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <5f094760-59b7-bf90-300d-9594595b2870@bootlin.com>
Date: Fri, 19 Nov 2021 18:24:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16B8F9CBFB89646A.995@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Nov 2021 17:24:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2170


On 11/19/21 3:45 PM, Michael Opdenacker wrote:
> There are no more free updates to Ubuntu 16.04
> We can no longer test the latest updates to this distro.


Dropping this patch. I'm proposing a more complete update of system
requirements in a single commit.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


