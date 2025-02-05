Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C650AC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 15:55:28 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web11.15596.1738770924123505658
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 07:55:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=sHVSAwKe;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1tfhkI-0000fw-Da; Wed, 05 Feb 2025 10:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:References:In-Reply-To:Subject:To:
	From; bh=urxE/W2yelXxk7N27VYwccWvDhHKTUzO8w4y7V9aToU=; b=sHVSAwKeBd9Y0XY9o7PW
	J05HsKHcO/k5DHZs9tUEnR3BTnLcRcOQk6UC3rPesbXSEDZK3c3Wjsd6POXP0oGEklzg3JiI1HLSZ
	7+Rgj+f8ppprXhuIfV1VWa0ee3ebbq2G03GmFYP2OmmlQ/9sBFRIGP1Wx9yP7vwRWov2s6qj+2joG
	n55Lw1cHlSyhbc6UPnR1UL7DYIlkusw+cUPhAXP8HdImnO1paglMXFg5HEt8dwxd5t86VhJZ4VMAU
	g5eBJPUwau9JzbiRAISWDpLgaJJUQ7QVshovTs8ztwVqfmACf5/vZiJu400QYWMBkOBqrtTLqUnSv
	bcMS3rQ1XT1lDA==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: "Antonin Godard" <antonin.godard@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [docs] [PATCH] profile-manual: Document the
 PACKAGE_KEEP_SECTIONS variable.
In-Reply-To: <D7JQGIAQI3Y6.1R8JC18KMKFLQ@bootlin.com> (Antonin Godard's
	message of "Tue, 04 Feb 2025 15:32:20 +0100")
References: <20250204102847.27201-1-othacehe@gnu.org>
	<D7JQGIAQI3Y6.1R8JC18KMKFLQ@bootlin.com>
Date: Wed, 05 Feb 2025 16:55:28 +0100
Message-ID: <87zfj0perz.fsf@gnu.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Feb 2025 15:55:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6254


Hello Antonin,

> because PACKAGE_KEEP_SECTIONS is not documented in ref-manual/variables.rst.
> Hence, you cannot make a reference (with :term:) to it.
>
> Could you add documentation for this variable there?

Thanks for having a look! I just sent a v2 that is fixing this issue and
also proposing a more complete picture on the use of the
PACKAGE_KEEP_SECTIONS variable.

That was suggested by Alexander here:
https://lists.openembedded.org/g/openembedded-core/message/210819

Thanks,

Mathieu


