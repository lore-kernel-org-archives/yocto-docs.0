Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A88C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 17:31:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.25829.1679074306129561199
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 10:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iWVRaeRp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 688A6240007;
	Fri, 17 Mar 2023 17:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679074303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cqUAax7fOcCJd5f627C/u7Zvs9q6uBy02EycieGahEU=;
	b=iWVRaeRpn/2dfHkszh5Q/RkYbqhDkxS+rlwCRdZnQwRlzs05JNhRH+PCNLF+rlevaB7v0S
	r7h3nRZVMvCxmokCdFWEUDN78hZ87SIMLfZZXTAzwSwfxBuPFtmXu56oM2Hpec1XwBHS3v
	2ZE+ZaqcAQVhTj0NvW7rvMhe+kAqiOAgZwklkSACicx0XWOD13h2dwrt8YHkKhMIp3KtL0
	F+x1Nbwo87+0eVnnjOkL7xjWY5qp683b1cUevmux89weLyKbMQ4wMbwI57sessb1yho/Vw
	JiLsMdIVW3yzUjnujslMF+V+ApfaxeEM0NSexNsSX0HXO99RZ/cvcyVhJ3NMTA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 0/3] Update and expand system requirements
Date: Fri, 17 Mar 2023 18:31:27 +0100
Message-Id: <20230317173130.36268-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <174D0151E4C65905.10271@lists.yoctoproject.org>
References: <174D0151E4C65905.10271@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Mar 2023 17:31:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3804

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Changes in V2

- Improve explanations in the various documents

- system-requirements: explicit the "core-image-sato" image was generated
  for the "qemux86-64" machine.

- Add minimum RAM requirements

Michael Opdenacker (3):
  manuals: update disk space requirements
  manuals: add rm_work disk space data
  manuals: add minimum RAM requirements

 documentation/brief-yoctoprojectqs/index.rst  |  8 +++++++-
 documentation/dev-manual/disk-space.rst       |  6 ++++++
 documentation/poky.yaml.in                    |  6 ++++++
 .../ref-manual/system-requirements.rst        | 19 +++++++++++++++++++
 4 files changed, 38 insertions(+), 1 deletion(-)

-- 
2.34.1


