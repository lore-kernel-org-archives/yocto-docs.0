Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162B7E7718E
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 12:17:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.150883.1734697028211027441
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 04:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pNpOWnni;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C60284000A;
	Fri, 20 Dec 2024 12:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734697026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rx13eIoaMhj3Pz7GdP5WK+hoamjAKRykpA/VXScOKtA=;
	b=pNpOWnnilGctbOtgel0c6ENF9160toRsQdfkW3+enJyKcBjTWBqtXzuthNnqS6qPbEFl1i
	r6wuhPBO/06zE5bPpMAN8RXHsbVreVVSLxi2Xe9WEeDrhl2a6N8rf5+0CUU/LDUesLYTgv
	dceUfAQ+6Fgjc4MEsNhwcJejR44lEqGAFP1BgKSd18qNRmXBh9pGIKfi4kkrB4DJBrfVRL
	EuIaGRNomR6n+BKc9W375t+zxcOfKiXy1tx1UM1E0yltqs16owNDDM4aVqg6ZypHN1cSAW
	P2mg7T75rsUXc5gyCEDpoB8QCRkmDX0ZvEyp28IY6ewogOB8tVZ3y3eI6juJrw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Dec 2024 13:16:40 +0100
Subject: [yocto-docs PATCH v2 13/14] ref-manual/variables: document the
 PREFERRED_RPROVIDER variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-release-note-5-2-updates-v2-13-df29527f3fc5@bootlin.com>
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
In-Reply-To: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=XuhvF7sBxlnbXR9Topmi8O5Lprlq8tNSKa+ckjb/rwM=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnZWA/Tjatg1V+OzvRY4ig8kfNBiRR6YVtcSTWS
 pYrBqIt1DuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2VgPwAKCRDRgEFAKaOo
 NqyjEACvroDzix3hfW8Kj/nIN4zsxMUX9EUb+LRGj501/fliwjlkut+tkazDAFSemkBLpqgSGY6
 o8tPY0+S8/ImkSstpkxR2b3yETyeP1PvGxhmzVsm1PUfewD0xavJvn4eGQOYeJeB6NmXrlXPtTr
 kzj/w+HQSxJKKb4mmjOsAY4uC2jOQJNzGweLVexrBJrvlSAMDrVgCMBbPkRF/vsanhz7+IWHHVx
 5ea4J8xD6K+FeeDc0yZH4veHMQ+9G/9itTqxXe5KIpmBSaELTrtBO7MBUy32lY2Xx5QwCd5ulvP
 2Xb3hjpuEkefEqMta5m5eDIAiWwEkwjQQ0eG7bBOL9tvRs5dGRYBpR+ZeQEX9S+72crwrOKoAoq
 3wnEt8qg+6XPo90lmT3ug0b3Rgr3S4lhwQr0OdLFij/lI/EV8v9NitwZOBDzNQKYsa9pqNnrOw2
 DCgJoGYo5F9l5ePejZsoV0IP+z4DOcMUXgYe7kkmcOIV+b8Er9Op4/J0qF+IL0OHeXtMXvhNsZb
 9PI5A9FUvqx/uzTmic/bOyJ/1f+KIybfrBtG8PjzN7b/83+2XNPkOEYjB/XX+OjXRblF7lPdyGZ
 G1/H4m6WsunCElQqWlj4bMJWKvwS46tqf1zjmktExcC/xVMbDAlOx4D0OAagfOW/gOki/7DdwLq
 D2ZGt1G28kLbPEw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6011

This variable is similar to the PREFERRED_PROVIDER variable but it
denotes a runtime provider specifically.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1d4e2e2be67aab3ea22d1506be94c7222bbc6f53..ca1701e7c6e6c334493429623fa257d65de9d324 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6726,6 +6726,28 @@ system and gives an overview of their function and contents.
    :term:`PREFERRED_PROVIDERS`
       See :term:`bitbake:PREFERRED_PROVIDERS` in the BitBake manual.
 
+   :term:`PREFERRED_RPROVIDER`
+      The :term:`PREFERRED_RPROVIDER` variable works like the
+      :term:`PREFERRED_PROVIDER` variable, but it denotes packages that provide a
+      *runtime* component. Runtime providers are declared in recipes that set
+      the :term:`RPROVIDES` variable for a specific package.
+
+      For example::
+
+         PREFERRED_RPROVIDER_virtual-x-terminal-emulator = "rxvt-unicode"
+
+      This statement sets the runtime provider for the X terminal emulator to
+      ``rxvt-unicode``. The ``rxvt-unicode`` package is a runtime provider of
+      this component because the ``rxvt-unicode`` recipe set the following
+      :term:`RPROVIDES` definition for the ``rxvt-unicode`` (``${PN}``)
+      package::
+
+         RPROVIDES:${PN} = "virtual-x-terminal-emulator"
+
+      For more information on virtual providers, see the
+      ":ref:`dev-manual/new-recipe:using virtual providers`" section in the
+      Yocto Project Development Tasks Manual.
+
    :term:`PREFERRED_VERSION`
       If there are multiple versions of a recipe available, this variable
       determines which version should be given preference. You must always

-- 
2.47.1


