Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AFAC636D3
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 11:33:41 +0000 (UTC)
Received: from out-126.mta1.migadu.com (out-126.mta1.migadu.com [95.215.58.126])
 by mx.groups.io with SMTP id smtpd.web10.20811.1675251213910879273
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Feb 2023 03:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=LBYS11Ek;
 spf=pass (domain: g0hl1n.net, ip: 95.215.58.126, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1675251211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AylbjLS/BuwMfdyguVc+3itxTGR6xTfs8lPlv3xdwkg=;
	b=LBYS11EkvMlR5E8BrIrRzEAOL/8hDJh2dtM8GrheIgjwYTKl64dm7U4mzyj87ki9z8a57J
	TGVeRXeuiW5wtVacY1VSly0wR58Dkq8k/io+8u+y6N6hpL+187I3ozP5rjCWDVeVf6adbp
	RMKdlh1wn4bRrIiEqmmyt2yCLoXRxPQ=
From: dev@g0hl1n.net
To: docs@lists.yoctoproject.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [PATCH] ref-manual: variables: FIT_KERNEL_COMP_ALG: add lzo
Date: Wed,  1 Feb 2023 12:33:17 +0100
Message-Id: <20230201113317.586974-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Feb 2023 11:33:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3629

From: Richard Leitner <dev@g0hl1n.net>

OE-Core rev f1257d61b76d027d4ece734439993b6bf4e48907 introduced support
for using lzo as compression algorithm for fitImage contained kernel
images.
This patch adds the corresponding documentation to FIT_KERNEL_COMP_ALG
and FIT_KERNEL_COMP_ALG_EXTENSION.

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 documentation/ref-manual/variables.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 725f5c54c..edc3aa652 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2892,13 +2892,14 @@ system and gives an overview of their function an=
d contents.
=20
    :term:`FIT_KERNEL_COMP_ALG`
       Compression algorithm to use for the kernel image inside the FIT I=
mage.
-      At present, the only supported values are "gzip" (default) or "non=
e"
+      At present, the only supported values are "gzip" (default), "lzo" =
or "none".
       If you set this variable to anything other than "none" you may als=
o need
       to set :term:`FIT_KERNEL_COMP_ALG_EXTENSION`.
=20
    :term:`FIT_KERNEL_COMP_ALG_EXTENSION`
       File extension corresponding to :term:`FIT_KERNEL_COMP_ALG`. The d=
efault
-      value is ".gz".
+      value is ".gz". If you set :term:`FIT_KERNEL_COMP_ALG` to "lzo",
+      you may want to set this variable to ".lzo".
=20
    :term:`FIT_KEY_GENRSA_ARGS`
       Arguments to openssl genrsa for generating RSA private key for sig=
ning
--=20
2.39.1


