Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49756C433FE
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 14:49:29 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.6573.1664635763405939781
 for <docs@lists.yoctoproject.org>;
 Sat, 01 Oct 2022 07:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=M7oTEfyw;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1664635764;
  x=1696171764;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=IiCgilPpNdmAkwRuOi8yJVogInALRTlL27e1qMciciA=;
  b=M7oTEfywthwv7EIO8Hm16On6Qpwg77g0i5kE5qx/auIY/U+cHu9rb5GX
   5ani4D3+9wtjtQibxv0htTRrxb5huEjRpWWA+RSO/4nXHIhx9NHx6XLJY
   LchHkOWOgfiqepCAs5Iwxvhl26GT/IUW4/VVbR3wG8TxwFd/YXuNC+G1m
   goqGRwS6oKRMz21646VAusWXA2EEpLaJHNPGkn57oLSWqVva01oNdu4RM
   xHFeakc7tajBx2ciGJAkVywil5Oo/OkEXZnrriCYP6I2djXFD02akC6By
   at3UMFFWEt328ItQYOJedWZUMzTL609y/NtrYODW8ZB8kODjl2ZdMk2pc
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Yocto Documentation (docs@lists.yoctoproject.org)"
	<docs@lists.yoctoproject.org>
Subject: Incorrect minimum versions shown for GCC and make
Thread-Topic: Incorrect minimum versions shown for GCC and make
Thread-Index: AdjVo0d6xTPqRE6VQMyFr4WU4bXblw==
Date: Sat, 1 Oct 2022 14:49:21 +0000
Message-ID: <e50abe3c777e4a23a752a3ec25ad0b2a@axis.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 01 Oct 2022 14:49:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3259

If I look at=20
https://docs.yoctoproject.org/dev/singleindex.html#compatible-linux-distrib=
ution
the minimum version for GCC is shown as "5.0", while the minimum version=20
specified in documentation/poky.yaml.in (MIN_GCC_VERSION) is "7.5".

And the minimum version "&MIN_MAKE_VERSION;" for make indicates that=20
the MIN_MAKE_VERSION variable is not defined, but in=20
documentation/poky.yaml.in it is set to "4.0".

Based on the above, it seems the development documentation is using the=20
poky.yaml.in file for Kirkstone rather than the one for Langdale.

//Peter


