Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAF6E77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 14:47:16 +0000 (UTC)
Received: from fuchsia.ash.relay.mailchannels.net (fuchsia.ash.relay.mailchannels.net [23.83.222.64])
 by mx.groups.io with SMTP id smtpd.web10.107012.1734533226021038642
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 06:47:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=oITzdoYe;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.64, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DF4171A3DB8
	for <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 14:47:04 +0000 (UTC)
Received: from nl-srv-smtpout3.hostinger.io (trex-2.trex.outbound.svc.cluster.local [100.98.196.143])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 433431A3D0B
	for <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 14:47:04 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1734533224; a=rsa-sha256;
	cv=none;
	b=4EKOaD8hbmBeV9s0X3MUpjooea02rAvgqHtqIPOdCQSJdW0ljEdJK3OwnjKOI7x92BP2v6
	PK0bcj01R8YJzMSfd9xc6yH6P9nBOREBWh+kJOplJHQjmrDiDAyw4c47S3hWR7YynmCJBz
	2vvNxlhtHo93uR3dTk2WPLemyTzeM87l33+HT1P+GDnebSUjHZ+ivGolkVOmBfLWUOMBf0
	ehyfo+5aFbzswq+Gx8Zxnxh9xfqFy+5dOZb2SFGBGcY0MmgEynauiM5SkkGptsxExEXocg
	tc5cUtp79Kboee0AAPs4A+5Vr5yeXPu3ZY87Y+1QL17AcYDLuQ+v3IOhcD8CBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1734533224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=DWBh/o7JwRzXE787Ccd4WPFFCi3kbF3CyzQerGOVQNk=;
	b=mHGjxQ9IApJ/lwpONwl6K4QuHlYchRtgjqdOGW6FiDWWlcZZM74TLYwkK0FIHORAKaPs58
	JyYVPvSRTa8WwagRxOq+Pjw6d4zsnLwItPK7fIU8dG6iKDZe+IT5V1ZmNJy77ofjms19Q4
	jtfo53ceywponSJOzIR0RuT3v6BpjH9JRF3qn520xEBJBB8yOfHFt2jvqAR8H/Aa4SI9YH
	+R7P+wN9FiYwCl+cF5ZvmGoJPJaQmFcvDHaqGlP6l/iRI+5fPdcDNw5m/puoTE9bR4EonS
	6DYoVEY00N/VneS+JmVcx37mLpcNqRxN2JnjGQ3GiAoQ9Q7AQhd9RFyZ6xxpeA==
ARC-Authentication-Results: i=1;
	rspamd-65b7488cc6-vknhc;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Minister-Reaction: 5569f1594ef73b94_1734533224791_2026880605
X-MC-Loop-Signature: 1734533224791:2610746854
X-MC-Ingress-Time: 1734533224791
Received: from nl-srv-smtpout3.hostinger.io (nl-srv-smtpout3.hostinger.io
 [145.14.159.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.196.143 (trex/7.0.2);
	Wed, 18 Dec 2024 14:47:04 +0000
From: michael.opdenacker@rootcommit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1734533222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DWBh/o7JwRzXE787Ccd4WPFFCi3kbF3CyzQerGOVQNk=;
	b=oITzdoYe+JaXt4olWTrhOWJyNdCTu+B9pgkQw5TBOZb+sruwzKQhrpX+T8KHUKPJT3fYwa
	X2/lfA++x+HU55Pm/+WJD1kJqD9KAONazDuaomiigtO1K1VuxtMQjo9Wn8MHZx0CafFHU7
	DQFeyYLxcweMPPqL8b6eOIM8nV4WcvfV9+cIrFwCrDiyY/3GlwCz+apvHInE3zpS8EvaoB
	EaRfdxWM+fOxA88DGwc3F0Eyn0Dd+AK7mzWcXc9l+b7rOZQLROsx5pOIjAOo4HzLdcINJ6
	ymKaktDagzwQH4RF/gQagYTZ6tFvevpPtEpa9cTpqnxnwT7Vzp2Oj5ykClyCSA==
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v3 2/3] dev-manual/bmaptool.rst: correct command for bmaptool-native
Message-ID: <20241218144654.852310-3-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218144654.852310-1-michael.opdenacker@rootcommit.com>
References: <20241218144654.852310-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 18 Dec 2024 14:47:02 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=c/P5Qg9l c=1 sm=1 tr=0 ts=6762e066 a=gK8Kn/iQ+cr19mtFy27wxg==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=rJ4S2n_EE8Q4mpNx-akA:9 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfEDKJkAfaIR+5UyborfAHAvEau66vLKrewdNwvO5gQvTYn+sHEP1qJy9Vxpo9hZLciD1WmBwgnmpcdwk5cuZUQONvzIDkdKm8Dr5f+1vh9xlyMO+Pbx8 5OsoHFZqT5hX2/JvjJL96u5jPKYEakrzJ6i2L01HZQLjXbRskCanDTKK19w2e3gFGhxhLUa6+R9v65a7P4B+w+JN6b7HQsED95A7r7vY03xA/snGyoWghejX pU2TTLRq8+G6Wa6s1sY5dAiZ0CLH/LKNUqV8/nICghCsjvBbz9pGVttnS9IKOFRURGj/SbRNPs046jmeZMxlWw==
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 14:47:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5979

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Using only "bitbake bmaptool-native", running "oe-run-native bmaptool-nat=
ive bmaptool ..."
fails as follows:

Error: Have you run 'bitbake bmaptool-native -caddto_recipe_sysroot'?

Running the "bitbake bmaptool-native -caddto_recipe_sysroot" target
is actually sufficient.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 documentation/dev-manual/bmaptool.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-ma=
nual/bmaptool.rst
index 493abf7607..37083c9c64 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -22,7 +22,7 @@ system image files much faster.
    -  If you are unable to install the ``bmap-tools`` package, you will
       need to build `bmaptool` before using it. Use the following comman=
d::
=20
-         $ bitbake bmaptool-native
+         $ bitbake bmaptool-native -caddto_recipe_sysroot
=20
 Following, is an example that shows how to flash a Wic image. Realize
 that while this example uses a Wic image, you can use `bmaptool` to flas=
h

