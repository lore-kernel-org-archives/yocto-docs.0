Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF319C433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 19:00:39 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.10921.1641582038838097997
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Jan 2022 11:00:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0D5F1E000A
	for <docs@lists.yoctoproject.org>; Fri,  7 Jan 2022 19:00:36 +0000 (UTC)
Subject: Re: [docs] [PATCH V2] overview-manual: document hash equivalence
To: docs@lists.yoctoproject.org
References: <16C811E821D97886.9212@lists.yoctoproject.org>
 <16C811FB08B20A3C.11018@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <6edf2c0f-ce19-a6a3-4ff1-9872e6ee9e97@bootlin.com>
Date: Fri, 7 Jan 2022 20:00:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16C811FB08B20A3C.11018@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Jan 2022 19:00:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2358


On 1/7/22 7:57 PM, Michael Opdenacker wrote:


Here's the part that I updated thanks to RP's feedback...

> +
> +Now, imagine that a Shared State task is modified because of a change in
> +its code or metadata, or because of a change in its dependencies.
> +Since this modifies its task hash, this task will need re-executing.
> +Its output hash will therefore be computed again.
> +
> +Then, the new mapping between the new task hash and its output hash
> +will be reported to the Hash Equivalence server. The server will
> +let BitBake know whether this output hash is the same as a previously
> +reported output hash, for a different task hash.
> +
> +If the output hash is reported to be different, BitBake will update
> +the task's unihash, causing the task hash of depending tasks to be
> +modified too, and making such tasks re-execute. This change is
> +propagating to the depending tasks.
> +
> +On the contrary, if the output hash is reported to be identical
> +to the previously recorded output hash, BitBake will keep the
> +task's unihash unmodified. Thanks to this, the depending tasks
> +will keep the same task hash, and won't need re-executing. The
> +change is not propagating to the depending tasks.
> +
> +To summarize, when Hash Equivalence is enabled,
> +a change in one of the tasks in BitBake's run queue
> +doesn't have to propagate to all the downstream tasks that depend on the output
> +of this task, causing a full rebuild of such tasks, and so on with the next
> +depending tasks. Instead, BitBake can safely retrieve all the downstream
> +task output from the Shared State Cache.

I realized that my previous explanations were assuming the modified task
output was identical to the last generated output. Actually, any
previously recorded output is fine, and can be retrieved from sstate.

Thanks in advance for your reviews!

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


