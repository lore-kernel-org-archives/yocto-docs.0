Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A46AEB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 07:56:15 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.5281.1687247769673107118
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 00:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F7fHkY20;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687247767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZ1mpF+AIiMr//6zOKLL/oNFgjylaPVnBu9t0QV6ppk=;
	b=F7fHkY20F7BdaW7HB2z8U9CSMZpTUeUpl1CgQZgrmT679K9QSn7m+dmOceDZMeX4GMGBMc
	8A+gKUBpySBkmboblf5tNqziyCtgGyCB3b2reZRanRbx9oPPayX5hNc9VREXqvJx2Z15Ny
	y/to78x/jUx8lNJyhrwACtTfp6UT/6Zz16KzKfrZuNBd/Ds5zeQRsTjgDeOt8Ex5kk3t+e
	rtQ7qk2NKV/3x58AlPx51/bNjR4pJS/WXS3fb7n2aUH+M2EQlmBYD/0M92YeQY+LjZmBEf
	l3m9G63hQqgOj9mDQlzNqKObS06YcJUELn3jQvmKY/kJr+O9CO8qr/Bh/AaIpw==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75F85E000B;
	Tue, 20 Jun 2023 07:56:07 +0000 (UTC)
Date: Tue, 20 Jun 2023 09:56:05 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Michael Opdenacker via lists.yoctoproject.org"
 <michael.opdenacker=bootlin.com@lists.yoctoproject.org>
Cc: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: variables.rst: explicit variables
 accepting colon separated lists
Message-ID: <20230620095605.206a8757@booty>
In-Reply-To: <20230619161719.910423-1-michael.opdenacker@bootlin.com>
References: <20230619161719.910423-1-michael.opdenacker@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jun 2023 07:56:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4009

Hi Mike,

On Mon, 19 Jun 2023 18:17:19 +0200
"Michael Opdenacker via lists.yoctoproject.org"
<michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:

> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> [YOCTO 15128]


Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

