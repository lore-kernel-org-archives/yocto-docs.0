Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCABCED634
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10671.1728459694427371509
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BHLweUc6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5B551BF20A;
	Wed,  9 Oct 2024 07:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N89CHdNvAi1EfcmsIA3JRrm4aMpgUJ0LTf6oH97Gwo8=;
	b=BHLweUc6NRtjTvGZfNe7SLve64I3OBIM82OAsrmdrgIbODvcV5Qt6awsVIkTAdZ0jVo67v
	OG8/anKcommpwJaBbNUm9Bu7Mqi9VdGcLA1f4yVVfWGJLKnNxYdGvwyClGdgrvoNJ3UxB6
	R0SPRnwQ89QyZlfamtmGEYLQWG3k0hyEwcmSy86YDyffJ1IxJKeVF1MNTTmdfMVKzhXe6A
	V3EhEVJMkVEED9CnXr6SCy5u3+qe/13RnLL74eFrudukizMO48LnR40qTelngSbUDQGvzV
	O7L/zwFJRapUIlqzOpjI9CyGTFDP6M7tcV8m/ay4ooUHisq3R0KIE9Zje+xyXg==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 05/16] ref-manual: add new RECIPE_UPGRADE_EXTRA_TASKS variable
Date: Wed,  9 Oct 2024 09:41:03 +0200
Message-ID: <20241009074120.866786-6-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009074120.866786-1-antonin.godard@bootlin.com>
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 07:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5412

From: Antonin Godard <antonin.godard@bootlin.com>

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1e37132ed..6af05c810 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7076,6 +7076,11 @@ system and gives an overview of their function and contents.
       in the ":ref:`ref-manual/devtool-reference:checking on the upgrade status of a recipe`"
       section.
 
+   :term:`RECIPE_UPGRADE_EXTRA_TASKS`
+      When upgrading a recipe with ``devtool upgrade``, the variable
+      :term:`RECIPE_UPGRADE_EXTRA_TASKS` specifies a space-delimited list of
+      tasks to run after the new sources have been unpacked.
+
    :term:`RECIPE_SYSROOT`
       This variable points to the directory that holds all files populated from
       recipes specified in :term:`DEPENDS`. As the name indicates,
-- 
2.46.0


