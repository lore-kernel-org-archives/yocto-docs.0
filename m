Return-Path: <rich@richelberger.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2286C64ED8
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 20:14:42 +0000 (UTC)
Received: from a10-70.smtp-out.amazonses.com (a10-70.smtp-out.amazonses.com [54.240.10.70])
 by mx.groups.io with SMTP id smtpd.web10.29125.1677269673981837374
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 12:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@richelberger.com header.s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd header.b=L/MYW8Kx;
 spf=pass (domain: amazonses.com, ip: 54.240.10.70, mailfrom: 010001868510232c-5929cc94-ce2e-4817-b311-3ea6f58a267c-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd; d=richelberger.com;
	t=1677269672;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id;
	bh=CdjYGt1eNld1sLRoglEvcjIDsxTm3+suAXgwDwxA2K0=;
	b=L/MYW8KxbjXIEcPX77LOBmY9unsVZuuacPRREUOt4Y3vt4DhMeONt8bhF0Co4qsQ
	xRzPjVwtndMauZAFKDlkA4FZVnqsMHAKszNTLYtvcAPB8jL6os0ObgqzqPdVcTP40Yr
	MkFy5rLv0i0kelRVxQRUnr2cI3DCJCcfAxjHMDJc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1677269672;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id:Feedback-ID;
	bh=CdjYGt1eNld1sLRoglEvcjIDsxTm3+suAXgwDwxA2K0=;
	b=abuEIi2Cf2K/cWJsx5BGpSuESkGEafEMR5fV+9VbFhRmfMSBL7vb37E4TYvproWc
	TL6YIMLU6EoB9M3y3bpbLosWD8PGncP4az6c+gYviekcO017ZJIIqDeH4HyOJWTrIna
	toftfJ4whytXxB1n2a4h/4wob07ziPV8mQtJZqyg=
Subject: [PATCH] documentation: bitbake: add file-checksums to varflags
 section
From: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
To: =?UTF-8?Q?bitbake-devel=40lists=2Eopenembedded=2Eorg?=
  <bitbake-devel@lists.openembedded.org>
Cc: =?UTF-8?Q?docs=40lists=2Eyoctoproject=2Eorg?=
  <docs@lists.yoctoproject.org>, =?UTF-8?Q?Richard_Elberger?=
  <rich@richelberger.com>
Date: Fri, 24 Feb 2023 20:14:32 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <20230224201426.357606-1-rich@richelberger.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHZSIyaIxX+jF56Q0uWGR6i9QqucA==
Thread-Topic: [PATCH] documentation: bitbake: add file-checksums to varflags
 section
X-Original-Mailer: git-send-email 2.34.1
X-Wm-Sent-Timestamp: 1677269671
Message-ID: <010001868510232c-5929cc94-ce2e-4817-b311-3ea6f58a267c-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.24-54.240.10.70
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Feb 2023 20:14:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3740

Fixes [YOCTO #11605] by:=0D=0A=0D=0A- Adding definition of file-checksums=
 to Variable Flags section.=0D=0A- Describe data to add to list which add=
s external file dependencies.=0D=0A- Write example on usage to prepend a =
value to file-checksums list.=0D=0A=0D=0ASigned-off-by: Richard Elberger =
<rich@richelberger.com>=0D=0A---=0D=0A .../bitbake-user-manual-metadata.r=
st                  | 11 +++++++++++=0D=0A 1 file changed, 11 insertions(=
+)=0D=0A=0D=0Adiff --git a/doc/bitbake-user-manual/bitbake-user-manual-me=
tadata.rst b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst=0D=0A=
index deb7afad..c2f0cad2 100644=0D=0A--- a/doc/bitbake-user-manual/bitbak=
e-user-manual-metadata.rst=0D=0A+++ b/doc/bitbake-user-manual/bitbake-use=
r-manual-metadata.rst=0D=0A@@ -1496,6 +1496,17 @@ functionality of the ta=
sk:=0D=0A    directory listed is used as the current working directory fo=
r the=0D=0A    task.=0D=0A=20=0D=0A+- ``[file-checksums]``: Controls the =
file dependencies for a task. The=0D=0A+  baseline file list is the set o=
f files associated with=0D=0A+  :term:`SRC_URI`. May be used to set addit=
ional dependencies on=0D=0A+  files not associated with :term:`SRC_URI`.=0D=
=0A+=0D=0A+  The value set to the list is a pair where the first value is=
 the=0D=0A+  file name and the second is whether or not it physically exi=
sts on=0D=0A+  the filesystem. ::=0D=0A+=0D=0A+    do_configure[file-chec=
ksums] +=3D "${MY_DIRPATH}/my-file.txt:True"=0D=0A+=0D=0A -  ``[lockfiles=
]``: Specifies one or more lockfiles to lock while the=0D=0A    task exec=
utes. Only one task may hold a lockfile, and any task that=0D=0A    attem=
pts to lock an already locked file will block until the lock is=0D=0A--=20=
=0D=0A2.34.1=0D=0A=0D=0A

