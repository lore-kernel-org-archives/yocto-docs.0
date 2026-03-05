Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBC5F3D33C
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:13:44 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49574.1772730818779741705
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 09:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NJY5ZRqm;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1BBB5C40409
	for <docs@lists.yoctoproject.org>; Thu,  5 Mar 2026 17:13:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7223F5FF89;
	Thu,  5 Mar 2026 17:13:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E976103698B4;
	Thu,  5 Mar 2026 18:13:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772730816; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=W5IGXaquVV9OOAvMQidBjmOn/d08TUxfSe7qY5cEPMk=;
	b=NJY5ZRqmnlpjtdPxgMgLuASIUdjSfh95SkNDZcCOZZmtCHILBJCGVCeaiK7394+820V/Kl
	GuJQlEM01dCMuB4JX8RujhOkXiWQDWsFSFn6MyWUyo19YeUctGGhigO0hnhksQVJCxz+21
	7D3qjV7DOXsqfSlWE2XDA8xADX3zwGCuvmB0DYHZ9voq8sSz7jFN4QFO3jiuPBPZCl7mR1
	mrWnyNFRDbp7TEVUdePm9Cpdxa5wuwqd4snTgieooAYkYb5mM21A1P4TedG9w/YTqn02Uh
	f9j7l8pev6w8iytlJYv60xy5V2IBFrrcjG5MbP4gktcDqgbDfosjwsGCJhfknA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 18:13:34 +0100
Message-Id: <DGV0MLL1GYOE.2A7NNJ48QD70J@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 17:13:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9075

The following changes since commit 7c348dd67cfd169b1a56bf969606b03dccb76c56=
:

  what-i-wish-id-known.rst: replace figure by the new SVG (2026-02-23 13:58=
:32 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 025ef10f4472082069a3237e21aa773354fa5ad9:

  overview-manual: escape wildcard in inline markup (2026-03-05 13:52:28 +0=
100)

----------------------------------------------------------------
Antonin Godard (1):
      ref-manual/system-requirements.rst: update end-of-life distros

Kristiyan Chakarov (1):
      overview-manual: escape wildcard in inline markup

 documentation/overview-manual/concepts.rst       | 2 +-
 documentation/ref-manual/system-requirements.rst | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

