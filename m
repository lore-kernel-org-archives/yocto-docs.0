Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9403E7716E
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 12:23:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.12921.1733315022647267489
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 04:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YrbT/rE8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2ADF61BF209;
	Wed,  4 Dec 2024 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733315021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bVKNFd4CQv3lea9zqauNxv6wJGSV0mosiUOczVBJaqc=;
	b=YrbT/rE8DGRWyj5Em3QRWuK/0KZYBw7tGuhrD2nzd5Q9+QiUlZaDVCt/k/LUr3Yc6AvCGQ
	fFUvzVvUWBwdtLFEEugzBn9wWfGd0MfPGbaGTRkyYYOFvxaoDeNpj14w2jCrg1GtmNoFWZ
	oNmH7P28rBkbZk1GyzyoEM55JzWTaqtUnMj9X7DmNF/cLuZVVNkxgCjrjAr6iVkpEd9Kbc
	TFsS7XDCn54Z1lNqx5FSCtAx7h3QtYN+pUOE3ZXQIj7IMbt0799DeiPw6TTXCoZ/HGoYZD
	OC5+IhEiGXYVDKAwf7KXdAbSvrCy6sLKcval1QxywriFkPxw24PwSXACa0kqVQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 04 Dec 2024 13:23:11 +0100
Subject: [yocto-docs PATCH v2 3/6] system-requirements: add fedora 39 to
 supported distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-update-doc-deps-v2-3-1d9b4063476f@bootlin.com>
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
In-Reply-To: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=657;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RlzymVzLs5mLjCtkJ0YdD7CxlarDe2zk63Uaw1ErmEE=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnUEnLk3NN6D0Xuz0rBysLVyt/MWSgl7Mv2ZyEp
 LBdxEP4GIeJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1BJywAKCRDRgEFAKaOo
 NvQgD/4ioHaQkbSP5nQL07Xw1PMR6JpfPcsYXzlSXrwr//k6+ZkjtgizftY5Yk1itdYaBmxKoUr
 wLY3+16EoiKrhTM/spStiEvrpBy0KTQYb/0t1RKYJlUNjkKzX2Rtjep/bpAxHuRexFIt3MonxHm
 ZV66Fujm3rr5ZSVA3sUqSNTirAHDl3ir3d1lfPl8cwEkAKnccMjhJ6r9v8mfO4OJds+8fcJfYk7
 BSQRigzl2BO0iM/9kc0oOo/KJl1mqFtPRBNqeAaLgPVra4RoXPFBEmTOuiOTh+dY+g815RTt0BW
 G5SN6gOH9Gfv35vSSh3GgNA+kMKM5icKbZky6DX1bFmeHRwe5yENQgTcsT1buGaUSy1Y/grDIKG
 JQkj1x5AYy2EY+TLrX3qUkGHA6aGnrRI1f+hEYK86UKSqdUe17DMw0jXhZUxQLYA+gWZcBW7FGi
 XpBpoV3dwPQSVUZ51rczKkRzAFYjQfmN5gTIjKoGEHkCOda8bX3h8vOv0lpfy8exrr52PH+9e/N
 nKOyt+/wNyw6H83365ED0Vk3VJF4mD0NJ6SYr1LrFF2yQQOrrRNgU8mW7jgs8ZC4N9bn4VblnPZ
 HZi6w7yjg359I7b25GBxrFgU9YPslNfBZR3X2AOjfXaPdO5ydVgBu3tkcukCOB5gtw8L8s//BvD
 NfuJ9RXZfD6+wUQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 12:23:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5884

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 0b40c3f5e5ae87d703d9a2d338de084ca9f93b2b..17ad1b741a0b92f218860d22bbc4b0927b73b865 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -64,6 +64,8 @@ supported on the following distributions:
 
 -  Fedora 38
 
+-  Fedora 39
+
 -  CentOS Stream 8
 
 -  Debian GNU/Linux 11 (Bullseye)

-- 
2.46.1


