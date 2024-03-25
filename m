Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5F0C54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:27:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.52061.1711373270606563331
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 06:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GQZQczHq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAC171C0004;
	Mon, 25 Mar 2024 13:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711373268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JrxlxbiEYssaVIVHVRX66cFaIhR5yEoqTvAJAVnpqJE=;
	b=GQZQczHqR5qeUrAPEjP+BeI2p1pCdlEglRHVThc3XjnJwzvXqn+QJmd1VZz4ag5rSFH/DQ
	v/ZJvS/GfekBQO7MW8ZBUz2wMuhbhXnu8p3QlMHIyobTJfCHW/el4HxQHJOdoQgQ5vHE7b
	2aV5xkch1vwl/G8ipXni/rLkhSXs9k4mTq+v4Ejuas/0cQw3jwZ08uiIK9EM7iB/+VYo4g
	3wNTJeEHV97RZBxe8KMeexb83tA4bhXCZOHDJkNywvtgTwXgGUmPuGOIOpnTwL90L4eX5a
	txe9JlAMr0LiFEJjzQMEZGY4WXzyVvnAOHeTUNHKL8H8obbh6jeUwgtEq/SUVg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [kirkstone][PATCH 8/9] ref-manual: add documentation of the variable SPDX_NAMESPACE_PREFIX
Date: Mon, 25 Mar 2024 14:27:36 +0100
Message-Id: <20240325132737.3018073-9-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325132737.3018073-1-michael.opdenacker@bootlin.com>
References: <20240325132737.3018073-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Mar 2024 13:27:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5006

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

The documentation of the variable SPDX_NAMESPACE_PREFIX does not exist.
This variable is used to change the prefix of some links in SPDX docs.

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index aa1d5f393d..5e5b688878 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7521,6 +7521,11 @@ system and gives an overview of their function and contents.
       image), compared to just using the
       :ref:`create-spdx <ref-classes-create-spdx>` class with no option.
 
+   :term:`SPDX_NAMESPACE_PREFIX`
+      This option could be used in order to change the prefix of ``spdxDocument``
+      and the prefix of ``documentNamespace``. It is set by default to
+      ``http://spdx.org/spdxdoc``.
+
    :term:`SPDX_PRETTY`
       This option makes the SPDX output more human-readable, using
       identation and newlines, instead of the default output in a
-- 
2.34.1


