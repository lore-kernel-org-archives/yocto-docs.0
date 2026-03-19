Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C171075283
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:22:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7066.1773912128356960472
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 02:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vuGNwNw4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6ACF14E42715
	for <docs@lists.yoctoproject.org>; Thu, 19 Mar 2026 09:22:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 422EA5FDEB
	for <docs@lists.yoctoproject.org>; Thu, 19 Mar 2026 09:22:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3EBD1045069D;
	Thu, 19 Mar 2026 10:22:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773912125; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=XuZF+2kxDyD7O9FlO5Z1EdujzIvTn9bRxVVlcVlmg0Y=;
	b=vuGNwNw4k9wST5+4VRIRfNDHSV2U0IvCcSzlEAs/VFIab8MnnmzVTTpgWv+O+n65vmT0NL
	M3A2jqf0hfdD4WtYT9IAd26lBZPL74jj8gtrKqZQ8zTPKXSebuE8HMQQNeF3M2oLlekRQl
	YU9ZF9K6z5cLB5Vxq86+FzlaGH3BEGo5K8Ru66SrCNkplMyWp/qdxVEg77ZG3I3+BZL1ZZ
	xpQMuCHTyuy3/0+75K8WiLNL9kaYfIoB2w1hWrxVIS4GPYzx7XqMN2zyi33ZCeT1/shJvZ
	DrFYbkfw45IfkfcENZL2t/KxMFQMB/kaQEt6nRXcfOho213Mjf/FIDWZFw+2/Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 19 Mar 2026 10:21:47 +0100
Subject: [PATCH] ref-manual/system-requirements.rst: remove Fedora 41 from
 supported distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-remove-fedora-41-v1-1-851ed45bb8cd@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBBG4VeRWXcg8Yp9ldKFiX90CjVlYqUgv
 ntju/wW5+yUoIJE12InxSZJ4pJhLwX5eVgmsIzZVJqyNZXtWfGMGzhgjDpwbdmH0NmqcabtHeX
 spQjy+S1v97/T2z3g1/NDx/EFW8Eee3QAAAA=
X-Change-ID: 20260319-remove-fedora-41-cff7135b069b
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=hf6S0yi8QlR9HIzHkiL7A3GMJVmwN8gebEgk4WLd4fk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpu8A8zTKv8rUnABj8UQvWkST94XAX/bYG4ldAu
 Q0rB+sQVs6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCabvAPAAKCRDRgEFAKaOo
 NilZD/oCtnnN4R9j0RUxXCP7l2v6CDaonLinGZtO3Sd82JxZSFLGKdQ3VLctvpt34rSqeaY1dFI
 tPMBEZ0mrjUWf/lXx59DkXjM8zolgjPkxNGHp17pM7ZXvPjW8gcxlxwK9+/aVvH7YVd090jIytB
 F2J7LD/DDc+uZaouad2hWjMOC0H1OMR7wPk/twUK9xwvQBm4jk/fuK4AVd6TGriZkNZzAwZfkDw
 lBIUP3/Nh0SKa7eIQAN/p2m3NzNNXhDte/2EQhtP7swt7ieXJmZ8PjtTZQNoB7LzwMZcNuCJGMT
 /KiKyJDQeAvVYj2zoEG3Npzifzs3j61is3iSyBTeOulvijYoH8heklMVsbC7yYsZ8ObFFbTPE4J
 1C99dt4hj9PsY85HuKCLyqEJPVqH5lmrIOtrz4w2rtxO1OoslFKtSJ2kjXlW9CHobO+faxdb9yN
 nAJ7m8YzK4Yp0upsTf+/UxE9Ku1MW117AyXM69EZ6hTQFgGjdgMtWHqLhGVyTInhtAjwc1d9RWC
 AQPXYa7OPyT7xAC/oHvaqcYT4cqPsNVw0cC74jXwt2eiA0Cmv+x7LDqCuZK0964QXQF30oBev3c
 GN1bo/MxyTNYPrYcFierwLyK94O2CDOcbv7EtH42+/ifBc4kL+l02u0/Pbwo9LXQ6nIKnpJH0tX
 vDbCYoiwYh1/X+A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Mar 2026 09:22:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9098

Fedora 41 has been disabled on the Autobuilder and is being removed from
poky.conf in meta-poky[1].

[1]: https://lore.kernel.org/r/20260319-mathieu-remove-fedora-41-v1-1-996d227abe2e@bootlin.com

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 7b4f9136f..b427e2c64 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -70,7 +70,6 @@ supported on the following distributions:
 -  Debian GNU/Linux 13 (Trixie)
 -  Fedora 39
 -  Fedora 40
--  Fedora 41
 -  Fedora 42
 -  Fedora 43
 -  OpenSUSE Leap 15.5
@@ -92,7 +91,6 @@ organizations publishing them no longer make updates publicly available:
 
 -  Fedora 39
 -  Fedora 40
--  Fedora 41
 -  OpenSUSE Leap 15.5
 -  Ubuntu 25.04
 

---
base-commit: 26c02962d44e66726cd4b3af4d450454ffa96732
change-id: 20260319-remove-fedora-41-cff7135b069b


