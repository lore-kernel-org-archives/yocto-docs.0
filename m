Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E306C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 05:41:04 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.6447.1666244458522615995
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 22:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oLkMRKcH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D8558C0006;
	Thu, 20 Oct 2022 05:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666244456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQViJ1Ln683037Go1XdvScBMv+EAeaF3vK44ooyslyY=;
	b=oLkMRKcHPKHctw1Gf1dwc6/kCtyJIl5Rja5NTPB4ayxBvO5mQzci8HQ8BoLxApmoV8g4Fc
	1en4ePiz9sAFhxg7zn9tJOeJgOUd39Au4z4udDbUUY1MIi83D2Sabi6C95pX/aLhR5mxaX
	qicOmp1spRf5Immo4ULcyaBlvZELz4PmgqrInuRpT1wS5mXxDG/bwTVOz9h0aq8qm9GZio
	H2nEsFlQQhPuo62tsGnIl3Z/PtWZl2fqW4hRga1NERAYtvj5gWkfM0aJqBHoo1FeJQ8kr6
	+mi7yry0aLWscXdbeFxE66z6+6k8PVThbLDB56ewKV7xaOWWNe16ZmzcnAY57A==
Message-ID: <9f46f176-b986-fe67-4de6-8668555e65ea@bootlin.com>
Date: Thu, 20 Oct 2022 07:40:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH v4] release-notes-4.1.rst remove bitbake-layers
 subcommand argument
Content-Language: en-US
To: "ito@lineo.co.jp" <ito@lineo.co.jp>
References: <20221020053014.33484-1-ito@lineo.co.jp>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221020053014.33484-1-ito@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Oct 2022 05:41:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3382

Hi Ito,

On 10/20/22 07:30, ito@lineo.co.jp wrote:
> Signed-off-by: Takayasu Ito <ito@lineo.co.jp>


Still missing a "From:" field at the beginning of the patch sent by git 
send-email, as your full name doesn't appear in the headers of the 
e-mails you're sending.

Are you sure you ran:
git config --global sendemail.from "ito@lineo.co.jp"
?

I don't think you did.

This should add a "From" field to the sent patch which "git am" should 
be able to match with your name.

Please take the time to read 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


