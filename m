Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95004E77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 15:35:39 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.50744.1736436932341975973
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Jan 2025 07:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 509FZMJR008844;
	Thu, 9 Jan 2025 09:35:23 -0600
Received: from [192.168.2.133] ([192.168.2.133])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 509FZL8P027528;
	Thu, 9 Jan 2025 09:35:22 -0600
Message-ID: <fb609b03-217f-4704-b798-de574d0eed6a@kernel.crashing.org>
Date: Thu, 9 Jan 2025 09:35:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] Best practices documentation for multiconfigs
To: Christian Eggers <ceggers@arri.de>, docs@lists.yoctoproject.org
References: <cb8cda4b-4b71-4896-b355-d628336b11a4@kernel.crashing.org>
 <CAJdd5GZY6-QwiJQM1KjQN1=GpSL_po4ay_hahvx4+Miz59vJVg@mail.gmail.com>
 <39d815da-1f48-4822-a1c2-1d8762ab7989@kernel.crashing.org>
 <4928529.OV4Wx5bFTl@n9w6sw14>
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <4928529.OV4Wx5bFTl@n9w6sw14>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 509FZMJR008844
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Jan 2025 15:35:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6073



On 1/9/25 2:14 AM, Christian Eggers wrote:
> Hi,
>=20
> due to this thread I got noticed about the "multiconfig" feature for
> the first time. I have two additional questions related to this topic:
>=20
> 1. Toolchain
> For baremetal targets we currently use the "GNUARM" toolchain. Would it
> make sense to build the "secondary" toolchain with Yocto instead? Other
> users may prefer staying at an external toolchain. Is there already
> documentation about building a secondary toolchain (or using an existin=
g one)?

In _MY_ base, I don't want to use any binary toolchains, so I build from =
source.=20
  Otherwise I don't consider the code to be properly reproducible.

> 2. SDK
> How can the additional components of a multiconfig (e.g. toolchain, lib=
raries)
> be added to the SDK?

SDKs are single configuration.  You need multiple SDKs, one for each conf=
iguration.

--Mark

> regards,
> Christian
>=20
>=20
>=20
> _______________________________________________________=E2=80=8B=E2=80=8B=
=E2=80=8B=E2=80=8B
>=20
> Christian
>=20
> =09
>=20
>=20
> =09
>=20
> Eggers
>=20
> Software=C2=A0Engineer
>=20
> =E2=80=8B
>=20
> ARRI
>=20
> Arnold=C2=A0&=C2=A0Richter=C2=A0Cine=C2=A0Technik=C2=A0GmbH=C2=A0&=C2=A0=
Co.=C2=A0Betriebs=C2=A0KG
>=20
> Arriweg=C2=A017
>=20
> =09
>=20
> ,
>=20
> =09
>=20
> 83071
>=20
> =09
>=20
>=20
> =09
>=20
> Stephanskirchen
>=20
> www.arri.com
>=20
> <http://www.arri.com/>
>=20
> =09
>=20
> +49=C2=A08036=C2=A03009-3118 <tel:+49%208036%203009-3118>
>=20
> =09
> =09
>=20
> =09
>=20
> CEggers@arri.de <mailto:CEggers@arri.de>
>=20
>=20
> =E2=80=8B
>=20
> SkyPanel Pro <https://www.arri.com/en/lighting/led-panel-lights/skypane=
l-pro>
>=20
>=20
> Arnold=C2=A0&=C2=A0Richter=C2=A0Cine=C2=A0Technik=C2=A0GmbH=C2=A0&=C2=A0=
Co.=C2=A0Betriebs=C2=A0KG
> Sitz:=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=A0Registergericht:=C2=A0Amtsg=
ericht=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=A0Handelsregisternummer:=C2=A0=
HRA=C2=A057918
> Pers=C3=B6nlich=C2=A0haftender=C2=A0Gesellschafter:=C2=A0Arnold=C2=A0&=C2=
=A0Richter=C2=A0Cine=C2=A0Technik=C2=A0GmbH
> Sitz:=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=A0Registergericht:=C2=A0Amtsg=
ericht=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=A0Handelsregisternummer:=C2=A0=
HRB=C2=A054477
> Gesch=C3=A4ftsf=C3=BChrer:=C2=A0Stefan=C2=A0Mairiedl;=C2=A0Walter=C2=A0=
Trauninger
>=20
>=20
> =E2=80=8B
>=20

