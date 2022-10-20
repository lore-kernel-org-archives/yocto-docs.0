Return-Path: <ito@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CEEC4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 07:28:34 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web10.6982.1666250905608984839
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Oct 2022 00:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: ito@lineo.co.jp)
Received: from [172.31.28.27] (vpn1.lineo.co.jp [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id E04A78041701F;
	Thu, 20 Oct 2022 16:28:23 +0900 (JST)
Message-ID: <57f9883f-b4a5-34b0-9a57-80b4a6ca9d5d@lineo.co.jp>
Date: Thu, 20 Oct 2022 16:28:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [docs][PATCH v6] release-notes-4.1.rst remove bitbake-layers
 subcommand argument
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
References: <20221020065246.33834-1-ito@lineo.co.jp>
 <39e4d562-ea12-9fe3-7d6d-853c57f45cc7@bootlin.com>
From: Takayasu Ito <ito@lineo.co.jp>
In-Reply-To: <39e4d562-ea12-9fe3-7d6d-853c57f45cc7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Oct 2022 07:28:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3388

Hi Michael

The subcommand save-build-conf, which was added at the same time, only=20
contains the subcommand name and no parameters, so we have made a=20
proposal to unify the notation.

If "bitbake-layers create-layers-setup destdir" is used, it would be=20
better to use "bitbake-layers save-build-conf layerpath templatename"=20
with the required parameters to unify the notation.

On 2022/10/20 16:06, Michael Opdenacker wrote:
> Hi again Ito
>=20
> Now that the patch is correct, let's talk about the proposed change=20
> itself...
>=20
> On 10/20/22 08:52, Takayasu Ito wrote:
>> From: Takayasu Ito <ito@lineo.co.jp>
>>
>> Signed-off-by: Takayasu Ito <ito@lineo.co.jp>
>> ---
>> =C2=A0 documentation/migration-guides/release-notes-4.1.rst | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/documentation/migration-guides/release-notes-4.1.rst=20
>> b/documentation/migration-guides/release-notes-4.1.rst
>> index 0c552bf1a..a2d4b3d6c 100644
>> --- a/documentation/migration-guides/release-notes-4.1.rst
>> +++ b/documentation/migration-guides/release-notes-4.1.rst
>> @@ -18,7 +18,7 @@ New Features / Enhancements in 4.1
>> =C2=A0=C2=A0=C2=A0 - New ``scripts/oe-setup-layers`` standalone script=
 to restore the=20
>> layer
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 configuration from a json file
>> -=C2=A0 - New ``bitbake-layers create-layers-setup destdir`` command t=
o=20
>> save the
>> +=C2=A0 - New ``bitbake-layers create-layers-setup`` command to save t=
he
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 layer configuration to a json file
>> =C2=A0=C2=A0=C2=A0 - New ``bitbake-layers save-build-conf`` command to=
 save the=20
>> active build
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 configuration as a template into a laye=
r
>=20
>=20
> I'm not sure what you propose to modify is correct though.
>=20
> Here's what I have with the latest "master" branch from the poky=20
> repository:
>=20
> $ bitbake-layers create-layers-setup
>=20
> NOTE: Starting bitbake server...
>=20
> usage: bitbake-layers create-layers-setup [-h] [--output-prefix=20
> OUTPUT_PREFIX] [--writer {oe-setup-layers}] [--json-only] destdir
>=20
> bitbake-layers create-layers-setup: error: the following arguments are=20
> required: destdir
>=20
> $ mkdir my-conf
>=20
> $ bitbake-layers create-layers-setup my-conf
>=20
> NOTE: Starting bitbake server...
>=20
> NOTE: Created=20
> /home/mike/work/git/git.yoctoproject.org/build/my-conf/setup-layers.jso=
n
>=20
> NOTE: Created=20
> /home/mike/work/git/git.yoctoproject.org/build/my-conf/setup-layers
>=20
> Which version did you make your tests with? Or what misled you?
> Cheers
> Michael.
>=20

--=20
=E3=83=AA=E3=83=8D=E3=82=AA=E3=82=BD=E3=83=AA=E3=83=A5=E3=83=BC=E3=82=B7=E3=
=83=A7=E3=83=B3=E3=82=BA=E6=A0=AA=E5=BC=8F=E4=BC=9A=E7=A4=BE =E6=9C=AC=E7=
=A4=BE
=E4=BC=8A=E6=9D=B1=E5=AD=9D=E5=BA=B7 <ito@lineo.co.jp>
=E3=80=92399-0651 =E9=95=B7=E9=87=8E=E7=9C=8C=E5=A1=A9=E5=B0=BB=E5=B8=82=E5=
=8C=97=E5=B0=8F=E9=87=8E1589-1
Tel +81-263-56-2317 Fax +81-263-56-2319
   =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=93
=E2=94=8F=E2=94=AB=E3=80=80  =E3=83=AA=E3=83=8D=E3=82=AA=E3=81=AF =E3=81=8A=
=E5=AE=A2=E6=A7=98=E3=81=AE =E3=81=93=E3=82=8C=E3=82=8A=E3=81=AA =E3=82=92=
=E5=BE=8C=E6=8A=BC=E3=81=97=E3=80=80=E3=80=80 =E2=94=A3=E2=94=93
=E2=94=83=E2=94=97=E2=94=B3=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=B3=E2=94=9B=
=E2=94=83
=E2=94=97=E2=94=81=E2=94=9B         https://www.lineo.co.jp        =E2=94=
=97=E2=94=81=E2=94=9B
=E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=93
=E2=94=83 =E3=81=93=E3=82=8C=E3=82=8A=E3=81=AA =3D =E3=81=93=E3=82=8C=E3=81=
=8B=E3=82=89=E3=81=AFLinux / =E3=81=93=E3=82=8C=E3=81=8B=E3=82=89=E3=82=82=
Linux =E2=94=83
=E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=9B

