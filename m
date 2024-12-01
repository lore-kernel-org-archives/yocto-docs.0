Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4405FD4977B
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 17:38:23 +0000 (UTC)
Received: from bumble.maple.relay.mailchannels.net (bumble.maple.relay.mailchannels.net [23.83.214.25])
 by mx.groups.io with SMTP id smtpd.web11.156375.1733074693200330553
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Dec 2024 09:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=iY5Xxh4F;
 spf=pass (domain: rootcommit.com, ip: 23.83.214.25, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B3BC0C1355
	for <docs@lists.yoctoproject.org>; Sun,  1 Dec 2024 17:38:12 +0000 (UTC)
Received: from fr-int-smtpout2.hostinger.io (trex-5.trex.outbound.svc.cluster.local [100.125.48.165])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 12D56C1CB0
	for <docs@lists.yoctoproject.org>; Sun,  1 Dec 2024 17:38:11 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1733074692; a=rsa-sha256;
	cv=none;
	b=NxAS8VWOryirnW3yV4LXnErr5Drds9+IIxgTYiQyTEpK6cHQkeVgSaRyW+WyLIiGvfn85j
	Y53/l7j5hNE6fhFMHSweWmQhzxeEfLyHbmmPK77mq4Fnc0qlfKikqLnfavcG677VRz5dEU
	P4syx82eD/cbw3cqunGHP9nsSF6TpFwQ4F4BaXji2W5L2JFnC/jO3l10Ow5Lzn/7cZsNga
	7kbseNajakA/b1r4l82DQbr46YsLefkQpIBMHShVzuzYXmzj67f3F6Q0Pp6vv/0tATItCk
	Ra1SDPYhumN+tLcoRimN6wc8iq4q54TNaEojMamm5SRb0G51+DIcSYjyIXPoIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1733074692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=2vG40j1uZgiehIhXY+PuTQaPpqoCuV5wwV9FLFcYrqI=;
	b=yz79VARZZANvq9dRCQVX6wo6WOELf6dGULykPT1PYP0+bLA6FTxOJUQm0bG3Au9zV2Sqqf
	1TQ47UA/qW94+0EHJzKNLWwFk1rceuLbrkd3kpSVePVe/fe7bRORZDWGz/4kQm0Lt7WJ9p
	VEOtVDd9m6aHDb/HYoSSLTlsfiePOoSicNLbbOaOKIWfDTZoBUHXm2tEm0SqVrrDYu6OPI
	uzL5Aqz4eRPxCtAALwIcm1dASaX1qElql9u66feuCCsyHxjs3j00VpfW0CW+H84/zGcrTt
	drHw7vqkJO+1WIPUqYMK1ye9wVg2KcSmUXwI8/1Q/iAabGfERc68SeEan8DV6A==
ARC-Authentication-Results: i=1;
	rspamd-fc7fd4597-7h2gj;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Army-Whimsical: 56196ae560922b8f_1733074692606_58731269
X-MC-Loop-Signature: 1733074692606:2481312418
X-MC-Ingress-Time: 1733074692606
Received: from fr-int-smtpout2.hostinger.io (fr-int-smtpout2.hostinger.io
 [89.116.146.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.125.48.165 (trex/7.0.2);
	Sun, 01 Dec 2024 17:38:12 +0000
From: michael.opdenacker@rootcommit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1733074690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2vG40j1uZgiehIhXY+PuTQaPpqoCuV5wwV9FLFcYrqI=;
	b=iY5Xxh4FqMDbgCa1NT+kd2GILgblZbTj7m6M6lF+6zHzk3HI73WjsSgVsxx5VTPbJAFFZJ
	noPRFneWjVJR9JIP4+gklq1/A+4ERJcZSsiKaW51WfUpGClQNBxZOTmgilk3yVpWW5TH8g
	3d5yXDjH6rEc0D145bvdgyaUqa1BPQ86mCXRQlouzIxIge4WrNhehqMT9ea7hDlIloCmkj
	kcUTUKUCDpiXnAco6Yr0Y0KCPEZ6vI4v+vaCVIBUC9GA5J8xeIXrLB47R82XDV1HN3K6M3
	CXiMDNjJets5memdxK6GIvLtPRaSiTGXAizc+N8ZUgnDRBDGf4VatCy63//ghw==
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 2/3] dev-manual/bmaptool.rst: add missing command for bmaptool-native
Message-ID: <20241201173801.3290796-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201173801.3290796-1-michael.opdenacker@rootcommit.com>
References: <20241201173801.3290796-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Sun, 01 Dec 2024 17:38:09 +0000 (UTC)
X-CM-Envelope: MS4xfNf85IS+KEXXGTAMd0zVlyZc7mFn+WnVUb5GENEBRw/bB8xsPLhta8qSYr7/d+4XnRJLwX/7PExoRfwbHPOIswouk/c2CcSLCIAWluyQ5/W2CG8SMmZz 5kqZM3k57z9UKdHyrMP5SFbp4Objb1Gs0mHHfEKj1BZjq6Bi2Q9PSZ27uqIMOegvsBoXq6qhIRhE+efEK4r9zkNcnJVEPfbbNTS6mKwtuEBNvSbpq1eJVuDq FEM4tzoPHVfl1PvQz/d82PTxPlXkZ0oQTXV40EdWUX08+hsR5XuK6r452L+Y5K7e33/CmVWYsc4Ex8Mlh2/djQ==
X-CM-Analysis: v=2.4 cv=HfJGTTE8 c=1 sm=1 tr=0 ts=674c9f02 a=uS5QZ7/yp/8NfNiMt4lERQ==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=ktER-WpcwBuqhVnq6sEA:9 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 01 Dec 2024 17:38:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5859

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Otherwise, running "oe-run-native bmaptool-native bmaptool ..."
fails as follows:

Error: Have you run 'bitbake bmaptool-native -caddto_recipe_sysroot'?

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 documentation/dev-manual/bmaptool.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-ma=
nual/bmaptool.rst
index 493abf7607..5fc46c7792 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -23,6 +23,7 @@ system image files much faster.
       need to build `bmaptool` before using it. Use the following comman=
d::
=20
          $ bitbake bmaptool-native
+         $ bitbake bmaptool-native -caddto_recipe_sysroot
=20
 Following, is an example that shows how to flash a Wic image. Realize
 that while this example uses a Wic image, you can use `bmaptool` to flas=
h

