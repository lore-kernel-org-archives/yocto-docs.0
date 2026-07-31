Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA48C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:37:09 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3041.1785490627297192981
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=vMnffED1;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A171B1A1351
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7692F6039A
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D07B611C1660A;
	Fri, 31 Jul 2026 11:37:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785490625; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PBdwi9o7s4khxxHzrE4f+PNby5JWmDgy+GzQ/M/r8rE=;
	b=vMnffED1gL6Gny0SUmwKfdbPy0TRRbJpKwLSRsf08gpyTXvjZifS8kpYgLohpTfSvRO7xy
	nMp63r0j+jVcOmu5Rh/ddM+aAXTawqtEnzCRiT8WUb9qRH5DB0jLQA9k3aLJGL97NbiGa9
	/kcx8yq+q0WviwlP/PBSsiFGJrd8vrlhbNS6MlaRwCx1s+pOe+o8oLqWkmZ6+7MNXtIXRg
	w35+2DCZcyEN7rduiztZnEv014dpcbP1jBjRGN+K8sRHl6zLH82e0wcpPYe3Ah7Ntz+Cfy
	usypaPaBN5j4KvQqCLnpC+By0NBHqWTft8G4L8QGaMSaCjoPbbaEe/xe8UdSsg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 2/4] ref-manual/variables.rst: remove flags from variable names
Date: Fri, 31 Jul 2026 11:36:20 +0200
Message-ID: <178548999919.2379643.18213596148799862778.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716-gen-doc-links-intersphinx-v2-2-83cb3aef6ff6@bootlin.com>
References: <20260716-gen-doc-links-intersphinx-v2-2-83cb3aef6ff6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10218

Applied, thanks!

[2/4] ref-manual/variables.rst: remove flags from variable names
      commit: f746ade52e43d329b80e02943b38ec762887e346

