Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FC2D49780
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 17:38:23 +0000 (UTC)
Received: from bird.aspen.relay.mailchannels.net (bird.aspen.relay.mailchannels.net [23.83.221.17])
 by mx.groups.io with SMTP id smtpd.web11.156377.1733074694759276846
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Dec 2024 09:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=CX4uZqRP;
 spf=pass (domain: rootcommit.com, ip: 23.83.221.17, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C374F842D32
	for <docs@lists.yoctoproject.org>; Sun,  1 Dec 2024 17:38:13 +0000 (UTC)
Received: from fr-int-smtpout2.hostinger.io (trex-7.trex.outbound.svc.cluster.local [100.122.114.61])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 16289842D1E
	for <docs@lists.yoctoproject.org>; Sun,  1 Dec 2024 17:38:12 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1733074693; a=rsa-sha256;
	cv=none;
	b=nkIW6bjkBfC653AFNCJN1KvWO7Uha2rYHuuqCl5Rw0J3IZC4JWQBzTYbn92FqIMLtLOIAg
	8Iez0GlKv6ZBzkpUNP4dQYKLY009DRQgD304bw++yxt/936plKPHvQLfL2KYlDlaUKUfkG
	S/G6kM2jFvvBkvafh5ZG4lPKLPJ9A41kUoQKfgv9l03R5Fy+M6t7khugTng0H4mXdz36vz
	1fmmIeMtQNKJd7SA9l/suhRXQ79VurRrq0B8PnDtGeaXsUoVOQeAwue7GIJvR83aPDmMvd
	GrXg+9cr2akQRUXHPrsNwYVzn94WA5oIRej2HR1gP1I4F9TGNGiMrwQEZik/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1733074693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=XL11T/92g25Li99Hds/gzR38tA3QmUk09XOfVfk2HjY=;
	b=eRqQbxa5RD9teQKS9W2M8Ey632uN39RXJF0QHCSIXnNdMdwXZK7yFdfmT+GS2wLLRuCyhM
	Wj8Qhpk3WORDuIqvM8eY/U6M6SHjLyyZYZSYFZMbJnY8/F+QZ3ucNU5qWUluCyz4NMKn0A
	3dTq6VY/iE4OQmJ8UlSXz8XFq+fE+RNjIkUAw2I2EFofuEXDfY14EG8qjSkP3Glavv9Tad
	Ws8HznWgbsek8LDKKL2sQMz4S5gmQ2/Inva/r8YNd4H0WfdB0un7bYHN6A66WfRvw3YIgl
	l6ROXeGkKMY8FTSU0mFrjlcS2tjy/PeAzyA+/lPLE0wWu+VZyTB5hKTo5y8rng==
ARC-Authentication-Results: i=1;
	rspamd-5d9d86ff64-v6wfl;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Bad
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Industry-Supply: 786141fe650b3ba5_1733074693574_2055758595
X-MC-Loop-Signature: 1733074693574:1595686961
X-MC-Ingress-Time: 1733074693574
Received: from fr-int-smtpout2.hostinger.io (fr-int-smtpout2.hostinger.io
 [89.116.146.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.122.114.61 (trex/7.0.2);
	Sun, 01 Dec 2024 17:38:13 +0000
From: michael.opdenacker@rootcommit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1733074691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XL11T/92g25Li99Hds/gzR38tA3QmUk09XOfVfk2HjY=;
	b=CX4uZqRPE0I8fcZApRDETzLdWx+28EjXgMuSh9mFVDVg35LnAbDb3JHXGFxfxhC+/H9Uln
	DNyv+oFU6cPA/UFfQNkCr1ICXdgrkbUnVBg8rtJagFgAgW8y6DQwZfer2z5vdAZzwIRrgk
	010GmgF0KJxHfthqGPsAUDxzVUKFHo5kpSJqK2e2lAIhssJ7xtjR5i+WyEk6TLtBQdFdGc
	YAC+VlZzbwvFK0EPxv5/tN1FCpvyk0/S42wc2TQUZWIU1NQwmVBg/dlcWKqzZOAawOUcev
	/dE5UE7v6WD1SSpPAGLnYauRLRgYJRgiUuj5wa9VKEUGkOiX4XWRFHaACf6FUg==
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 3/3] dev-manual/bmaptool.rst: simplify and fix instructions
Message-ID: <20241201173801.3290796-3-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201173801.3290796-1-michael.opdenacker@rootcommit.com>
References: <20241201173801.3290796-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Sun, 01 Dec 2024 17:38:10 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=HfJGTTE8 c=1 sm=1 tr=0 ts=674c9f03 a=uS5QZ7/yp/8NfNiMt4lERQ==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=K0np5UDMr5CNkJvIeKUA:9 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfLW0mTTpgvojuDwYEDfrt9CVCNZL6J9GLrXUiutDHwl0jI8rbiYKnSglbFKmB94h2b7X314TebqAuNXhBSpR4L+/NdM1eJgvBb8Jkw+oK0CK9Sk5HZ44 R5cWASkoJGUAVQvFMzn4AWeWUtD5rjB4vql0WiRULj2SR5HN7nt/FmDDjUQNZ0DnWBsE/UqkoC3LH2JiU5PSnroBUOpglU6ckOxVjnGPDb8wjZ1nfps7TPLx zt57jUFESGhjBdhrevmQQWn1wGfPE4KsCnrQaa5s9xNOKnpx5lG6IEEhHOxwdwyfnIeCSn1Qg6o4pN+HfVdTbA==
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 01 Dec 2024 17:38:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5860

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

- Remove duplicate instructions

- Detail how to run bmaptool directly if you installed it on your host
  instead of building it through the ``bmaptool-native`` recipe,
  as running "oe-run-native bmaptool-native bmaptool ..." won't work
  in this case.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 documentation/dev-manual/bmaptool.rst | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-ma=
nual/bmaptool.rst
index 5fc46c7792..e17074b65b 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -44,14 +44,16 @@ any type of image. Use these steps to flash an image =
using `bmaptool`:
    depending on your particular setup. The following commands assume the
    image resides in the :term:`Build Directory`'s ``deploy/images/`` are=
a:
=20
-   -  If you have write access to the media, use this command form::
+   -  If needed, set permissions to get write access to the media::
=20
-         $ oe-run-native bmaptool-native bmaptool copy build-directory/t=
mp/deploy/images/machine/image.wic /dev/sdX
+         $ such chmod 666 /dev/sdX
+
+   -  If you installed the package for `bmaptool`, you can directly run:=
:
+
+         $ sudo bmaptool copy build-directory/tmp/deploy/images/machine/=
image.wic /dev/sdX
=20
-   -  If you do not have write access to the media, set your permissions
-      first and then use the same command form::
+   -  Otherwise, if you built `bmaptool` with BitBake, run::
=20
-         $ sudo chmod 666 /dev/sdX
          $ oe-run-native bmaptool-native bmaptool copy build-directory/t=
mp/deploy/images/machine/image.wic /dev/sdX
=20
 For help on the ``bmaptool`` command, use the following command::

