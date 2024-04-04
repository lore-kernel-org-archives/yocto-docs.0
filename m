Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBF6CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 14:41:14 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.39854.1712241667171581793
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 07:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KOqzjTZV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F412160013;
	Thu,  4 Apr 2024 14:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712241665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPt/zL15eWXA9e07ESQx57v+9xRSdHwQI3bCRCytT8A=;
	b=KOqzjTZVxqd+rLQ7/U0J3b6kf34Sj1OruLMf97Y78px+tcHEn0IM9jUP4UIQ3Omr4Gn8BJ
	ka375H5b+k0HVOrrTZYOk4bted3xxPvtLMTenmPx2zZusCC1DFcYJSCe/h0L/d0l4GsNNc
	HyXcunkdOWy0O+53qzoBuslItvhWEzkFrKkJMZ6sN7Q4BZSia8WlJ5WlO6EcPrfCNIrfAw
	YKQNzCq6kcmde2p3Hh6/pL53js1c2tSd+lc6w8PTWbY9rb6VZXjb0BjMjRbZ2ZgenJd+br
	SS26UCcJoQtLOc4jygvZNUfBRuGv7n4npBftf1pJdgYltyiCsCrHiivMQV3AWA==
Message-ID: <d47dac67-5e1f-45ad-820e-72944b31e817@bootlin.com>
Date: Thu, 4 Apr 2024 16:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v1 0/5] Update migration-guides and release-notes
To: joaomarcos.costa@bootlin.com
References: <20240403143724.1956838-1-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240403143724.1956838-1-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Apr 2024 14:41:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5056

Hi João

On 4/3/24 at 16:37, Joao Marcos Costa via lists.yoctoproject.org wrote:
> Hello,
>
> I started inspecting the changes since Nanbield to come out with a bit of
> documentation for the upcoming release. Here are my first writings, and I count
> on doing some more, as WIC enhancements, testing and scripts' enhancements, Go
> language, etc.
>
> Best regards,
>
> Joao Marcos Costa (5):
>    migration-guides: list removed recipes
>    migration-guides: leave Removed classes empty
>    migration-guides: leave Deprecated variables empty
>    migration-guides: list systemd changes
>    release-notes: list systemd changes
>
>   documentation/migration-guides/migration-5.0.rst  | 15 +++++++++++++--
>   .../migration-guides/release-notes-5.0.rst        | 11 +++++++++++
>   2 files changed, 24 insertions(+), 2 deletions(-)


Thanks for these updates!
After fixing your author identity, everything is fine.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.

To other contributors, more notes are welcome, if possible against the 
"master-next" branch to have the latest changes.
Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


