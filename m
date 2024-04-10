Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734DACD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 09:11:47 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.162404.1712740298878113405
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 02:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JxQJ1mCN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2B3C1C0006;
	Wed, 10 Apr 2024 09:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712740297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jWRoOqgLLB4WlXOhQEIt+z5cURqfSjNytoyHnNp/f6k=;
	b=JxQJ1mCNQZdj8Enek8GvwqQl7iwxOz0EAInJsezzPracjXrrV5hW+InjDlUZulQYovo3+k
	7Yu5Yq4faeIjdHhCEsAa3NoHlDqh2N31hTzu92xAL4Xxots2XEaUQdybvRgEIW2pp1Rfp/
	l+TrK9oyDotbCcse4oyK9DeEiZkE6laiLx/RVYuEfcQU+/E7pD4y9SWmoPX4ZAiw0GnJA5
	YLKD4x9S7sieaJyaDHhbMFexTKSvktfXVj8sG82hrYhjYddACCsnL+QjE+IpStOJY0F5oR
	b50rybomqiK6MAjrZrjCBBopdyuCM4rlNPvYqibSEksg9/c+acLgZyof1nO0MA==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 0/2] Add updates to release-notes-5.0
Date: Wed, 10 Apr 2024 11:11:22 +0200
Message-ID: <20240410091124.2976089-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Apr 2024 09:11:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5097

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Hello,

The following patches add most of the missing sections between 'New Features /
Enhancements' and 'Known Issues', with the exception of 'Proeminent
documentation updates'. I also updated the variables glossary to include the new
terms mentioned in the release notes.

Best regards,

Joao Marcos Costa (2):
  release-notes: add updates for 5.0
  ref-manual/variables: add new variables for v5.0

 .../migration-guides/release-notes-5.0.rst    | 123 +++++++++++++++++-
 documentation/ref-manual/variables.rst        |  16 +++
 2 files changed, 138 insertions(+), 1 deletion(-)

-- 
2.43.0


