Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28392E7718A
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 14:47:06 +0000 (UTC)
Received: from glass.ash.relay.mailchannels.net (glass.ash.relay.mailchannels.net [23.83.222.70])
 by mx.groups.io with SMTP id smtpd.web10.107009.1734533223317457799
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 06:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=cUZwzx+E;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.70, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1EC5A8A3466
	for <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 14:47:02 +0000 (UTC)
Received: from nl-srv-smtpout3.hostinger.io (trex-0.trex.outbound.svc.cluster.local [100.98.157.102])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6AB4E8A3F9F
	for <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 14:47:01 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1734533221; a=rsa-sha256;
	cv=none;
	b=geGoCGtOWLl09jrWqPwYQPXjyEVJd+QDnVYpJY1hEoS7iu7U8LWBjXcEwqXIPGBAGL5vUh
	lKUL9pEwQMowBUlHsA49uNUfHKU/CVNEn90EWARbqJS7rcSWPPSFLKBuHgl6XVmNo1agyb
	lqQjJW/qJXs+FqCNBYXwvmx83BgyCiAudxPa98URwIUhc14jYLRCeQlg0HNTRr9w4dzvZ9
	yHUo+vAbtWxU+oUN6hI6nPoOYv5xJnE7scKkfdSXyOWmNGW4KWFfQ972xVpvjsoiiKDjkR
	FtN2bnHF6Jyvvij/af7qc/KmtkvcaCNZV1nguA+04V0JcvYm8j7rqWwpIOaawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1734533221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=XuXM4xJFUeOKGggVuktBkmgUw6D2OnjmnLd/WeMVXFE=;
	b=rYeRWqiNUYlR4bWIq1ofemWksI0aEwJvZ30nVMnsOgU7zEJxWtOgiQY66DipX8h76MpqxA
	kay1a9nq/JxZqUGl4qbY1rwyZg7GTW6Nr1xYN6Xdz8Ixb6IXnXdC1IbkIyHYk5nENhWvXW
	05zrfKQO5xcK/mLpBsR/IyWNoUSjshwz1SqZQ1E9pgp5ma2LdtnyUdzR+h/o4RtU9gt52c
	yrPAlmW0GhkDD5pRRyp/LJzZ36+6JVv/6uzOQ4sn2URr58FHOu93lE13JUYMMipA5/aSmP
	p7qMGjCdKLwXXPpGDJFbijd0ikAZlRIRQXywsJx9L5e0nweLbJg/qVwg+/BxBw==
ARC-Authentication-Results: i=1;
	rspamd-65b7488cc6-vknhc;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Snatch-Rock: 410d91dc6e1db3d7_1734533221943_2173764583
X-MC-Loop-Signature: 1734533221943:3859849979
X-MC-Ingress-Time: 1734533221942
Received: from nl-srv-smtpout3.hostinger.io (nl-srv-smtpout3.hostinger.io
 [145.14.159.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.157.102 (trex/7.0.2);
	Wed, 18 Dec 2024 14:47:01 +0000
From: michael.opdenacker@rootcommit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1734533219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XuXM4xJFUeOKGggVuktBkmgUw6D2OnjmnLd/WeMVXFE=;
	b=cUZwzx+EJKyQWId+AN0tH46Kbx/k04Y/MphMSdRiHwKvK8dYw0mQo9WzvUQpXH6tVcRala
	nyxYCb5TnMd8dG38T+dBSgn1iEUNc/yxR8pJO/IFPlbe6e6xcq+70YRbEAH+nCKCKQE8Ft
	MHXb0pakNwU2jfGIU8KzkO4obTZT27wXqHBeu+h3fFNWng5Vnlg4tMU4jRvqT4ifHN1z2U
	qRBJ6+EdQ7EeQt7/odVk+In/4DHiEdST7HtSRoBj6lkticTW8AE8z7VuLptQB/zBi0QHja
	W/QYxHmLzFC0AADwAWI+jOpInIfZ1jfKc9Vhmo2Vv8UF4LNHprmu4fspY6coPw==
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v3 0/3] Improvements to "bmaptool" usage documentation
Message-ID: <20241218144654.852310-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Dec 2024 14:46:58 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=c/P5Qg9l c=1 sm=1 tr=0 ts=6762e063 a=gK8Kn/iQ+cr19mtFy27wxg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=2um-5NeLV1pJwGc0HW0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfIjxexa6RL1fdWvpZGYGVJbxrUNAGMMSSI+7tMwpNnzk8/K8NLHSAB/l4C00zRhOZlb7/5oahDc72Sy7tRlA2lK4BKFw3gpeTzhmAM6ciX9zvcbZwCHO yY0I15/JSAwH/0kxbMCwWpw4r5m1EXa5dnrT7bCwo8t2KjYfP0oogda/8MQUazqKrKgQKZwPp/X3WalHMgL+wX1FbgZna03LG5wtWzcnrTxoZ5Q1RpPnXhsO rPJEXVLob1x06/pfqSvITTq7DfXN9EZ+h5hoemVCWS8imW8zaB8K5fLPNQKwcRcgEtZZ+XWqROsXoWNPcwqNCw==
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 14:47:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5977

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

- Changes in V3:

  - Use "chmod a+w" instead of "chmod o+w",
    and put this right before calling "oe-run-native"
    (thanks to Antonin Godard)

- Changes in V2:

  - Fix typo in "sudo" (thanks to Ulrich =C3=96lmann)

  - Remove "bitbake bmaptool-native" as
    "bitbake bmaptool-native -caddto_recipe_sysroot" is enough
    (thanks to Antonin Godard)

Michael Opdenacker (3):
  dev-manual: fix styling of references to bmaptool
  dev-manual/bmaptool.rst: correct command for bmaptool-native
  dev-manual/bmaptool.rst: simplify and fix instructions

 documentation/dev-manual/bmaptool.rst | 29 +++++++++++++--------------
 documentation/dev-manual/wic.rst      |  4 ++--
 2 files changed, 16 insertions(+), 17 deletions(-)


