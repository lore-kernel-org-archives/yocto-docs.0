Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32580CD3427
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:18 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.18354.1725352388806345389
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Sep 2024 01:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VPlnEN/O;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8EA71C0002;
	Tue,  3 Sep 2024 08:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725352386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4vpWv1fen6BSp/iMwsjNrolYLhDOcDBIVWrZGBh150=;
	b=VPlnEN/OLGX5rP8AUbk9nRbt7qOi4WGNwU95phKJ1f3oPBOWdr6DzyyTt5QQ2kINWuDLej
	ILld83DOWuVdB1IXSoQLxVQUA2b5ht04iGU8KFBoo82gXfNhahTmTf4fEgejmFxUzwbVCQ
	ndzt0VSDKsaYf8lE7tlGUoNrhz9M7l4wRrv3dXLAzQPh4nzujZsEbFXC9P47nmDlH+bF8w
	f7qn9ANYft8g821Je3GZ7tjrCuU4XKeO5id2dZJRcuGJ6b/J1cBXXkSW4vjjvrwHDPDs3Y
	Wh4Q01iJEvFNgJ0EKrHL8VFVUI/RZ/ws19JdIWlzThg9pPyEiRbbqAox0jATjA==
Date: Tue, 3 Sep 2024 10:33:05 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: joerg.sommer@navimatix.de
Cc: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] doc/features: describe distribution feature
 pni-name
Message-ID: <20240903083305984faa6c@mail.local>
References: <9288e40f901792887ac98417ae8c89fcc2f23a0d.1725018000.git.joerg.sommer@navimatix.de>
 <9275d1ee169aa794c789fd46d2e1f8f68befe281.1725088479.git.joerg.sommer@navimatix.de>
 <97f6df0d-8f41-462f-924b-5de4626eb26e@cherry.de>
 <jxpkr6zfcyhqattfqxvafzkzfiouoicvnpwdgtacztrfdodb4a@smhc47c3enzb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jxpkr6zfcyhqattfqxvafzkzfiouoicvnpwdgtacztrfdodb4a@smhc47c3enzb>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Sep 2024 08:33:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5350

On 02/09/2024 10:59:14+0200, J�rg Sommer via lists.yoctoproject.org wrote:
> Quentin Schulz schrieb am Mo 02. Sep, 10:42 (GMT):
> > Hi J�rg,
> > 
> > Please try to add the v2 when sending the second version of a patch so the
> > maintainer doesn't have to guess which one is the latest from their inbox.
> 
> Yes, you're right. I've realised it the moment git-send-email printed the
> subject.
> 
> > Also try to add below the --- what changed between v1 and v2.
> 
> Is there a git-send-email option to do so easily?
> 

git format-patch -v2 will tweak the subject line properly.



> 
> Regards J�rg



> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5348): https://lists.yoctoproject.org/g/docs/message/5348
> Mute This Topic: https://lists.yoctoproject.org/mt/108192394/3617179
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

