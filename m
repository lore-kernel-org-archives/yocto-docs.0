Received: from smtp.ignu.fr (smtp.ignu.fr [62.210.253.102])
 by mx.groups.io with SMTP id smtpd.web11.3728.1614845060288915888
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 00:04:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@gillesmaire.com header.s=gilm header.b=p06S5jDt;
 spf=pass (domain: gillesmaire.com, ip: 62.210.253.102, mailfrom: gilles@gillesmaire.com)
Received: from localhost (smtp.ignu.fr [127.0.0.1])
	by smtp.ignu.fr (Postfix) with ESMTP id E9B0B3420139
	for <docs@lists.yoctoproject.org>; Thu,  4 Mar 2021 09:04:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gillesmaire.com;
	s=gilm; t=1614845058;
	bh=rLE13wL2SZvgC1CuxjtKyeUH5WFqFL1koF2ntyLFjcs=;
	h=From:Subject:To:Date;
	b=p06S5jDtRpeHFDOq/7Ik7SEFB1f2TddRAIIN3Bic2UdwCkWmnaWQE/ekLgGJrkvS/
	 zhqD44X44XCt2TAhYP6ynqGgGfJEjVH9ZAHEB2AJlnt0Y04+H/f2orRXqCUt+Coh3P
	 qzrjf1S+9xhd0jylcRwajRjNAdNczLf7DOwUP5b/AQh+s3p7pmhd1ooP5X9SFSVEND
	 Vq44POYDb8qUJFAIB3xoOz/veHkcmFYfQ8Z9u1z33gil+qTZgjqtHsF1RKj2v7vxmD
	 8Xip553ZIes9ELzbTni3CUU379qA8mm9qM3mj/JXuKRcUDkacXaTScCDSb9xl1gIav
	 HojzJ+Nnd8/tw==
X-Virus-Scanned: Debian amavisd-new at ignu.fr
Received: from smtp.ignu.fr ([127.0.0.1])
	by localhost (ignu.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IiulwtMLd7q0 for <docs@lists.yoctoproject.org>;
	Thu,  4 Mar 2021 09:04:08 +0100 (CET)
From: "Gilles Maire" <gilles@gillesmaire.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gillesmaire.com;
	s=gilm; t=1614845048;
	bh=rLE13wL2SZvgC1CuxjtKyeUH5WFqFL1koF2ntyLFjcs=;
	h=From:Subject:To:Date;
	b=L2yUjQ8iRnhYQoSJBFxkVz2gUTPbZogyPHzCOP28DV54ioAAHR3ufxJP0HANi96iC
	 /cVdvjEQEEg9GmbMgu+25TUxTG/kXlRDN3kNE0+XwSud0DgGwcjSvlFvJW3mUHS2es
	 vQNRpbIqUFVktRlgYbguTCnujF+Q6BNd5BKxSWTXxREAWBkbvtl1muhfDJ5xim7x5f
	 BAka8nKA52kQz0+aLEDu76Ef4QXnvL2TDrUwo2nfl8FcR7DCE7SZjOpHNhXmX3SCND
	 fd8M3T/yeKeRFhwt4Ioiy2Y3NQbr2/dLyUKByur02AxRzO5gfkqC0QwTxbueaGRJzs
	 QSuyEMl7HPS7w==
Subject: bitbake user manual
To: docs@lists.yoctoproject.org
Message-ID: <5bc0c0d6-10c6-c264-8026-ac7997d20e0e@gillesmaire.com>
Date: Thu, 4 Mar 2021 09:04:08 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------29FFBCA00581F5D1AA5D5696"
Content-Language: fr

--------------29FFBCA00581F5D1AA5D5696
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable


  Hello

  in 6.4 chapter under 9 point Creating a layer


  BBPATH .=3D ":${LAYERDIR}"
  BBFILES +=3D "${LAYERDIR}/\*.bb"
  BBFILE_COLLECTIONS +=3D "mylayer"
`BBFILE_PATTERN_mylayer :=3D "^${LAYERDIR_RE}/"

from the bitbake user manual chpater 6

You have to suppress the `at begining of the last lines ..

I tested the example after correction with the bitbake installed from pok=
y and got these results :

WARNING: Layer mylayer should set LAYERSERIES_COMPAT_mylayer in its conf/=
layer.conf file to list the core layer names it is compatible with
 =C2=A0Loading cache: 100% |                                             =
                                                                         =
                                             | ETA:  --:--:--
Loaded 0 entries from dependency cache.
WARNING: No bb files in default matched BBFILE_PATTERN_mylayer '^/home/gi=
lles/mylayer/'
ERROR: Nothing PROVIDES 'printhello'

Summary: There were 2 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


Sd you see why ?

Thanks



--------------29FFBCA00581F5D1AA5D5696
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <br>
    <pre style=3D"box-sizing: border-box; font-family: SFMono-Regular, Me=
nlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quo=
t;, Courier, monospace; font-size: 12px; white-space: pre; line-height: 1=
.4; margin: 0px; padding: 12px; display: block; overflow: auto; color: rg=
b(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: left; text-indent: 0px; text-transform: none; widows: 2; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thicknes=
s: initial; text-decoration-style: initial; text-decoration-color: initia=
l;"> Hello=20

 in 6.4 chapter under 9 point Creating a layer


 BBPATH .=3D ":${LAYERDIR}"
 BBFILES +=3D "${LAYERDIR}/\*.bb"
 BBFILE_COLLECTIONS +=3D "mylayer"
`BBFILE_PATTERN_mylayer :=3D "^${LAYERDIR_RE}/"

from the bitbake user manual chpater 6

You have to suppress the `at begining of the last lines ..

I tested the example after correction with the bitbake installed from pok=
y and got these results :=20

WARNING: Layer mylayer should set LAYERSERIES_COMPAT_mylayer in its conf/=
layer.conf file to list the core layer names it is compatible with
=C2=A0Loading cache: 100% |                                              =
                                                                         =
                                            | ETA:  --:--:--
Loaded 0 entries from dependency cache.
WARNING: No bb files in default matched BBFILE_PATTERN_mylayer '^/home/gi=
lles/mylayer/'
ERROR: Nothing PROVIDES 'printhello'

Summary: There were 2 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


Sd you see why ?=20

Thanks
</pre>
    <br>
  </body>
</html>

--------------29FFBCA00581F5D1AA5D5696--
