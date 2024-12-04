Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42894E77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 10:44:53 +0000 (UTC)
Received: from weasel.tulip.relay.mailchannels.net (weasel.tulip.relay.mailchannels.net [23.83.218.247])
 by mx.groups.io with SMTP id smtpd.web11.10996.1733309087792702609
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 02:44:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=bQOWLFWH;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.247, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 19190A3ACA
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 10:44:47 +0000 (UTC)
Received: from fr-int-smtpout8.hostinger.io (trex-9.trex.outbound.svc.cluster.local [100.122.93.180])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 5F77AA38D4
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 10:44:46 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1733309086; a=rsa-sha256;
	cv=none;
	b=3sReFI9BrMm+Jnk6RdWRsK1aB3VuhHQqHA3qwzE64g51jAFIKu6AuiwahpA7sO54mGH3rb
	i8KAjZRT42BbY4s5SamjsTfePGhNDg4nBa4nwHoXZuTpo+h0if9lLACbVhCHhVWQOfpeWJ
	+qVpb40AcdK0pMiC3g37N9H/XDjP4FcJ+Ce/Wq5UsB8e0mj4W864J/8DM/Vl3+LIweF/b+
	p8zOf5i5Or6J6i6Wj7jxAYmm3l+nWtnPG0mog7vgHxdlFUP5EyCma6PRW6fKii4GNHYQK6
	Zsr9DoMa1cD9zx8fNvpzZAQ8s1TNuvYcp1YP2duno17QxMH8QA25b17BRE2XgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1733309086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=ZLqfPn53PkZArq5MNEVVVLkRRp4x8Zh5eH3cLuj6T1Y=;
	b=Ey6Lt0dK+TgCywNH7bvkq3X95E21P14HfZNYGHPIXpRZYPWDIyHYNXjVxOJgIhkv6gbpEw
	2eRUk/bNgzFUULrZ4o5HweddzOCbfv7XGTOv+z9MIQHcwi0x8stkZ+ph2HtTrXCxQDI9cq
	xTgrdQzH2djM/AdBHa08sbd7Z9TsdbluMCZomp1r2OdvY7urmngSzIjqpc8AONTvbrtbFv
	6RHtkOgIfvSLoYXV9gTa1yaSlOLHEMDEv2qYbn4IzzHjSYH2qhFvk+WufAttsrScg8m7nF
	vXjybJEbE6tZqarK/oh3qaRCqVwsOlS0kHaitBtiHbHKqLyEm6ri4V+oANrogQ==
ARC-Authentication-Results: i=1;
	rspamd-5d9d86ff64-f4j96;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Slimy-Duck: 337ea46806eb624d_1733309086930_1363678688
X-MC-Loop-Signature: 1733309086930:1166811737
X-MC-Ingress-Time: 1733309086930
Received: from fr-int-smtpout8.hostinger.io (fr-int-smtpout8.hostinger.io
 [89.116.146.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.122.93.180 (trex/7.0.2);
	Wed, 04 Dec 2024 10:44:46 +0000
From: michael.opdenacker@rootcommit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1733309084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZLqfPn53PkZArq5MNEVVVLkRRp4x8Zh5eH3cLuj6T1Y=;
	b=bQOWLFWHItjaG4NAa9KqD6kKowE6UbF/QNKIWNHFaY0GeDIaJAX53a9UQA54AweJDIv+7e
	0yb6eE5VH8Tc0BOOp6AwFj8gDKchOcpuiyKe6X8ToUEMjkgU8D82gRFHbykMWk+kpuQwmz
	ZYAquH7W/C3bfh+TmPNNpfKrMGCba2fEN+YkwqE0Vd6lAIqiPOnPD0nBS5dt1zLQwdsZh8
	b1EVyL5gghQbJ5aACyDqs2FbxK0fPTD52oWUNjvMAzXFrbcDeVh70qLKvY7T1UioLjId7t
	1DIL537BybwKJ8fj0r5ESnSfhvxl6AdAjfjvXF/1oB0yXyDKVX/B5nFer99NLA==
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v2 0/3] Improvements to "bmaptool" usage documentation
Message-ID: <20241204104432.2094236-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Dec 2024 10:44:43 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=dOX0m/Zb c=1 sm=1 tr=0 ts=6750329c a=3JjwsiTUxCxireyYQgRi/g==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=5iX7kdQEPnyW5gLGBrgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfFLszqXnwm4wibQ4gAsdJMWcSLGNp8DsXh5M57O4TGiZKTQyybw78duM5MxTPM8et7Vkmokg8xKx1UDDJQ05RVDC8i+B6MnDlb+1GwukGFEr/Yz3zPIR mfZ0ffIRqG958ZVCD8RkrucWbM6rNzoKhMSwCH4pa53RS98WfrBmj6YZJJSUwlIy18njLCqa7wZyYn+eB1HU+lzJbc0beMf5xIAwzvAXGtXTgcU9wXrUimwN mLRJFQf30aQjhfWj3Hn0ADCcvihlgIatR85KEKhPxotwSP/KsqNkkTDqr6AuqQIeJ/Ih4Cc+VQZsTz/ZQPhicH+CGEiTXPHB4LGEb74ko+8=
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 10:44:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5876

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

- Changes in V2:

  - Fix typo in "sudo" (thanks to Ulrich =C3=96lmann)

  - Use "chmod a+w" instead of "chmod o+w",
    and put this right before calling "oe-run-native"
    (thanks to Antonin Godard)

  - Remove "bitbake bmaptool-native" as
    "bitbake bmaptool-native -caddto_recipe_sysroot" is enough
    (thanks to Antonin Godard)

Michael Opdenacker (3):
  dev-manual: fix styling of references to bmaptool
  dev-manual/bmaptool.rst: correct command for bmaptool-native
  dev-manual/bmaptool.rst: simplify and fix instructions

 documentation/dev-manual/bmaptool.rst | 32 ++++++++++++++-------------
 documentation/dev-manual/wic.rst      |  4 ++--
 2 files changed, 19 insertions(+), 17 deletions(-)


