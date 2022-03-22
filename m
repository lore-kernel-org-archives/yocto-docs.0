Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FA6C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 14:10:52 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.10239.1647958250685843331
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 07:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HxbEjATd;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A65A7240017;
	Tue, 22 Mar 2022 14:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647958249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YzZvj4y50WhkqFXuEqa0dshXhBJvnXidAn53PSHfoFw=;
	b=HxbEjATdJUhwRPNDCcUc6Ot8f2R5NAkrUyAK01VINRq1dOmshGtCd2bZlyjz/rv9nxZTJ7
	YqvOuzm2bZeuJsZaWvY/jLfAdgf5FQCYH/BEmHDJMFDKLxzWHlTH3ijffnxXcsLz6yXmVf
	lfq7ar07TtsDGl4TdzhK9PySaPqpq64Iu3Zo+SYPGrPTO7zi8bt1qZrfaqiaT6W6QZaf8H
	tInaVmroIb+eAwGD9lzDwQc5OvjSml1K/aeUfFwFC+E/FLklFKKBEYSbBVcd46BQU35co3
	VkXa+ImVI6BptWRLTXedzo338PLGWFzbNq19AO+bU3cyek793MlBFu30OFALNg==
Message-ID: <722ebaa8-4b37-b013-f826-d64a0b10478e@bootlin.com>
Date: Tue, 22 Mar 2022 15:10:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [honister][PATCH] documentation: prepare for 3.4.3 release
Content-Language: en-US
To: Anuj Mittal <anuj.mittal@intel.com>, docs@lists.yoctoproject.org
References: <20220322005811.10112-1-anuj.mittal@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220322005811.10112-1-anuj.mittal@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Mar 2022 14:10:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2679

Hi Anuj


On 3/22/22 01:58, Anuj Mittal wrote:
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  documentation/conf.py      | 2 +-
>  documentation/poky.yaml    | 8 ++++----
>  documentation/releases.rst | 1 +
>  3 files changed, 6 insertions(+), 5 deletions(-)

Thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

... and merged into the "honister" branch.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


