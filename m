Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E1FC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 15:18:16 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.33179.1641827895828256092
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 07:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 7F8C21BF211;
	Mon, 10 Jan 2022 15:18:13 +0000 (UTC)
Subject: Re: [docs] [PATCHv3] ref-manual: Add documentation of
 PACKAGE_DEBUG_FILE_SUFFIX
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <20220107170433.1958-1-pkj@axis.com>
 <cd2aa2b1-7de3-aadb-bdb9-9471fab1f62b@bootlin.com>
 <1057c8a51923484cb72ca4fc813d68c1@axis.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <f15b0092-5311-e8a6-6fe1-e7ee0c191674@bootlin.com>
Date: Mon, 10 Jan 2022 16:18:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1057c8a51923484cb72ca4fc813d68c1@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Jan 2022 15:18:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2369


On 1/10/22 3:52 PM, Peter Kjellerstedt wrote:
>
> Just be aware that it still hasn't made it into meta...


Oops, I removed it from master-next then.
Just keep me posted when the corresponding patch is merged.
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


