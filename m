Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB01CF319D
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 07:15:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.1804.1727853321765541677
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 00:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iGNgrNny;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3E9EC0005;
	Wed,  2 Oct 2024 07:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727853320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30B5AuCt6V1H+23VvFQEj/V/omIpSD7/bEI1Ueomoss=;
	b=iGNgrNnygA4CE9fGYV8HDG+dpqIDRyW7hc5PIuiythGMm90XrPWi3xc83WCzZqG0jt6ZEz
	/pqYs2HzwxLeGWg+kpbv/4wGCfpF/SvD6z+gfR6Z4fdYYtk2ZZEZ8mwCl04pnUhshKrHTc
	Mwk6ucC7tR+5W31/W5mQGq4eYa2/3BNrgsMMjOcKJgUT72a8bmGqMlQOUtUpXyimvT50Lm
	vM+xpKw3c1416tnVpw/YVEyltLgRE9TJh5XyvVdvyuI/kRb4VrLticnIDXkjFZvqcRJHW4
	MHTBNHkvuglf/eDozyQtKkEPBVYIO4ulItgXsMzQTNOu53K33c4YMojfPxCLVQ==
Message-ID: <f00ae092-32d9-40c6-84f3-0da661e34b66@bootlin.com>
Date: Wed, 2 Oct 2024 09:15:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 1/4] migration/release-notes-5.1: document
 oeqa/selftest envvars change
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
References: <20241001172238.2872529-1-yoann.congal@smile.fr>
 <20241001172238.2872529-2-yoann.congal@smile.fr>
Content-Language: en-US
From: Antonin Godard <antonin.godard@bootlin.com>
In-Reply-To: <20241001172238.2872529-2-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 07:15:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5394

Hi Yoann,

> +   For example (taken from :yocto_ab:`autobuilder <>` environment):
> +   :term:``BB_LOGCONFIG`` is set as:

When referring to terms, you should use single-tick, not double,
otherwise it's not parsed correctly and it doesn't create a reference
(treated as code instead).

Cheers,
Antonin

