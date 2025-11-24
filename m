Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53EECFA466
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 15:56:58 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19963.1763999812507063419
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Nov 2025 07:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=piNreOoO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 83A53C139B1;
	Mon, 24 Nov 2025 15:56:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24D40606FC;
	Mon, 24 Nov 2025 15:56:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15B6510371E19;
	Mon, 24 Nov 2025 16:56:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763999809; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=x21B8dBsTlrdmzx4Q/UX02ijmFVvz8kQDmCvYCDfEZI=;
	b=piNreOoO2dgCXw1gOEWCvGb70Eme9UTc08v4OvfYEIC3wzO7FSbZmpecOonmoAzxG/cam2
	4R2ajVKBLSnrbMEXe/7YDXAfPpulFK4IOI4ToUltZ5lq97pP9568tighwLXNIPAj/bbtT+
	gpe35J9W/6BVdriThQRPhFIshapSxYXBDurAXNKLOYKE3wfGNFSfsaYtSHjR7y+VBEsYNP
	3CN41/375udYXMDgIRw7hC6GGYEemlz1k/5YjCi0zMkLuR2Z8sRPMJoTPGF/KpLPWNfnsL
	W0HnRle+IAp988+2bsMPc2+Bftkiy/EXCIQtKWm7fDTX2EovVA22TND27pc44g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 16:56:46 +0100
Message-Id: <DEH1QRTPEDL6.2XESRCG6M8CT5@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Robert P. J. Day"
 <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] brief-yoctoprojectqs: shorten and clarify
 required host packages
References: <77d4de56-c700-9ae8-f03f-ede89df13e62@crashcourse.ca>
 <DEH0FJ96MF58.TDE0QZF0AM5A@bootlin.com>
 <74030727-ae53-4664-8693-34ecb975e557@cherry.de>
In-Reply-To: <74030727-ae53-4664-8693-34ecb975e557@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Nov 2025 15:56:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8109

Hi,

On Mon Nov 24, 2025 at 4:21 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/24/25 3:55 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Hi,
>>=20
>> On Wed Nov 19, 2025 at 5:55 PM CET, Robert P. J. Day wrote:
>> [...]
>>> -Build Host Packages
>>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> -
>>> -You must install essential host packages on your build host. The
>>> -following command installs the host packages based on an Ubuntu
>>> -distribution:
>>> -
>>> -.. literalinclude:: ../tools/host_packages_scripts/ubuntu_essential.sh
>>> -   :language: shell
>>> -
>>> -.. note::
>>> +Supported Linux Distributions and Required Host Packages
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> -   For host package requirements on all supported Linux distributions,
>>> -   see the :ref:`ref-manual/system-requirements:required packages for =
the build host`
>>> -   section in the Yocto Project Reference Manual.
>>> +For host package requirements on all supported Linux distributions,
>>> +see the :ref:`ref-manual/system-requirements:required packages for the=
 build host`
>>> +section in the Yocto Project Reference Manual.
>>=20
>> I think this defeats the purpose of this guide being the "Quick Start Gu=
ide". I
>> _think_ most people run Ubuntu when they run Linux, and I believe this i=
s the
>> reason why this was written like so in this section.
>>=20
>
> I have no data on this, so /me shrugs.

I know, me neither, but it's a general feeling I get from what I've seen IR=
L.

>> So for the majority of people reading this section will be enough, and t=
hat's
>
> The issue is it's not everything that needs to be done according to our=
=20
> documentation. So it's already outdated and not well maintained. If you=
=20
> want to keep having it this way (which is fair, avoiding to go back and=
=20
> forth between the docs when one is reading "quick start" is a good=20
> idea), I believe we can simply have an .rst with only Ubuntu=20
> instructions that we can include in both=20
> ref-manual/system-requirements.rst and brief-yoctoprojectqs/index.rst so=
=20
> that it never is outdated?

Sure, having a single document for Ubuntu requirements would be an improvem=
ent!

>> the point. Also, the previous section "Compatible Linux Distribution" do=
es
>> mention that not all version are supported. So I think this section is f=
ine as
>
> Not all doesn't specify which ones. "Recent" is relative to time and I=20
> will not be able to build Dunfell on a Ubuntu 25.10 even though that is=
=20
> a recent distro and the docs said to use that. I would like to have this=
=20
> "recent" removed or reworded. Something like
>
> :ref:`supported version of Ubuntu=20
> distribution</ref-manual/system-requirements:supported linux distribution=
s>`

Ack! I agree on removing "recent" too.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


