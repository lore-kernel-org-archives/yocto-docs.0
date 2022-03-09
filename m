Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D353FC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:07:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.2103.1646842036338158988
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 08:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YeuVnxju;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 07634E000C
	for <docs@lists.yoctoproject.org>; Wed,  9 Mar 2022 16:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646842034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dgAeE3siNKf5UN2yREGn2YbiLTka10PWBoy/snqr7qg=;
	b=YeuVnxjuRRW02V3cAbTrLJ6ICfW2xnzIWFTi1X34LCA+R71A9OikDS1oVp/+ry3KVZJqtM
	nmpKyH1rVT1JS0Dt5smb5zQaWtmVUoLBI/T256jwouXUsQU4B/XwRvSDZRamkA7EflMXur
	1HaT7siL7BgVNOLHdCp84xT6TfRf4Ncoa34IYjefYE7smyLh8/Y6SqbSZhizqaHAUKsOxa
	EO8pF7pLbVwhvQJB3WMJ3a2gsgEMqQfKGAy40j7kbewlb32ErVa5jUOgd81++eNT/HLG4U
	6isLxhQoSSymoLh9Y1TTDFkaehX0TsqmK/9mfLZi7OWfRvfn6bBCTP6vYGJPLQ==
Message-ID: <b5d41edc-ecd5-cfa7-6d82-84b55562c0de@bootlin.com>
Date: Wed, 9 Mar 2022 17:07:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] dev-manual: details about using firewalls and
 limiting fetch threads
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <16DAC1DDB138F9B8.28771@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <16DAC1DDB138F9B8.28771@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Mar 2022 16:07:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2559


On 3/9/22 17:02, Michael Opdenacker via lists.yoctoproject.org wrote:
> Fixes [YOCTO #13235]
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 1caf953901..609e38cbcd 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -1481,6 +1481,24 @@ compressed suffixes such as ``diff.gz`` and ``patch.bz2``, for example.
>  The build system automatically applies patches as described in the
>  ":ref:`dev-manual/common-tasks:patching code`" section.
>  
> +Fetching Code Through Firewalls
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Some users are behind firewalls and need to fetch code through a proxy.
> +See the ":doc:`/ref-manual/faq`" chapter for advice.


By the way, I'm not happy with the fact that proxy usage is just
documented in the FAQ. My plans are to expand this subsection to detail
them here, but I cannot do everything at once :)

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


