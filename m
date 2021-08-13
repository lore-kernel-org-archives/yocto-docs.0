Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web12.34085.1628844252934332061
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 01:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: menlosystems.com, ip: 212.18.0.10, mailfrom: o.mandel@menlosystems.com)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4GmHCv1vPGz1sF4b;
	Fri, 13 Aug 2021 10:44:11 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4GmHCv1dqJz1qqy7;
	Fri, 13 Aug 2021 10:44:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id cQklJITVfuyH; Fri, 13 Aug 2021 10:44:10 +0200 (CEST)
X-Auth-Info: 4bz8z4DBHEmNVL66Ij+yusPQ8hFOeF5pMZ41zsPIQxGqPzhpkpBMDaatE674NSVm
Received: from [10.0.0.213] (host-82-135-125-165.customer.m-online.net [82.135.125.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 13 Aug 2021 10:44:10 +0200 (CEST)
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org
References: <20210812160133.22232-1-o.mandel@menlosystems.com>
 <20210813080552.r4keiqjnf6sk7zky@fedora>
From: o.mandel@menlosystems.com
Subject: Re: [docs] [PATCH] kickstart: document which options accept units
Message-ID: <25237920-ce4f-7d9c-6a03-1d0e19d742b7@menlosystems.com>
Date: Fri, 13 Aug 2021 10:44:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210813080552.r4keiqjnf6sk7zky@fedora>
X-Groupsio-MsgNum: 1695
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HcL9hvIppHDrBaEuMQLhguU0b2U2rBFXy"

--HcL9hvIppHDrBaEuMQLhguU0b2U2rBFXy
Content-Type: multipart/mixed; boundary="GQ8SeD7mnUgi55czSFwVU0g6F1at1VhsO";
 protected-headers="v1"
From: Olaf Mandel <o.mandel@menlosystems.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org
Message-ID: <25237920-ce4f-7d9c-6a03-1d0e19d742b7@menlosystems.com>
Subject: Re: [docs] [PATCH] kickstart: document which options accept units
References: <20210812160133.22232-1-o.mandel@menlosystems.com>
 <20210813080552.r4keiqjnf6sk7zky@fedora>
In-Reply-To: <20210813080552.r4keiqjnf6sk7zky@fedora>

--GQ8SeD7mnUgi55czSFwVU0g6F1at1VhsO
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello Quentin,

thank you for having a look. I haven't figured out how to prepend a=20
reply in front of the v2 patch, so replying here as a separate eMail.

Am 13.08.2021 um 10:05 schrieb Quentin Schulz:
> On Thu, Aug 12, 2021 at 04:01:33PM +0000, o.mandel@menlosystems.com wro=
te:
>> --  ``--size``: The minimum partition size in MBytes. Specify an
>> [...]
>> +-  ``--size (in MBytes)``: The minimum partition size. Specify as an
>=20
> I'm not really fond of saying it's in MBytes here just to say a sentenc=
e
> later that it can be something else. Especially since I would understan=
d
> 35K to be 35000 MBytes and not 35 KiB.
> The explanation is sufficient to me, it's less confusing IMO.
>=20
Removed in v2. I tried to unify the format I saw in some other options,=20
but yes: it makes no sense here.

> [...]
>>      extra space after the space filled by the content of the partitio=
n.
>>      The final size can exceed the size specified by the ``--size``
>> -   option. The default value is 10 Mbytes.
>> +   option. The default value is 10 Mbytes. Specify as an integer valu=
e
>=20
> MiBytes instead of MBytes I assume.
>=20
Yes. I went with just saying 10M in v2 for brevity: the explanation of=20
that is right in the next sentence.

Thanks,
Olaf
--=20
Olaf Mandel
Tel +49 89 189 166 0
Fax +49 89 189 166 111
o.mandel@menlosystems.com
https://www.menlosystems.com

Menlo Systems GmbH
Bunsenstra=C3=9Fe 5, D-82152 Martinsried

Gesch=C3=A4ftsf=C3=BChrung: Dr Michael Mei, Dr Ronald Holzwarth
USt-IdNr. DE217772017, St.-Nr. 14316170324
Amtsgericht M=C3=BCnchen HRB 138145


--GQ8SeD7mnUgi55czSFwVU0g6F1at1VhsO--

--HcL9hvIppHDrBaEuMQLhguU0b2U2rBFXy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEErGOsr28GGMKRE/TmVL2dtGJSHf8FAmEWMNkFAwAAAAAACgkQVL2dtGJSHf9L
UAf/Q7+RDdsFmp5vuSsEIe5VdYwH8lYVVm0HYWja3B3ak7IRRHSvGZNi4+pGBtGKHZ5/7VajTiNv
jHX6JZ0d2VDlB7GK0Pxl2Q4Yqo7cChC42Y+S34bAKI6OWzidPx16MkKDP554moXVeUJuJp9c/wnl
a/F6uS7/dteJNs/nESqvURVnOS0VRMR3zjk9Tkm7Im4nvIjpOTvkuIUqSyJkX1hQqSBdwGvD66QF
voJrd8uXbkpvOU9VvDb2hZcUbXoZ7a1VaJjju2iXxjffsbGXtuBOSC/fvkeBr90wD6w2lo8MLTPe
V60D+A5Ue2QdQfyjFXoM+AUQXEcUoUUF8ySnKCMh3Q==
=O2d2
-----END PGP SIGNATURE-----

--HcL9hvIppHDrBaEuMQLhguU0b2U2rBFXy--
