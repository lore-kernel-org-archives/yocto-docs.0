Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB301C87FCA
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 07:31:13 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.14040.1753428668777955276
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Jul 2025 00:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=chZ8Z2dG;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5D92442AF;
	Fri, 25 Jul 2025 07:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753428667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Re2pdMMW+MCzJRhJhqHfOgae3/cwpJ40iTXKrZNAKYY=;
	b=chZ8Z2dGMmbFKeoG6gDhIY3g3jhWcY/2WS6YzfBp1Jhys14CrAiOoncRyvS1BEonMYPU3S
	LMvFNAp9Ep9DQFJrRbTIflIhT85M5lqirTUpQcXvEcPNPg+hvI3vu6hdHOZH6qNhXrSgX4
	upSiG/Qyr9knf2JxlLeUWVnhDxUluFMjzTpxZN+1ivUlEtFUY9bkZkgUHZdjXZNyE4Hni7
	MgliD7kKspf4n8BDaH/oV0Gre0/7PN6HnDT9LH/+kGdxt2tklIzNZni8yG1TvGqfJ5MvaF
	9MmLqaxqNkcJcZOZ6NAem9hmUKnDQSzERgQv896o4giWYXRhRMYbIpa4mGS2pA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Jul 2025 09:31:04 +0200
Message-Id: <DBKYL4DQWEE1.LLYBFXF4OB11@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] is IMAGE_PKGTYPE of 'tar' even supported anymore?
References: <96c02217-f9fc-488f-d3ee-074fddd87642@crashcourse.ca>
In-Reply-To: <96c02217-f9fc-488f-d3ee-074fddd87642@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekvdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffhvffufhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfejfeeulefhtefgheegffeuheffueehfffhleeghfegteduffekhfejtdfgheelnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhpjhgurgihsegtrhgrshhhtghouhhrshgvrdgtrgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Jul 2025 07:31:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7380

On Thu Jul 24, 2025 at 10:30 PM CEST, Robert P. J. Day wrote:
>
>   docs sort of suggest it, but code sure doesn't seem to support it.

Good catch, it was removed in 2023: 90ce19122802 ("meta/classes-global: rem=
ove
package_tar.bbclass") in OE-Core.

Do you want to work on a patch to remove references to it?

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


