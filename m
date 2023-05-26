Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF55C7EE23
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 11:43:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.5926.1685101407205098651
 for <docs@lists.yoctoproject.org>;
 Fri, 26 May 2023 04:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fA6KSVvv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685101405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R2M0SbrL+aFHyjI1DzbCCbG5q1h7n73t6fhabNwrW0k=;
	b=fA6KSVvv1jlsn8wdiQuVRwgW5NqSAdQmK9dRH8SqxhauGsSZOls57BiiUa15NPnQcgDmXc
	Eu5jJ7Lak68Pi0RX5+GgWT41lghGtQtZFyrQkNfzklmGiswVU2xGR1PmGcc6IHzhhQhOXK
	U2j0yk4hAMgz/BOJz8WkOxjaxRn7JF4PhnTWlnIF+7DO0g5CwazBMUfg01BB4CSRuwNhvC
	QAmMUMNs1H9NYrM5mGGws5SZxC8Po7mnz/In63MORUJ39+lEgDjO1L5lTWTc5jDOpcU4xH
	6ssi7SSxd7oq3D22QwhzkuTJ7lh65B+ivmqdE53OuwHnyoB0LV6Up2+zN2Wl7Q==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 704FB1BF20A;
	Fri, 26 May 2023 11:43:25 +0000 (UTC)
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] ref-manual: document SPLASH variable
Date: Fri, 26 May 2023 13:43:21 +0200
Message-Id: <20230526114322.1698988-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 May 2023 11:43:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3969

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/features.rst  | 2 +-
 documentation/ref-manual/variables.rst | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 5a064329f1..d6307f1a2f 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -344,7 +344,7 @@ Here are the image features available for all images:
 -  *splash:* Enables showing a splash screen during boot. By default,
    this screen is provided by ``psplash``, which does allow
    customization. If you prefer to use an alternative splash screen
-   package, you can do so by setting the ``SPLASH`` variable to a
+   package, you can do so by setting the :term:`SPLASH` variable to a
    different package name (or names) within the image recipe or at the
    distro configuration level.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e213478326..6680322f4c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7820,6 +7820,12 @@ system and gives an overview of their function and contents.
       certificate stored in the :term:`SPL_SIGN_KEYDIR` directory, you will 
       have to set :term:`SPL_SIGN_KEYNAME` to ``dev``.
 
+   :term:`SPLASH`
+      This variable, used by the :ref:`ref-classes-image` class, allows
+      to choose splashscreen applications. Set it to the names of packages
+      for such applications to use. This variable is set by default to
+      ``psplash``.
+
    :term:`SRCREV_FORMAT`
       See :term:`bitbake:SRCREV_FORMAT` in the BitBake manual.
 
-- 
2.34.1


