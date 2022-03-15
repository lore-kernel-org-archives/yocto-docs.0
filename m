Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F61C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:55:27 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.10975.1647352526183335778
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Mar 2022 06:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lXITu1Dh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3EE071BF209;
	Tue, 15 Mar 2022 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647352524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0CkynlobculBObZJxHBI0iU8eRYN23yLUFRmURhxH8Q=;
	b=lXITu1DhdSGEMMm1fH9vENuR29sQfkkPpXaBNVJH2jnBjA8nHsVoYZy0W/+ib+HF4X7nrl
	dPpnnJnhG8HgM6z6abrLKgvUIcmyH0M0mhvSFMWPUeek38TN17UQbRtT3vD2JaZD8u9E6B
	K8NfxCGDGM/2Z8sZ6k/XGJ8Yi1klUW7l5Q08CKw+817wD1fi6QF0wLLqQSHWDrjShy3JuB
	pinC5uFzdasLJJiUspDAueER9ETuuSsggumOwjSecTCXEnSxrq66helmsJGiLhNXWJeXYQ
	49vKzsnFwePl+oGh8YX+PgbVETqUw6LszRM84mBpX2tevVgs024Bs9MO/gr/Ww==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 1/2] ref-manual: sort list of variables in generated output
Date: Tue, 15 Mar 2022 14:55:13 +0100
Message-Id: <20220315135514.128300-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Mar 2022 13:55:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2605

As already done in the BitBake manual.

Even though we're trying to keep the variable
definitions in alphabetical order, it's useful
to make sure that the variables are ordered in the
generated output.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/variables.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6a4d3fcc3c..90842010c9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -17,6 +17,7 @@ system and gives an overview of their function and contents.
 :term:`W <WARN_QA>` :term:`X <XSERVER>`
 
 .. glossary::
+   :sorted:
 
    :term:`ABIEXTENSION`
       Extension to the Application Binary Interface (ABI) field of the GNU
-- 
2.25.1


