Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A90C77B7F
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 08:38:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.3652.1750927103091344502
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 01:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j+i6+E9m;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 123FA433F6;
	Thu, 26 Jun 2025 08:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750927101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mCvaBtNbQ1mLEiHMLMtpy2B1IVC8poWKsnEcQ6POIMg=;
	b=j+i6+E9m/XJ02XdhoTy64tflkHf4UC0C5PP2FpBZZS0Zto0EzH6LYZAzwY9d/o/GjZOcIB
	z2J/VDyqlKVa8Riytm0xk+RUw3Vt4stuusFkxokva8g1F4A1fIz+8zptfHbec9jtpF4Lya
	nUO32JBuYC2fRy7kDjCkmW+NNo0k1tZ8bYWizNHtDfPVI1MRhLr3CKXD67MF5nL8Ft7wf9
	oZ2JvRgiuEIFAnNcV/Tq1wkFXOtUgVtbN2RYWG/rQbrGKoclApPOLtVMQ0wgT/UNWHJRmV
	RFzZkSbiANg+yOsy0hiFozOnzMsVvu9Ngbu0KM70mV8VejYtCpgDcCHaur6F5w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Jun 2025 10:38:20 +0200
Message-Id: <DAWBUTM7CWGG.3S2D24JNNJ89G@bootlin.com>
Subject: Re: [docs] [OT] trying to build kas docs, "No module named
 'sphinxarg'"
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <edad802f-c9fb-a11a-e729-bc505ac97112@crashcourse.ca>
In-Reply-To: <edad802f-c9fb-a11a-e729-bc505ac97112@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvhedulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteeuieejhefgheffvdektefhgfdvhfefhfdvleeugfevjeekhfevkefhkeehheevnecuffhomhgrihhnpehgihhthhhusgdrtghomhdprhgvrgguthhhvgguohgtshdrihhopdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhpjhgurgihsegtrhgrshhhtghouhhrshgvrdgtrgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghto
 hhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Jun 2025 08:38:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7226

On Wed Jun 25, 2025 at 8:34 PM CEST, Robert P. J. Day wrote:
>
> Given the abudance of Sphinx expertise here, I'm hoping people will
> forgive me for a little off-topic querying ... I checked out kas:
>
>   https://github.com/siemens/kas.git
>
> and tried to build the Sphinx docs with:
>
>   $ make html
>
> and got:
>
> Generate kas-container usage documentation
> sphinx-build -b html -d _build/doctrees   . _build/html
> Running Sphinx v7.4.7
> loading translations [en]... done
>
> Extension error:
> Could not import extension sphinxarg.ext (exception: No module named
> 'sphinxarg')
> make: *** [Makefile:53: html] Error 2
>
>
> I've installed python3-configargparse, but no change. Can anyone
> suggest what I need to fetch and install? Thank you kindly.

You probably just need to install sphinx-argparse.
https://sphinx-argparse.readthedocs.io/en/latest/

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


