Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A523C87FD8
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web11.3505.1753783013472371824
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OjP7jLyx;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1310843142;
	Tue, 29 Jul 2025 09:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/4ZCEWPJ53AIoZIANoJISFmHEJ/ITdaK0E/LvqLaJBw=;
	b=OjP7jLyxH+iXfp9d3/BkaKoWG4TFzkFoSMgZwakcjlsioWqxElsfYzQ7TmOvb+oRAh8W9K
	k+hY/lhEUIL40SjweItNYddlD3WMXQMzctNUoJvVeMZMNH9kRcjZ4witKkJtDwIl14f0qQ
	wwi7zH0/kXZfmF1+AyOB3D7c5HxXI/78YfrFUDqD4G3jM0emSSgwL6mGGYv/JHMY82JbyZ
	6sr4/vRlFEDPNkqC1aM6anX1MuIP/vEWQYHYvwk5KA7lw99qF15OdjQB2VZPXWXsEe+Mdq
	hUnFDbEBZsyeduYQVN1nUmfZcDJhUMUX/sw7OaMZNrAbbvkhYLm3vgREL2v6Cw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:47 +0200
Subject: [PATCH 13/19] ref-manual/variables.rst: document
 CVE_CHECK_VEX_JUSTIFICATION
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-13-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=l1ilst4PloXZ1xnreJZouoPPC3lEvmsiwR9fhNIL8Tg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJrf3A1u9SGMlcXgomlIGNMDOmyRuHDVQz771
 6oCSUfv25CJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3wAKCRDRgEFAKaOo
 NrbBD/0eFzNBKEdpVUknopi5EZ1fgZkAoXwV5OkwyQDhp6BTwHwvPVmvaUtsW5GVYn1MpjaVylQ
 uaa9ASACzyQnyFSQIjU6KOFsj3RDEpQHKOLRmusO+bOEwrqxP77lNJbPaPWHY7zGWzPvIDiYIGg
 XAJ7Wv50lU0Ji6KjsVZHDd+LPAvBZgrr4hIeSnfyyY/8ouLD9Of87eAsJvJVMXBApmq3at82gUW
 KMIh9zQxF88rztLQWKczjvUt6eRjD1G3vXckDtzF1q/iATYic7PfSfuQ5U3J0EFG0XUy+1Nodhp
 Mi5bA5wm2+Rqkh5DBuwO+FaZs8rN9MpnveAXlFoYZ0g1Afw8v3vCedQ7BFOjRz2cGpA+xLDXtea
 95cpcJ7UmSmFai7clJpz9rarl3+7wCL3j2zJg9ltMiVBLgEGk8AlrqcQuy0ILKXJnsiZDNSFpYE
 BeDARdOZguS9pfYpzHTUxCUZSRnYw5ra+NeZBuduZwRyTo7UErdb+2m8P7GHDhQb6f6MJ6wbUKw
 5k2AOax3MdBUxmAPLhnPGKU+WemXhTOWp4Uzp+Lg8v0+ruxH9U3JpqEqDnMyqRKPVvKz0RquftH
 kU+/OtiwoUEpxFra77hzz0OPZQg4KULHVDO0RrenJ+UQYij89M8hscb+cXstvmz5dYzBOpuxv7p
 y2fLxE8Wn28XMpA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -110
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlqddutddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdfhtedvgeevheeiteetveetfffgvdduhefhgedutdeitdevfeefvdeghfdtgffhnecuffhomhgrihhnpehnihhsthdrghhovhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnr
 dgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7404

Added by commit c0fa3d92cefa ("spdx30: Allow VEX Justification to be
configurable") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d918446db..3369bf67f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2054,6 +2054,13 @@ system and gives an overview of their function and contents.
 
          CVE_CHECK_STATUSMAP[cpe-incorrect] = "Ignored"
 
+   :term:`CVE_CHECK_VEX_JUSTIFICATION`
+      Mapping variable for :term:`CVE_STATUS` reasons
+      (for example ``not-applicable-platform``) to :ref:`ref-classes-vex`
+      justifications. Should be set as follows::
+
+         CVE_CHECK_VEX_JUSTIFICATION[not-applicable-config] = "vulnerableCodeNotPresent"
+
    :term:`CVE_VERSION`
       In a recipe, defines the version used to match the recipe version
       against the version in the `NIST CVE database <https://nvd.nist.gov/>`__

-- 
2.50.1


