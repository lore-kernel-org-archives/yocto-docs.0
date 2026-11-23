Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50513.1795423733433619596
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2026 00:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NGk1z3p8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 29B09C69146;
	Mon, 23 Nov 2026 08:48:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C1C15FAEB;
	Mon, 23 Nov 2026 08:48:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BDBB11E68695;
	Mon, 23 Nov 2026 09:48:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795423730; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dTxq91RG1/jSC+YJfRnHp+rUR2KBjPxbAArEHsBZM3g=;
	b=NGk1z3p8K2EETfgezpp1aIKGGUvnYRVVshOWigUeoTbpSBWtv5N4mi+adDCBE+0X9IyAi2
	nAp4DV3eXZuISFD91SBqfS1D4p9SWeiCLshIjkuH9wHCHw3UQLomxutu13nxLdfwjtt7u4
	96lcbW/hLMycebpPrRVnTF5UpPguxaG3EwpnF+a3Itj6J93yjec1ij5VXV5LLXrBf3kDf6
	EC9GowtKsrYEAQNGA1Xy8ddhfSxhtbSssCmgKSYv7BD/zNFA1fXYdhfApxzTWXK5oHkGtu
	uitF9pfF6PdZeqv/A3agF8idJBUkFKaKa2i4gQqeBrc5PWyaOgb+va1inzeJLA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 09:48:47 +0100
Message-Id: <DN2GLDYPBI31.22TZAA7IOMK9L@bootlin.com>
Subject: Re: [docs] [PATCH 5/8] Makefile: use splithtml tag for html target
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
 <20261028-tags-v1-5-d5ad01019eae@bootlin.com>
 <5704ab71-2ea0-4557-af95-f4a59129178d@cherry.de>
In-Reply-To: <5704ab71-2ea0-4557-af95-f4a59129178d@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2026 08:48:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10822

On Fri Nov 20, 2026 at 6:39 PM CET, Quentin Schulz via docs wrote:
> Hi Antonin,
>
> On 10/28/26 9:04 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Sphinx has the ability to include content based on tags in the
>> documentation with the '.. only::' directive. As '.. only:: html' is
>> common to _all_ HTML-based documents (html, singlehtml, epub), there was
>> no way to differentiate the split HTML build from the others.
>>=20
>> For that reason, add the splithtml tag when building it. The goal is be
>> able to to include content _only_ for this build type.
>>=20
>
> question: what's splithtml?
>
> Just reading it, I have no clue what it means? EDIT: ok, after reading=20
> it twice, I understand you meant split as opposed to singlehtml.
>
> builders actually already set a tag, c.f.=20
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.ht=
ml#directive-only=20
> so you could simply use
>
> .. only:: builder_html
>
> The benefit is no new Makefile rule :)
>
> What do you think?

Oh great, I didn't see this and this should make things simpler, thanks :)

Antonin
