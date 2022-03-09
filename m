Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AC1C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:28:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.2358.1646843290978772365
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 08:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E5F6d9bO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0DC971BF20E
	for <docs@lists.yoctoproject.org>; Wed,  9 Mar 2022 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646843289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5IKG4dNWZsT2xR4tSkVfbEshapGymgjOhkJa2aPvxvI=;
	b=E5F6d9bORDxp72R9JsMiBPNVS0n5t/f87SelG1xk6H20CBQc4qezn5fjD4DH9Bj5M7itr/
	Vgetih/go7V7vzUTK5RoQ0gz/OZSQaFfKZNFrrUb3czv28U8ZW9Wckb/ow/TDCz6IriAbm
	D3e8lmo/OqVnGZPn3eyTNp2g7gctOwY7bMK/QDt4jdCxICUdfg/EDg/V9LAHN1qrDWuz8m
	Ho2Op9anlu3KrWcqXn0f+Ty5RymK64STPIuzt3ZZNSAexniKR8QIzonCO+ZY+4PScE844I
	f9Y7UMv3MA3XlqIle1oYp4OX37UsjpabwF8OW7vtMI1Qv3UcRcgvhLRA7YZr/A==
Message-ID: <55dd2336-d130-7388-6d01-d53ba90bbdfe@bootlin.com>
Date: Wed, 9 Mar 2022 17:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] documentation/REAMDE: correct heading styles
 actually used in the YP manuals
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <16DAC30B84DC9455.3999@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <16DAC30B84DC9455.3999@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Mar 2022 16:28:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2561


On 3/9/22 17:24, Michael Opdenacker via lists.yoctoproject.org wrote:
> Sphinx seems to offer flexibility in heading styles definitions,
> but the new text matches the way subsubsections and subsubsubsections
> are defined in the current manuals.
>
> Note that it's not possible to mix different definitions, for example
> by using "~~~~" and "^^^^" for subsubsections in different places.

Sorry, saw the typo in the commit title. Fixed.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


