Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECE5CF11EB
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:11:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.41791.1728562259357304014
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FA7oyEWK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4DB7FF80F;
	Thu, 10 Oct 2024 12:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5j30kAxP3k0XzhjubqRvHK6zirObx/B6JEkO6P0EOM=;
	b=FA7oyEWKwzhRheL122oYKJR2LQOnEU6unZAFsHq2BR8UbVQ0BcMhpYvBqPaPSnIz4+8g6m
	hYpgzDhT1cHxaDPLWBr7eD6KO8vGK4FESN+VaCfDM9Q/Sc2vYRAj+cPFwYbdgmBsdtIAeu
	Ibj97bbuWsFF9thJAyiYyCkPpvx25vg1MCL2Ezpf6CQ0ykWpGIsPXe97inDwJHGJDeUe+D
	eMsKGMz4KmiQuJ/68T9nGfHWxePs0GO2bn1s5HfDPUK036npo4ewrPlWELoiLDugTYNefT
	GKpMhHqM4FcTjQy+xqGTh7RqWgPKYx2MFtZCa+NBlz5I960hcVpq1ru4d10qaA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 10 Oct 2024 14:10:32 +0200
Subject: [PATCH v3 07/16] ref-manual: add missing
 TESTIMAGE_FAILED_QA_ARTIFACTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-release-note-5-1-v3-7-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=N4TFEmqn4DS5VeqE4okwZsgg5DlQ3q29ESX4fVKuFbs=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8ROlFRCEH7rlMl8ouqb3JibMmwJ2flTk8Pg2
 6mPYAVS5X2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETgAKCRDRgEFAKaOo
 NrceEADOyX9nI/zFfBREMUNEHxAAItewrPjgAOBzy75WE0081lLC8hrRCxgSOPbbYnL/eftpuol
 ejxsgVXkGQw2Z5qsnzHVy4a72ishdOEtjEOqWMabQLifw1cB9MnRjpnOlbm2pAZXNOxpKSgWJxn
 oaLly2l53hLpR7AYe/Jh4BTRy4JzBJv+/5l4WRx/8O6n1jKiP7yNX3izsLMVHXRWmLehFKtZHq+
 7PmrDCBOmszi0mDLanbEotj/PHDVzmc0lYhh2c6kxso73QxOzIH9Al4TtsRsH986RolzpAUdiu9
 qMlml1XW9F9AXA9us4occRMACX3eqAMZOvrcDx/WpaU1H1KLSS5yd+wlha8bONHG6WvpDh6d6Y8
 wJuch9DvD/keUsO8ud4Oahj++3tjNQRySlTvgx7FkWZXkb/vrp1kFnMRLhN+5caWNpK5Ux6wt1t
 M96gLaD816I5ZBYpbgoHh9svaqLp09rNv5Z5Q9Z7Kb3ghkwQ6NcM61kOH6F3KwuCW4+eYF/kOU/
 xCOSDDu+3pO0pvEmIfR83BXX6wNjzBW2u80p07rwLXo22LqYNN8opyVHyQC515ufYKiFjILPQ8o
 lCzwBlM5YY8+e/fnm8WMrLER/ThQxTtjayHSeEV44Gw0tGUBNKkv95Cy3DdeO6mQVT/3nHTWb41
 3ESYECXNKF7pGHg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5460

This variable lists space-separated paths on the target to retrieve onto
the host, when inheriting testimage.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 67fe44701..744c0bc11 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9267,6 +9267,11 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Development Tasks Manual and the
       ":ref:`ref-classes-testimage`" section.
 
+   :term:`TESTIMAGE_FAILED_QA_ARTIFACTS`
+      When using the :ref:`ref-classes-testimage` class, the variable
+      :term:`TESTIMAGE_FAILED_QA_ARTIFACTS`  lists space-separated paths on the
+      target to retrieve onto the host.
+
    :term:`THISDIR`
       The directory in which the file BitBake is currently parsing is
       located. Do not manually set this variable.

-- 
2.46.0


