Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73505C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 16:29:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.343.1634747342184264431
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 09:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5026240002;
	Wed, 20 Oct 2021 16:29:00 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/3] Improve reproducible build documentation
To: Scott Murray <scott.murray@konsulko.com>
References: <20211019141824.1980728-1-michael.opdenacker@bootlin.com>
 <a4697ab-c28-93f7-8479-64b3f21683e@spiteful.org>
 <517a0133-3444-0166-1e80-0242701b1536@bootlin.com>
 <628c71f6-83f5-6fe7-a861-feb09fe8d254@spiteful.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <229c7ef9-966b-ffad-df80-ef49c99e0835@bootlin.com>
Date: Wed, 20 Oct 2021 18:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <628c71f6-83f5-6fe7-a861-feb09fe8d254@spiteful.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Oct 2021 16:29:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2011

Hi Scott,

On 10/19/21 10:10 PM, Scott Murray wrote:
> Just one note, the SOURCE_DATE_EPOCH piece of patch 2 is still applicable,
> and definitely should go into master.


Done, merged into master-next.
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


