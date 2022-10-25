Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95300FA373E
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 08:00:57 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.4549.1666684854463985922
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 01:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mOloBBvG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1C283FF81F;
	Tue, 25 Oct 2022 08:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666684852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mscn1FaN37UwlArLdaVVM5SDAOSmAIQdH8DKQdywNw0=;
	b=mOloBBvGTix0zqr32NEUkFZSauJ6+48eFNA9WwSsetL+N9P8A4ZKfFvO1x3aIPtzf6yJSl
	W7F18eYMmuDKP8A4JHYG55oyZkrz40WUB8OPr+B900YlvQzSzM74LjkefQm/KcTQB59/xm
	mCNNY5wUluyHtLmLer3yG0n8Qpc/aeor6L/M3xs9+hFjHsdGK+NhkKFISuYpBgYAnGTxuw
	4trid6Ew+Gth9y884atbhAbtsGmRAeb5lJvkmkr2efGszaWwaXdlRAcGFh8eZgYCTKsmfv
	81SeLaAXUkJp7N7EX3CCEIlI/DaJgYOWfvg+oT96thhihrzubCBIQu6lS47MCA==
Message-ID: <6c3c7a21-fb9b-7d5c-f0ff-14c74f2f349b@bootlin.com>
Date: Tue, 25 Oct 2022 10:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides/release-notes-4.1.rst: update
 Repositories / Downloads
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20221025000953.2170782-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221025000953.2170782-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Oct 2022 08:00:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3397

Hi Lee

On 10/25/22 02:09, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-notes-4.1.rst    | 56 +++++++++++++++++++
>   1 file changed, 56 insertions(+)


Many thanks for this update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into the "langdale" and "master-next" branches.

Now I need to figure out / remember how to get the "langdale" branch 
built on the website (https://docs.yoctoproject.org).

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


