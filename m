Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D441C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 07:37:58 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.10627.1749022676820586516
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 00:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SY8KOQEh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84F5A433B1;
	Wed,  4 Jun 2025 07:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749022675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P105TuBoP1H0lBAEJnoBkkH/dY4PqdSxpS8X5fVniFQ=;
	b=SY8KOQEh4ddovLdSxsEriz8No2SoeLdPGAxgeILGpzChhAm/uu0c1tx1p8kJkEUucLLUaW
	QgehtBsWs8n27rk99yLGFnbjl2jd0vVn06xMPUezS7eep02XzsP8iX84IF6Wy7yJs0KRRm
	nBAB1fXQ+g9sk+8F/u9ycjIzR0PhkRN4G4kTYVnNdCchv5PyTPq/46y4at437pAZ93KkxM
	aWQxivbaoldUKqXImJe0c39/RzEagwfXk5U0ARY9n1s503nvdxC8zcqZGv7Mfj3JWRJA1C
	iP9JTO9slarF3Q67iQWtXYPetCC2mGxFiJUqtjomQ3Xn0g7PhElycT+e9EwtRg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 09:37:53 +0200
Message-Id: <DADKSJT4E1Z3.30IGBV2BTFO95@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <rpjday@crashcourse.ca>, "YP docs mailing
 list" <docs@lists.yoctoproject.org>
Subject: Re: [docs] can YP variables glossary refer to BB manual *and* add
 extra info?
References: <1e850595-c5f5-8c90-4143-6a8ddbbddfc2@crashcourse.ca>
 <263680fd-b970-41c4-a664-1c10ee93d053@cherry.de>
In-Reply-To: <263680fd-b970-41c4-a664-1c10ee93d053@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdevgfevkeegteefieekfeeuiedvieeikeelueekffetieefgeevfeefleelheenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtoheprhhpjhgurgihsegtrhgrshhhtghouhhrshgvrdgtrgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Jun 2025 07:37:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6996

On Mon Jun 2, 2025 at 4:33 PM CEST, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
[...]
>>    Thoughts?
>
> As an occasional reviewer: go for it :)
>
> If you're worried into sinking time on this, maybe wait for Antonin's=20
> input first :)

I agree with Quentin, I think it makes sense expanding on what the OE build
system sets as default, while keeping the link to the bitbake manual.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


