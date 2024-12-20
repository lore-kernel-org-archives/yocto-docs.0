Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC44E77194
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 12:17:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.150877.1734697026512440146
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 04:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fp7Vt9VR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19F1E4000B;
	Fri, 20 Dec 2024 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734697025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMItNCoHy+hMPePsSnlYYOr4qaWUNe9cBunRSYDn+xk=;
	b=fp7Vt9VRDXIR+l9uIhfKxAYkbegqKZOzWBQcb93J12PkRagzHfyGLIiYhZhM5EKC1VdRjX
	kUsoc6Bl7eC5GqIcrNjqQ+MSkYXJNlC8kfJ7ms9nwJDFz2sdE4wrzpvYb6sMAJx2e3aE2u
	prpx02GUC/l4Aqy4GdI35Ff2kYY4X6sJfkMqZPPVfpAJKRmSYanmIeTy+O5PTt6FHA1mco
	uMHgAu6x7q+Oyv37EI942fd+N4XKLdt1kOE25JYBra/lYbrOm7KJg4DbeG1duYwM7pJV+h
	OwuoqT/auyJtU/wd17eUUpphEfy1eRLOCWNjw5hI0T1BznEaBwLwsWgOGVmcKQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Dec 2024 13:16:32 +0100
Subject: [yocto-docs PATCH v2 05/14] ref-manual/variables: document the
 WIC_SECTOR_SIZE variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-release-note-5-2-updates-v2-5-df29527f3fc5@bootlin.com>
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
In-Reply-To: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ITEi9PXJfwC8leCf2HzY5vT7e25pGDCe1NN2oGG6dwk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnZWA+E1+f265RMNqBUnBAufYL4AARYQw6L4IlY
 WAARBmdD8SJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2VgPgAKCRDRgEFAKaOo
 NpaJEACOJhhA1TVkajURNHhWUYLzQNprT1ZNNalN4EM6dVhMxdvaHuuKd+eIl0lDIOnNP2Ab1rn
 GZnBlh2HbVHbeZp//3Md/vssnfHo1CwgO3D5C4BMRkNuLXlpBJkvREPz+amykYImcnNWMr89qEK
 VZC4tFCx9eQh5Ub+gwbuzy6ejR9lgdIr5mA93iX+2iZcN7LtysqMSgPPwypQW7D04jr62cXPYzG
 kdXFjRJAC7/GLMqOP/vzyDhslSPMaEpXuVsVE1+sEMzpxW0g+y7Wx2rhvUKl75l/S7tdz5qauvx
 gSHCKiI1O0iMe/o96ISZn+ftjqgce4iHb+iTiddX2J8xTOrIFUrZmVXGoCWIWq1DDfFQ1anQZxS
 KN7N3+2SjPcMEy/yHh29uEJXVjeUm9ruAU9QP2GNFHOpi4fNBoSNXHf8c79fUlIpit2jsLFgpUc
 m2cbTYjQEq2f3hwiToKBSP/LTMJFRNpuAuM3qm6538Kz4mDz3OaqYn/SUOyllxAIJSHtWDeGp4v
 t0e7WzLc7SK+jHhZX8Wu3/0wfwTCZojmx9aJFp2F/LL1S4JeRk7GUBIFHBGMYKzpaAcNJ6uqHfM
 XVRhPP7TDgkvxETaOx/j4OCa8biNOxXfDZhFeMxNbfYhRGOM6AUHQCivGCSK2NRCuD7E4/9wy60
 izVSk+EIqQaPbrg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6003

Added recently in oecore to control the sector size of wic images.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 193c4933cabfd3057ab71ccdedc184341984371f..40f2f7c99aa9d3ec9b9f8fc5799dcad385ef1dc5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10198,6 +10198,17 @@ system and gives an overview of their function and contents.
       Specifies the timeout in seconds used by the ``watchdog`` recipe and
       also by ``systemd`` during reboot. The default is 60 seconds.
 
+   :term:`WIC_SECTOR_SIZE`
+      The variable :term:`WIC_SECTOR_SIZE` controls the sector size of Wic
+      images. In the background, this controls the value of the
+      ``PARTED_SECTOR_SIZE`` environment variable passed to the ``parted``
+      command-line utility, used to generated the images. The default value is
+      ``512``.
+
+      For more information on how to create Wic images, see the
+      ":ref:`dev-manual/wic:creating partitioned images using wic`" section in
+      the Yocto Project Development Tasks Manual.
+
    :term:`WIRELESS_DAEMON`
       For ``connman`` and ``packagegroup-base``, specifies the wireless
       daemon to use. The default is "wpa-supplicant" (note that the value

-- 
2.47.1


