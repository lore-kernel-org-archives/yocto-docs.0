Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C14DC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 16:46:38 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.1799.1704732394691162426
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jan 2024 08:46:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FMMox9/5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89BD91C0008;
	Mon,  8 Jan 2024 16:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704732392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+raFZfeHysgfo4OY3VXt52ZcUUpnRASeW0x/pa6DpcQ=;
	b=FMMox9/5jhbeQlOFdhyzSC+Q2EssRTzPoKBsm2z6jihuqjmtA/bZCZX4O+ok2k2aj1KHOG
	WrRCyGeFv9SbdOcv/mIuXwGVlV9f0D49yfd2Y9WpcJ5NVcWqdefZ8Jw5fDG8vHOy/BFFwC
	qiOqJx9mGFnmS50zNl1ynTZ7V8Cn3xim3wf6RR5Hp6/gAaULQNDMjwvRFAb/J47F8g7CG4
	5ec4Tj4kdAne/i5GS6jZBpp+bwpe/MV+gp7kg1dE1hWL+s+EEQ8Ku5aJnS3cc9qKGph/FH
	4uhOIFZQjU1KnH9jtW8ZZeUtQ0Evx+ITY0q4i3iscF0c0ZQ+apRBFVk9TSvcQw==
Message-ID: <7c60e04d-7d44-4ef4-b137-7d2a08afad27@bootlin.com>
Date: Mon, 8 Jan 2024 17:46:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: document VSCode extension
Content-Language: en-US
To: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
References: <20240102110932.42188-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240102110932.42188-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Jan 2024 16:46:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4749

Hi Enguerrand

On 02.01.24 at 12:09, Enguerrand de Ribaucourt wrote:
> The VSCode extension is now officially maintained and published by the
> Yocto Project so it should be referenced in the manuals to help users
> discover it.
>
> I located the most relevant places to reference the extension by looking
> at how the old Eclipse plugin was documented in the 2.6 manuals as well
> as the current Toaster references.
>
> Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

Many thanks for this update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Applied to master-next, and to be merged soon in master.

I'd also like to backport to other (supported) release branches. Is the 
extension compatible with any version?
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


