Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646B7C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 19:19:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.1174.1642619981956797387
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 11:19:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 584A1E0005
	for <docs@lists.yoctoproject.org>; Wed, 19 Jan 2022 19:19:39 +0000 (UTC)
Subject: Re: [docs] [PATCH] manuals: add 3.4 and 3.4.1 release notes after
 migration information
To: docs@lists.yoctoproject.org
References: <16CBC19CDCE903A8.406@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <e47b6364-408f-eafc-2eb3-0610c060d516@bootlin.com>
Date: Wed, 19 Jan 2022 20:19:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16CBC19CDCE903A8.406@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Jan 2022 19:19:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2430


On 1/19/22 8:09 PM, Michael Opdenacker wrote:
> Only done for release 3.4 and 3.4.1 so far.
> Release notes are kept under the migration-guides/ directory for
> the moment, for easier reviewing.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>


See the resulting HTML on
https://bootlin.com/~mike/pub/yocto-project/docs-2021-01-19/migration-guides/migration-3.4.html

I really need your feedback on the way the notes are laid out. This is a
good time to review what we put in our release notes. Here are questions...

  * Are the repository links really important? Could we simplify them?
    Could we just have the Poky details and downloads?
  * Do we really want to have lists of commits? Wouldn't a link to the
    corresponding git tag be enough? If so, we may need to add links to
    them, but that's going to be very verbose in the source code.
  * Are these really notes clear enough and are the main points
    highlighted well enough?

Once we agree on the contents, I'll be able to migrate older release
notes and also update the scripts that generate the corresponding content.

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


