Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31EAC02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 10:27:49 +0000 (UTC)
Received: from relay0.mail.gandi.net (relay0.mail.gandi.net [217.70.178.220])
 by mx.groups.io with SMTP id smtpd.web10.48845.1737973666216035289
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 02:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WLCP9h5s;
 spf=pass (domain: bootlin.com, ip: 217.70.178.220, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 257FA44077;
	Mon, 27 Jan 2025 10:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737973664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ntsRQMYXKMp63nJpLKaPwb9tI0PbArZdJ3PXosIRwwo=;
	b=WLCP9h5sJz3rrdXap/4UHDn5ihdvHoKKkUa3NSmEeyqLTiaZtJk90JxeGJ0pTJIbP29xOU
	ex3lxICKORQjuJyrwjCDzBPjNMA9FR8t07pZyi3XsaMrMNYUtlOp1liBAi3YqP2GZVBhn+
	6hV5MGhk9P/MnPZ+i/JV6Ur7Lrbr7bvDHcG4ck5rPVpS1bGYLmYdjsexGUskgBhx6WxfyV
	3UtT8+s+c30WpNfsq/fGsy3pmFxRTQKLLlw8QdUfM8CXTP1tFQW8nY0t39Hyhn68oeHV0E
	qTKkdTEV00KzRsuHcAV2mgXChb48SQI4JUNbJYpY38afEOWsBuTdoJRvMSIdDA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 11:27:43 +0100
Message-Id: <D7CS8UUTIV3V.3G2ID84LSE4PX@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Adrian Freihofer" <adrian.freihofer@gmail.com>,
 <docs@lists.yoctoproject.org>
Subject: Re: [scarthgap,styhead][PATCH 1/1] sdk-manual: extensible.rst:
 update devtool ide-sdk
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250126125313.1454763-1-adrian.freihofer@siemens.com>
 <20250126125313.1454763-2-adrian.freihofer@siemens.com>
 <D7CPUNB5VPU4.8GY2FQBHEPPQ@bootlin.com>
 <a8dfa467700d8d7961bb24bb5c52290b077d8d5b.camel@gmail.com>
In-Reply-To: <a8dfa467700d8d7961bb24bb5c52290b077d8d5b.camel@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedguddvleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkefgkeettdevudevkeelffefueetfedvieelieejjefhheefveeiveejkeffvdffnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhpr
 hhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 10:27:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6193

Hi Adrian,

On Mon Jan 27, 2025 at 11:18 AM CET, Adrian Freihofer wrote:
> Hi Antonin
>
> It's a bit complicated to keep yocto-docs, oe-core and the bitbake
> VSCode plugin consistent by sending patches to different mailing list
> and different people. The related patch series for oe-core is here:
> https://lists.openembedded.org/g/openembedded-core/message/210279.
>
> There are multiple reasons, why I would like to update all the branches
> to the same level:
>  * Latest VSCode plugin does devtool modify --debug-build by default.
>    With a poky without this option, the user has to take manual action.
>  * It's a bug which should be fixed
>  * It's without risk for breaking something, it's a trivial change.
>
> So probably yocto-docs needs to wait until oe-core decides and then
> follow. Is this possible?

Sorry, I hadn't noticed that you also sent backports on oe-core. I'll try t=
o
monitor this and make sure the doc patch also gets backported. Feel free to
bounce it if I forget. ;)

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

