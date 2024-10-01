Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97508CE7CFB
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 09:25:18 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.76867.1727774709235645517
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 02:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C6MyRcp4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF07C240004;
	Tue,  1 Oct 2024 09:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727774707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hr3itDWbWcYc30IXxhuFI0F7+NCbfPz/eye836RH8UQ=;
	b=C6MyRcp4yPJexF12MZy96e6Jf5RwE19ZIHqeAJINkjsffFtrXe5i8l2+dGn7FoZ26sb3x8
	w4y5vPMM+1lZ52xLRl7pygzqfDMa9cZtrR0dDy5RnOpUxD9ZZUUzsVkJ2kPXJX7t5kXvHQ
	86wZ0mF42d4Rc6wlvhXECadu7IQb2X07xuTJJxvZGKhapA/qtAQEfM46IDQD/LJw13mqy3
	MV52+arsakNYzT3noCsBkZRKNNE71DLqNUKDHPdp3jfZcBT90aSfUQOLy2FKJXS44MMye8
	s1t3Rfj+Q+bb4fONRh9Y5mO1nUdgGlEa1+XibqhjJYBdjQ7fLdEju65pnc8XFg==
Message-ID: <d6bbd990-3dfa-4236-8010-5f87a8492acc@bootlin.com>
Date: Tue, 1 Oct 2024 11:25:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 0/4] Document my team's commits for 5.1
To: yoann.congal@smile.fr
References: <20240927220033.3941455-1-yoann.congal@smile.fr>
Content-Language: en-US
Cc: docs@lists.yoctoproject.org, Quentin Schulz <quentin.schulz@cherry.de>
From: Antonin Godard <antonin.godard@bootlin.com>
In-Reply-To: <20240927220033.3941455-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 09:25:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5383

Hi Yoann,

On 28/09/2024 00:00, Yoann Congal via lists.yoctoproject.org wrote:
> This series should cover theses patches:
> 61186bc98a5 (oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir, 2024-09-10)
> a19bb8c1d51 (spirv-tools: Update merged patch to backport status, 2024-09-05)
> c01e633ab91 (python3-libarchive-c: add ptest, 2024-08-02)
> 47ed8ac83a6 (spirv-tools: Fix git-describe related reproducibility, 2024-08-03)
> d85a10e4985 (insane: skip unimplemented-ptest checks if disabled, 2024-07-10)
> c45d45422d6 (Revert "insane: skip unimplemented-ptest on S=WORKDIR recipes", 2024-07-09)
> 0df9d22928c (recipe style guide: add recommendation for patches without signature, 2024-06-06)
> 8fc967d0c7d (migration-5.1: add the recommended pattern for S/UNPACKDIR definition, 2024-05-28)
> 268dfbd9491 (Revert "oeqa/selftest/devtool: fix test_devtool_add_git_style2", 2024-04-26)
> 3c05286fa10 (oeqa/selftest/devtool: fix _test_devtool_add_git_url, 2024-04-26)
> 
> (Not every commit was documentation worthy)
> 
> v1->v2: Reviews from Quentin Schulz, thanks!
> 
> Yoann Congal (4):
>    migration/release-notes-5.1: document oeqa/selftest envvars change
>    release-notes-5.1: document added python3-libarchive-c ptest
>    release-notes-5.1: document fixed _test_devtool_add_git_url test
>    release-notes-5.1: document spirv-tools reproducibility
> 
>   documentation/migration-guides/migration-5.1.rst  | 15 +++++++++++++++
>   .../migration-guides/release-notes-5.1.rst        |  8 ++++++++
>   2 files changed, 23 insertions(+)

Thank you for these patches, I am ok by this version of the series too! 
Quentin can also review your v2 if he has time to.

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Cheers,
Antonin

