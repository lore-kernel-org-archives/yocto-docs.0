Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339F7D43FF8
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:25:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.36633.1731921922819361948
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 01:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=abUeHE+i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABCF560009;
	Mon, 18 Nov 2024 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731921921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hWG6FbtXWnvqYx+L9JjPSjinpZ9VEJPNkvXHDQixT3k=;
	b=abUeHE+ivDcUpgmxJSRsDbfMU5SKeUuynpCS63gnmJYBhrmWKNVoWEKdhKBUE0Vk8/J30i
	kB8g4JyxnbA19QlX/CGM+ofHIKoBu9P5C5Vi58GNyDn8azjHC97fEcHVHlOrQ1Skih0f4c
	DRAEku1XZbWJhMrP0z3LVIuE4TQeGvufgEChh53XIHfh82YYbduCgiNCxnbjLqGwjaYtbu
	bGYYUahCU/HM+oDY6rd/Mssv8qdx1kPF7ajxXVy6QzKImRP3pn/g8bFTuh5+uu52Q5vNLk
	/rdYT5hGQjL9iGpc/1gJRMSiYCrrtcgz3IdD8UQi8O10g4qYKClTD1fm4t8o5w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Nov 2024 10:25:20 +0100
Message-Id: <D5P72Y7SQ2W2.1U23WXV018P6V@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <chee.yang.lee@intel.com>, "docs@lists.yoctoproject.org"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 5.0.4
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <17FE30535BAB5CAB.4702@lists.yoctoproject.org>
 <BL4PR11MB8797D05DBBAF8D85927AA257B9272@BL4PR11MB8797.namprd11.prod.outlook.com>
In-Reply-To: <BL4PR11MB8797D05DBBAF8D85927AA257B9272@BL4PR11MB8797.namprd11.prod.outlook.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Nov 2024 09:25:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5755

Hi Chee Lee Yang,

On Mon Nov 18, 2024 at 10:19 AM CET, Lee Chee Yang via lists.yoctoproject.o=
rg wrote:
> ping.=20
> This is merged in scarthgap branch but not in master and styhead.

Thanks for the reminder, I must have missed it back then.

Cheers,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


