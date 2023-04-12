Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5E5C77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 20:27:44 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.726.1681331255865529174
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 13:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fO3JkxF0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5A7D9E0002;
	Wed, 12 Apr 2023 20:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681331253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XGAWnsNLsVzoEM3EJPw4nP/HqBfDXcIjPNmtY9cfayU=;
	b=fO3JkxF0shkXB3B+XS3WKX7UjEBT0xp6WUuRmt3PZmzTAmEJUC866+1b4wDZGPTAje0VFd
	MIfEFTc/kj/M6kNgTEZlNqwfn1dAlR4v9UDxvtRA77u/yhwQvQSqdQowCjrvOSAuhUVCzm
	102VIIpamQ1WsAIX15jJ6hHAuRRTHHSba7skhV1f6MH18HfKrYOx+95A0L0aIHPB8eAEFV
	MC8c0fMduD/jQLv5PDx/kcKKZthBU3+dNIHWePa31WkpZ2ABdSBTP4xKK5KVbKVl9lzPj7
	ccv6ZxnDy7QUeKSHRgBJnMQQTL03rnbVoGpkjUQ5FKZPIJ0etxAWo8gLbF6MQQ==
Date: Wed, 12 Apr 2023 22:27:31 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH] ref-manual: classes.rst: document devicetree.bbclass
Message-ID: <20230412222731.54581108@booty>
In-Reply-To: <20230412191122.620584-1-michael.opdenacker@bootlin.com>
References: <20230412191122.620584-1-michael.opdenacker@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Apr 2023 20:27:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3837

Hi Mike,

On Wed, 12 Apr 2023 21:11:22 +0200
michael.opdenacker@bootlin.com wrote:

> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> This addresses [YOCTO #15092]
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Thank you!

Since you already added my SoB line (which seems appropriate) I'm not
sure it makes sense to also add a Reviewed-by line, but in case it does
you can add:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

