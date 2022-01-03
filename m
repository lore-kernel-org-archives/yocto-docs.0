Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1D7C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 15:17:04 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.28798.1641223023207629001
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 07:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 729C31C000B
	for <docs@lists.yoctoproject.org>; Mon,  3 Jan 2022 15:17:01 +0000 (UTC)
Subject: Re: [docs] [PATCH] overview-manual: add details about hash
 equivalence
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
References: <16C19A718ADC2220.17299@lists.yoctoproject.org>
 <16C19A96C9FA3638.23092@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <9c2c9869-93cd-69d8-2ddb-302622a9ecae@bootlin.com>
Date: Mon, 3 Jan 2022 16:17:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16C19A96C9FA3638.23092@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Jan 2022 15:17:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2334


On 12/17/21 6:21 PM, Michael Opdenacker wrote:
> On 12/17/21 6:18 PM, Michael Opdenacker wrote:
>> +-  :term:`bitbake:BB_HASHSERVE`, specifying a local or remote Hash
>> +   Equivalence server to use.
>> +
>> +-  ``BB_HASHSERVE_UPSTREAM``, when ``BB_HASHSERVE = "auto"``,
>> +   allowing to connect the local server to an upstream one.
>
> A V2 of this patch will be sent when my patch to document
> BB_HASHSERVE_UPSTREAM is accepted in BitBake. I will add a proper
> reference to this variable then.

Eventually, since this was a small change to add a reference to
BB_HASHSERVE_UPSTREAM now documented in BitBake's manual, I just made
the update and merged the whole changes in master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


