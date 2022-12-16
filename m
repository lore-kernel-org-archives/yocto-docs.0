Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EFFC4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 10:14:43 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.9823.1671185681415377562
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Dec 2022 02:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jYqCXX3c;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6729C10000E
	for <docs@lists.yoctoproject.org>; Fri, 16 Dec 2022 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671185679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nS2r01RTboJ8IaDDfDsl9s9BHWGLwxL6o4hH8Q9oNow=;
	b=jYqCXX3cRfRkd5UPz5KXtE7MTVHqPr3H7q9aaXw2z56wf7GozKpYFC+vm+HrjG1zwfwFZd
	sUvzCtpH2Ddfcp/+iBBC473eAYtZUwS+iooQq+JmG1youTL3wNnMSfvcz+vRV9fzAqu1Rl
	eJQ7oGifMuRQG4kYpYQgc0gPSeov6ByjZYRGxWEzzOGyzOqXSUVEh6GblLQ4EqtJley63m
	aiRz/5vc35WtUB0SMr9YZycy3Znhyt2ctvzIaw3+SgESQIE9lNup0/uN9KoKfVQWsb6Hw9
	dHy4Z3HhVNHbc41tbkdmc9FAK/BC2/GbIgggIxjjYizc+iwQ4ytloilDm5hUuQ==
Message-ID: <8568a5cb-2876-31c5-66f7-12a9798e3ece@bootlin.com>
Date: Fri, 16 Dec 2022 11:14:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [docs] [PATCH] manuals: prepare 4.2 migration notes
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <17313E6A6BB20DCA.6819@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <17313E6A6BB20DCA.6819@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 Dec 2022 10:14:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3557

Greetings,

Am 16.12.22 um 11:12 schrieb Michael Opdenacker via lists.yoctoproject.org:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/migration-guides/index.rst      |  1 +
>   .../migration-guides/migration-4.2.rst        | 48 +++++++++++++++++++
>   .../migration-guides/release-4.2.rst          |  9 ++++
>   .../migration-guides/release-notes-4.2.rst    | 28 +++++++++++
>   4 files changed, 86 insertions(+)
>   create mode 100644 documentation/migration-guides/migration-4.2.rst
>   create mode 100644 documentation/migration-guides/release-4.2.rst
>   create mode 100644 documentation/migration-guides/release-notes-4.2.rst


Of course, this is a very early version of the migration notes, to allow 
you to contribute to such notes.
Thanks in advance :)

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


