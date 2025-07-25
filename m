Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38491C87FCD
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 09:01:04 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web11.15298.1753434056613018337
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Jul 2025 02:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pedxyl0Z;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69C774317C;
	Fri, 25 Jul 2025 09:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753434054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fWaQeq1clAdYDXD4+vwOTFfyxc4m9WrXQ+4Ssj3/K6E=;
	b=pedxyl0ZS8TsVr9h1BFuLkC93bsXEZRZ9TWQ/1VAmKKWCehmXAb+8ejacnbzVK2lY2sFVM
	QboHv7nzm4S0fx5VqsfCkheHXNhBh8giCbncXxjcd6RUJfmERYofaXSD8wY34+eZs9SkAy
	3FWQaVN/KnDLA8MkbOqSba0eFDo5EHq/tr2honChUxaf1Moj4KYxKbyXy7vQR8B7tF4SHC
	5qPd0arqhpYJOLF18VjuHoDFhuR4/Mo9mhlTLuRJVnqQnb38ATBiL3bs6gfJqWqREeyOem
	q/fk6NbWv3FPLqSH8Pm3Psfswi7c7NpB8qqJ5z0B8ZCR6IfQGmngQOOSjKmrKg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Jul 2025 11:00:53 +0200
Message-Id: <DBL0HW3KDRX4.VPIVYKG87BVH@bootlin.com>
Subject: Re: [docs] is IMAGE_PKGTYPE of 'tar' even supported anymore?
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <96c02217-f9fc-488f-d3ee-074fddd87642@crashcourse.ca>
 <DBKYL4DQWEE1.LLYBFXF4OB11@bootlin.com>
 <0db5995b-0cba-d2bd-9652-8759b347273c@crashcourse.ca>
In-Reply-To: <0db5995b-0cba-d2bd-9652-8759b347273c@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfekieeufeeiveekkeevjeetveelkeejiefgfeeihfeghfeghfduvdejuddvvdenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhpjhgurgihsegtrhgrshhhtghouhhrshgvrdgtrgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtr
 dhorhhg
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Jul 2025 09:01:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7383

On Fri Jul 25, 2025 at 10:55 AM CEST, Robert P. J. Day wrote:
> On Fri, 25 Jul 2025, Antonin Godard via lists.yoctoproject.org wrote:
>
>> On Thu Jul 24, 2025 at 10:30 PM CEST, Robert P. J. Day wrote:
>> >
>> >   docs sort of suggest it, but code sure doesn't seem to support it.
>>
>> Good catch, it was removed in 2023: 90ce19122802 ("meta/classes-global: =
remove
>> package_tar.bbclass") in OE-Core.
>>
>> Do you want to work on a patch to remove references to it?
>
>   should the variable glossary entry for IMAGE_PKGTYPE still contain
> the note:
>
> "Files using the .tar format are never used as a substitute packaging
> format for DEB, RPM, and IPK formatted files for your image or SDK."
>
>   i mean, technically, the note is still true, but is it meaningful
> anymore? or should it be deleted?

I understand this line as "we support it, but don't use it"... but since it=
's
not supported anymore, I'd remove it to avoid confusion.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


