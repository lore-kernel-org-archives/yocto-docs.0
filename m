Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3F6C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 10:19:14 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.27147.1750069151315864698
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Jun 2025 03:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vneu0uZn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 400EB42EF5;
	Mon, 16 Jun 2025 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750069149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6hM31VTo4FQ/3q37LC6Honj+FtgmRTeMX5wWJHiUzSs=;
	b=Vneu0uZnHa+rnmIyukf/XuT4h1tRTgaJ4CgtYXKOnV3cVe4CI2i/DE+qNkNz1T6d3Xtk8U
	agUBwkK+HdNZfQwvdA9c8+8Tll50W41c7vfEZ90tVvb9TDHIBMxPITWLioNUWZZhy4bVHA
	9xvBu3LEYjXWq/d1wZ7V9wRa3ax8gPMQMXYPVWBNH36keKhijqvlgn4XTYSpBX/YdeIB0q
	t4oPa9XDMtbJ37HGL5uzI9Wzniqo5+th7enAfcIaZdrDB3Br/o9ernkkZf8Be1V51A5jMO
	Q+3CH0ORIUEEAkG91yIvgv0uKKf/XgdcjPubO/TuHSrZ1dU4GdhYh+pmBJk6hA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Jun 2025 12:19:08 +0200
Message-Id: <DANVQK04YFFW.1UXQZIWYWTKE4@bootlin.com>
Subject: Re: [docs] [PATCH] Add a document to list supported Yocto features
Cc: "Yocto TSC" <tsc@lists.yoctoproject.org>, "docs@lists.yoctoproject.org"
 <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
References: <20250606-supported-architectures-v1-1-5eae2c4a2257@bootlin.com>
 <e7da5ff41c321096deb76f9fa6544475c19dd37c.camel@siemens.com>
In-Reply-To: <e7da5ff41c321096deb76f9fa6544475c19dd37c.camel@siemens.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvieefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffheekueetteekueefjeejveevuddutdfgueetieevkeejgeejgeetueevkeefudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesshhivghmvghnshdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrg
 hdprhgtphhtthhopehtshgtsehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Jun 2025 10:19:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7069

On Wed Jun 11, 2025 at 6:31 PM CEST, Adrian Freihofer wrote:
[...]
>> +Below is a list of secondary tested features, their maintainer(s)
>> and
>> +builder(s):
>> +
>> +.. list-table::
>> +=C2=A0=C2=A0 :widths: 20 20 20 40
>> +=C2=A0=C2=A0 :header-rows: 1
>> +
>> +=C2=A0=C2=A0 * - Feature
>> +=C2=A0=C2=A0=C2=A0=C2=A0 - Description
>> +=C2=A0=C2=A0=C2=A0=C2=A0 - Maintainer(s)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 - Builder(s)
>> +=C2=A0=C2=A0 * - :wikipedia:`PowerPC (32-bit) <PowerPC>`
>> +=C2=A0=C2=A0=C2=A0=C2=A0 - PowerPC architecture testing (32-bit)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 - Adrian Freihofer
>
> Would it be possible to add Peter Marko in addition to me?

Hi Adrian,

We decided it would be better if each maintainer modifies this document to =
add
themselves once it is merged on the master branch. The v2 of this patch con=
tains
"TBD" values instead, which are to replace. I think you could modify that a=
nd
add Peter Marko as well.

>> +=C2=A0=C2=A0=C2=A0=C2=A0 - qemuppc,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemuppc-alt,
>
> Not sure how much effort we'll be able to dedicate to PPC-32 with
> systemd. To be transparent, we might need to consider moving qemuppc-
> alt to unsupported status until somebody would step up as a maintainer
> for qemuppc-alt.

Thanks for letting me know, I will move that to the unsupported section.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


