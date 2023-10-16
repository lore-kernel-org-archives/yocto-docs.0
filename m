Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89267CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 13:29:50 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.124145.1697462985817527618
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 06:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pPXhV2wk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86A281BF337;
	Mon, 16 Oct 2023 13:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697462983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5hKnK+8wYYIz3ifV4GU9m9Zt4+zuriu/9o7H9aCEUZQ=;
	b=pPXhV2wkJNaJkYYqdK/9EQXHPlihHCjvLLvTPN5wZ/IZlD9oDCk4WrLG1TM9FPo4JUelSW
	f8TSlaXNONuRR5YaN60CiSF9Rvoax6dYhOaRQ1ucMa5I86xaGWPI4SJ2B0G4rdtfqZH3M9
	Ivv+WcYIacHKsbLRyy7RfWQOTfDtg5uThrkBJhf/UOpAjwpW6nivipuTxN0IGOuvvgaExR
	DmuhAus6xXDD0cspKa2R8/NHNjfPvRZnCS8NMt2Vb15V+i0OwzJnSeHiedy7jtW9XN6zKz
	R23bEFxyyexoPARQX/F5EnbYBybbEXm2V4amq8frhl5qJe4wzqBCRPv55TddVQ==
Message-ID: <db1bc714-64a1-478d-b4ba-f322f7326d8c@bootlin.com>
Date: Mon, 16 Oct 2023 15:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] PATCH: dev-manual/new-recipe.rst: add missing parenthesis
 to "Patching Code" section
Content-Language: en-US
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <09705a7fc497768ca30a5de2b500e573@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <09705a7fc497768ca30a5de2b500e573@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 13:29:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4378

Hi Robert

On 12.10.23 at 14:14, Robert P. J. Day wrote:
> Add missing parenthesis, and another example of a compressed patch 
> filename.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> testing a new mail client so hoping it doesn't mangle patch submissions


Thanks for the patch.
Not totally right, though, as you should have "[PATCH]" instead of just 
"PATCH". Otherwise, you get "PATCH" in the commit title.

Don't you use "git format-patch" and "git send-email" to prepare your 
patches? It's more fail-safe.

Anyway, I see that your next patch doesn't have this issue :)

After editing the subject
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into master-next.

Thanks again
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


