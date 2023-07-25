Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7C2C001DE
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 10:45:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.17384.1690281918023675230
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Jul 2023 03:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RRdQefzP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D22591BF207;
	Tue, 25 Jul 2023 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690281916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=63YvcqujhjytUSpQDwlZhBcXQtMygYtBWRkoRw66nA8=;
	b=RRdQefzPdJdULjcG3Z/nQCvQvPb/NPPvXYak1ClJESgKQrYGeIZDWh1+WeIPuF/jw+YA3h
	LFNzXVoO5YxDiE6PqoAT0oPQjPQo3BOwUAH1TM3lnItINlATTZjd+IYlijtHenIIhJsUO+
	M61ZllgbRa5/QVNxw1xzWhKqcv4dmAl6Q6VzEDDJ6yGnp02CzFMq8c5CFLQEkAoETE2g8x
	RSUFZQqXlkCXCXBkFg4SkV94YcuxTbwEcoptNA94ricglLOftMHMa6F6D6mkU6W16NeoBo
	+Re4SjQ4JpGyB654WNEnjpf/tLT6oX3Ha0E3mXbC3rGaOxBj5Ik9cyGaQ1u0Bg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [dunfell] ref-manual: ref-system-requirements.rst: align with poky.conf
Date: Tue, 25 Jul 2023 12:45:11 +0200
Message-Id: <20230725104511.465450-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Jul 2023 10:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4077

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Align with the contents of meta-poky/conf/distro/poky.conf
which represent the distro versions currently tested.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/ref-system-requirements.rst | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index ac963dcdb9..6e1ad8ee21 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -47,10 +47,6 @@ distributions:
 
 -  Ubuntu 22.04
 
--  Fedora 28
-
--  Fedora 29
-
 -  Fedora 30
 
 -  Fedora 31
@@ -67,6 +63,8 @@ distributions:
 
 -  CentOS 7.x
 
+-  CentOS 8.x
+
 -  Debian GNU/Linux 8.x (Jessie)
 
 -  Debian GNU/Linux 9.x (Stretch)
-- 
2.34.1


