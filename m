Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B486C54EFC
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 08:41:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7187.1785228064680017763
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 01:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bVbyeC8t;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5C5A94E40FB9
	for <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 08:41:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24A65601BF;
	Tue, 28 Jul 2026 08:41:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCCD311C13E90;
	Tue, 28 Jul 2026 10:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785228057; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pPOi7G0hyZvezRDVLGdB8XmEMU+EODYracXIOASSn64=;
	b=bVbyeC8tpLFuGbeyMt9fVsX18JtbRcu0G/Xhwyv9DsLusUaZXMuNuK8rErV9FmOOgJzuMm
	a/9jPFrSBi48OPEFer8sQ3ptiIcSetQYU8BMy6tfsCYApp45WNGqu/EV3IxhVL64MijkuR
	1wKaPIbs4tVIArzuAwU465yNKXp4vs3/IHEwmuuWrdgm56+71FC8uRCdn9hpLjB2+wNWQC
	WWw/ziPuxMi3foUf9dSah7cxINvf0jOgr1OIbP6S5dSNpx6q89/X3zp6KwkYnx8MpfFIDZ
	q7skqH/nRvwK/zjQi8fUP774/3xDAtmtYcVyMOFHPF5D9FKd2lGYdXBN5EfiZQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 10:40:56 +0200
Message-Id: <DKA2J31USQ4N.S0DEGRSSMX8W@bootlin.com>
Subject: Re: [docs] [PATCH v2 3/4] tools: add gen-doc-links to generate
 documentation link flags
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
References: <20260716-gen-doc-links-intersphinx-v2-0-83cb3aef6ff6@bootlin.com> <20260716-gen-doc-links-intersphinx-v2-3-83cb3aef6ff6@bootlin.com> <9b51a647-76c1-4bbf-b4fe-c9fc57109bc7@cherry.de> <DK6UEDV65R3Y.2HPH1DCKA1Z2V@bootlin.com> <fecc23f0-65d3-4621-8969-1ea92f24e9f2@cherry.de>
In-Reply-To: <fecc23f0-65d3-4621-8969-1ea92f24e9f2@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 08:41:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10164

Hi,

On Fri Jul 24, 2026 at 6:27 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 7/24/26 3:40 PM, Antonin Godard wrote:
>> Hi,
>>=20
>> On Mon Jul 20, 2026 at 6:39 PM CEST, Quentin Schulz via lists.yoctoproje=
ct.org wrote:
>>> Hi Antonin,
>>>
>>> On 7/16/26 2:18 PM, Antonin Godard via lists.yoctoproject.org wrote:
> [...]
>>>> +def main():
>>>> +    args =3D parse_arguments()
>>>> +
>>>> +    yocto_docs_dict =3D {}
>>>> +
>>>> +    if not args.yocto_docs_inv.exists():
>>>> +        print(f"yocto-docs inventory not found at {args.yocto_docs_in=
v}, "
>>>> +              "use the --yocto-docs-inv option or set YOCTO_DOCS_INV_=
PATH "
>>>> +              "in your environment")
>>>> +        sys.exit(0)
>>>> +
>>>> +    if not args.bitbake_inv.exists():
>>>> +        print(f"bitbake inventory not found at {args.yocto_docs_inv},=
 "
>>>> +              "use the --bitbake-inv option or set BITBAKE_INV_PATH "
>>>> +              "in your environment")
>>>> +        sys.exit(0)
>>>
>>> Don't you want to sys.exit(1) here (and above) instead to show the user
>>> this is an error?
>>=20
>> I did not want to block creating a commit because the docs wasn't built.
>> I looked a bit at it and pre-commit does not have a special error code t=
hat
>> could signify a SKIP.
>>=20
>
> Mmmmm... Any chance this can be configurable? I'm thinking people may=20
> want to run this script outside of pre-commit. Maybe via a parameter you=
=20
> pass to pre-commit for example, or via an environment variable that is=20
> set in pre-commit?

Actually an argument like --no-exit-code which is passed only from the
pre-commit configuration file might do the trick, I'll see what I can do.

Thanks!
Antonin

