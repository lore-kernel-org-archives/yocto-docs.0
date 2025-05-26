Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA10C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:42:30 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.24259.1748245340577934932
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 00:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L89YVQah;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8847643B4D;
	Mon, 26 May 2025 07:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748245338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CpkXbHeQmCBgVb/AN9yvge8kmSJf4CWqL48QN1xDoBM=;
	b=L89YVQah0acOMfG1dPBTd2zPz6mFhLQOP7e6ZHkHSv39QvN8TUUOX+VdFrw+TSrN0Xyslo
	rg/7XKiUZGryVPTSJqDTfEyUSu1HsaMl2NeHGJnnmCczHk5ydbIYFOp6XY+Cckh9o4sDr4
	8ShzLSiGA4I3HihCl7mbwzBibfS27Dvvw7pwzFh5YWYI9kFElPKCsaj+Bk/GCKo1bSodnF
	UWCQoHTDhioXJmR7iid4ECbhP1wdBuJOiuHOKW6fl721kCde6tMjeyvgnL8/9S+zmAYUDC
	7w9BoCKjC57T3Te+GUBtV8W7m2c8pYChP4u+kkmbc+agPG4Nbsw5Tk2whIJoLg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 09:42:17 +0200
Message-Id: <DA5X90V9P63G.5D6PCLTT6Y3Z@bootlin.com>
Subject: Re: [docs] Pedantic comments on "Yocto Project Quick Build"
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <64b9bec1-0aa4-9e4b-06ed-445eda4d60a7@crashcourse.ca>
In-Reply-To: <64b9bec1-0aa4-9e4b-06ed-445eda4d60a7@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieelheculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdegtdffgeeuledttdejhfefteeftdfhtdfguefgfeekjeelieffgedvieeiffdunecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhpjhgurgihsegtrhgrshhhtghouhhrshgvrdgtrgdprhgtphhtt
 hhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 07:42:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6910

On Sun May 25, 2025 at 4:59 PM CEST, Robert P. J. Day wrote:
>
> I was going to submit a patch but I wasn't sure about one or two of
> the changes so I'll just publish my comments and someone can decide
> what is worth tweaking and how.
>
> All of this is in the secton:
>
> https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#compatible-=
linux-distribution
>
> 1) Bullet list has both a first- and second-level bullet point on the
> same line, because the source file defines an empty top-level list
> item (first item in the sublist)

We could do with a small sentence like: "The following software version
requirements:".

> 2) Is Git 1.8.3.1 still supported? Man, that's ancient.

Yes, that's the oldest version supported, see:
https://git.openembedded.org/openembedded-core/tree/meta/classes-global/san=
ity.bbclass#n560

> 3) "If your build host does not meet any of these three listed version
> requirements ..."  There's five version requirements there, not three.

I agree, we can remove "three".

>   That's it for now.
>
> rday

Can you send a patch?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


