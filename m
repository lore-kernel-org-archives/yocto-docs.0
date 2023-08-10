Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE91AC001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 07:36:04 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12315.1691652962336750115
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Aug 2023 00:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U77RVLGu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C9041C0002;
	Thu, 10 Aug 2023 07:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691652960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BvQSn+jaZ4QvP8VSiAzvvfLSxazFspHgbT86IW+AKpE=;
	b=U77RVLGukeTjcCUljf8iLDxNXICvfBgz7OJSsTsgy/jdoWAa2061LX6VqQbX1CkzvagaMf
	jFfCxx3McfyhaR1QRGIlIhGO7RZPI+XfspiaPiMNiGzb1SQf5hcw88FPFlTdjf25AV7hFS
	8qoipLXPMz4MD+Jbav7x7llyp0geBFHRR/0dtbNMaRnzOXIvPvI6DLiAkVhr/TinIA+vcj
	sph2SkqwOnfmuBVR5qHlW44zT3gRTpCspCfCBFmw1LYCFFx7GLsNskx37wnYK1Zqe+dpBg
	ENCG/e9a0LThIYL+UFXXiNUktR4MLIVyqvG0deHQDv/qgIrmXfI3d2hcbnd4GQ==
Message-ID: <8918ec33-190f-a1b2-49bd-74d506a305c7@bootlin.com>
Date: Thu, 10 Aug 2023 09:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: wic.rst: Update native tools build
 command
Content-Language: en-US
To: Daniel Semkowicz <dse@thaumatec.com>
References: <20230808084945.24457-1-dse@thaumatec.com>
 <7f67ee29-7ceb-47cb-ae98-034ba3c19407@bootlin.com>
 <CAHgnY3=qP-mX2dbe+T5i3iZnL188HZCHy7B8DPDy=3esZvP-tA@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAHgnY3=qP-mX2dbe+T5i3iZnL188HZCHy7B8DPDy=3esZvP-tA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Aug 2023 07:36:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4128

Hi Daniel,

On 10.08.23 at 09:01, Daniel Semkowicz wrote:
>
> For sure, it also applies to Kirkstone.
> I was not testing with Mickledore, but if this problem was already
> present in Kirkstone, then I would be surprised if on Mickledore
> it works correctly.


Right, thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


