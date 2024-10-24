Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C51ACE8E8A
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 14:58:28 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.16657.1729781902453458609
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Oct 2024 07:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iXVnc+Fb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45207C0008;
	Thu, 24 Oct 2024 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729781900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CgWSrUvr/pTidcqQBN1Iti9Fr7As6z/M2FWOBINAYg=;
	b=iXVnc+Fb+jNtVwFfigRvS9kAy7QG1kfkCxBWJmbXJp++SXgQOeObM9UOUkiCTqr6FsLUlO
	T8DkfCPVaWfTB8LHLEiSkHTUtwx11eTrUW6+cycXv20K3YlOvedxk6bln9Cjz2Y1spt+na
	j2umQ3hTnHAI5eMCMkN/x64WEUEx8ZEY4nFfgvYbE1J5PsMmVpFFJPdH7VpST5doho3n3l
	y8yonPK+eEbFqSadaInLVOS3fV8GQwRVOiPI58Lm9WlJrx9g5S84mwfPRsmgc3RbPnTBqM
	BpVngsBBJBFfMBYN4gxhBVwrCdRjkDQBZRWRD4qAId7eBuDZgaxeJDKwzSOKbg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Oct 2024 16:58:19 +0200
Message-Id: <D544IAIYE5R3.2JGI2N1SZZ4TC@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Johannes Deivard" <jdeivard@outlook.com>, "docs@lists.yoctoproject.org"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] BUG - Optimize WSL2 VHDX file using DiskPart
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <PAXP251MB02258F3DDEC28194AE141371DF4D2@PAXP251MB0225.EURP251.PROD.OUTLOOK.COM>
In-Reply-To: <
 <PAXP251MB02258F3DDEC28194AE141371DF4D2@PAXP251MB0225.EURP251.PROD.OUTLOOK.COM>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Oct 2024 14:58:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5582

Hi Johannes,

On Wed Oct 23, 2024 at 6:03 PM CEST, Johannes Deivard wrote:
> Hi,
>
> I would like to report that one crucial step is missing in the instructio=
ns "2b. Optimize your VHDX file using DiskPart<https://docs.yoctoproject.or=
g/dev-manual/start.html?highlight=3Dwsl2#:~:text=3D2b.%20Optimize%20your%20=
VHDX%20file%20using%20DiskPart%3A>".
>
> The attached vdisk must be detached before diskpart is exitted, or you wo=
nt be able to start WSL2 again since the VHDX file "is being used by anothe=
r process."
>
> The instructions for this subsection should be as follows (detach vdisk i=
nstruction added before exit):
>
> C:\WINDOWS\system32> wsl --shutdown
> C:\WINDOWS\system32> diskpart
>
> DISKPART> select vdisk file=3D"<path_to_VHDX_file>"
> DISKPART> attach vdisk readonly
> DISKPART> compact vdisk
> DISKPART> detach vdisk
> DISKPART> exit
>
> Best regards,
> Johannes Deivard

Thank you for reporting this.

Although I haven't been able to reproduce the problem you describe (on a Wi=
ndows
VM with a sample vhdx file), I've had no issue running "detach vdisk" befor=
e
running "exit", and I think it is indeed a better practice anyway.

Would you be able to add that line to the documentation? You can see
instructions on how to do that at the following link:
https://git.yoctoproject.org/yocto-docs/tree/README

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

