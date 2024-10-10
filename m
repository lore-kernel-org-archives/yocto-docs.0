Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615BFCF11DC
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:10:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.41790.1728562258789947609
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GVg2fgVB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50351FF80C;
	Thu, 10 Oct 2024 12:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oO8Twb+I/ZsMVraCWbJpEpftbq+WaDvhqa1m8/j+rN8=;
	b=GVg2fgVBk2strWldLodgT8KVVVGzL8XkG0yR46M/4M0AqeSLr+jx9OijRLlX/lv+dLgRNf
	XOsR3yO4y83ELUQP2s3hw8nvarPF8X5IXfC9Tty9NI/UXgl8Lzzp1EKZ4qfV7G0aha9Z3d
	oZpPiDKUKe7IwWx7Y8lWDmIYlIT25gfn4QPYKjyS2SbM3wx5sH6iGARRdHAIJol4zu87QZ
	WxopCdc5it0HmDusUbr3S5lXEypaXb/V2ee9GNz69OfAgWItmlxw5vrn/nuCoOTlDW7G48
	EaUnYcrzStL3jXPelUjSUr5EP0Fyv+I+fPF8EPz9s+oQCxScm1HNLYCKqUX6ZA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 10 Oct 2024 14:10:30 +0200
Subject: [PATCH v3 05/16] ref-manual: add new RECIPE_UPGRADE_EXTRA_TASKS
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-release-note-5-1-v3-5-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=zIuVN3vPuj+zvb1IQGdmsh6o9iRGUqt0Ud+GRRHVX0k=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8ROiH4u2PB8qkDSqJupAFXFccGQsVkITxPIZ
 nRgvvOq3jSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETgAKCRDRgEFAKaOo
 NjtAD/0YfhwP4vfyIcuPwlzpo9Eg319HpOo13WYqEpwdw5Cl1vd737nHLELGApvyix1pc5Cwlew
 ThQuOiXkWefbb1ZYb5oVaJEccMA/S9uQ+wIo2ElAAlNgb1N5TYVH6AJDzJ9wJJpphbKBm9bvUwv
 zrTaV8uMeS2IJ8WyalZc0YptSGTMhRzCsT24EjuYcSVCNAxFWk2ZjV69EbYNXhiAhjuv7BA9l3W
 7fY6uCoLc31FbA8KPodNtQTxZZFNFF29M7kdL4fj61eroxPDbt2Pav9dU+DJHwfJ2Ocphj+qYPQ
 lCIlhM1b76Za+L3Ytfhiry5Y2di4n9jyONN4/w3zlXRaK0BiNMZGV5/l6gbXLPZUvrf5k4iF2gN
 tKiYnXxTmjYLdoWNUK8Afw2ETNuWTmTgdVrY9zllD1DyFnbEQqpOAM7kl+YJeUkxrZCV2wFvPfc
 Lcjynh0K1ke+9TTpHdaBc0qL0rM+hzy6kFclFHEea43a0EATNRBkXKmS5DnBQQinjwYzmP+md5k
 WtZTN9A9srKYJ12OqSqKq1/c+U4CP6aL7/XxHt46zU/7BrsYW+39P7h1mfvAML8VA+66wpct6Ft
 EBuZ4M0pagkLbsEqNMXrpRsqtS92M/6jhDWi9Cggy09kqjs7Nbl80gSlS0KbDt8i+qhcyKF/JLx
 UvvYsgDTfjR+TfQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:10:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5458

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 853e50cf9..67fe44701 100644
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


