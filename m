Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE7EC4332F
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 16:03:20 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.10080.1634745798457606200
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 09:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 262A320000C;
	Wed, 20 Oct 2021 16:03:15 +0000 (UTC)
Subject: Re: [docs] [PATCH] manuals: rename "devpyshell" to "pydevshell"
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20211018151042.22885-1-michael.opdenacker@bootlin.com>
 <a484a4c92e1e396aadd91efdc29a36c55c79ae01.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9265c0aa-3d3b-cd32-1a42-945e1f41e4c3@bootlin.com>
Date: Wed, 20 Oct 2021 18:03:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <a484a4c92e1e396aadd91efdc29a36c55c79ae01.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Oct 2021 16:03:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2010


On 10/18/21 5:14 PM, Richard Purdie wrote:
> On Mon, 2021-10-18 at 17:10 +0200, Michael Opdenacker wrote:
>> This addresses [YOCTO #14531] after the "devpyshell" task was renamed
>> to "pydevshell" in OE core.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  documentation/dev-manual/common-tasks.rst | 12 ++++++------
>>  documentation/ref-manual/tasks.rst        |  8 ++++----
>>  2 files changed, 10 insertions(+), 10 deletions(-)
> Keep in mind we need to be a little careful here. We need to merge the migration
> guide to master and honister but this should only be to master.


Thanks. Merged into "master-next" only.
Michael

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


