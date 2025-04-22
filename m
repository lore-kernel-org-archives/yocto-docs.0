Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F87C369D9
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 13:03:55 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.39290.1745327026764014362
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Apr 2025 06:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LrgjyJyh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0418B43944;
	Tue, 22 Apr 2025 13:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745327025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vm1fVThfBShiPsGYoemCq6obRfwYDsLxLGKnCe47Xoc=;
	b=LrgjyJyh5AhimhzMq8Bcw6A0Ka0bzzjM2ruTFUoZnO7nKs7Ny5FNW0s5+C6y6sfuyeCIDE
	seFDYZ42b7sboQ9g/jM0jMt8zfTgrMUkNKWb9/VVcd4RhuxyI40h9GjWVbh/1c+WmPW9b0
	zMz8POHpcgZGV4H/1RmoIQf6LdaLWFHCkjRGHZLAMdTJ4Zg4fg6DeekYMANRowc7Q9BgSY
	wIbWlYZsAzkviY1qp8fdBJLbZU4KEfALDqCXph4s4eh0ssQL3V7scS5q4DXGlOJBxG4P6I
	RxlRm+lKP5vKW/ha8AucqfoIi0ciUAub9O8bqNoEWfoJeZHxgT+MQjAspRf5uA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 22 Apr 2025 15:03:34 +0200
Subject: [PATCH 1/2] migration-guides/release-notes-5.2.rst: fix badly
 formatted gstreamer entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-release-note-5-2-cve-fixes-v1-1-1d3756fe2417@bootlin.com>
References: <20250422-release-note-5-2-cve-fixes-v1-0-1d3756fe2417@bootlin.com>
In-Reply-To: <20250422-release-note-5-2-cve-fixes-v1-0-1d3756fe2417@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1742;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lWfaO9KZDLz12F9rRaF+1tTu42J/CKU6G//IrOoHato=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoB5Owe9TjWdjEkXHrMiXH8lW74Iw1l/dCbgSC+
 pUrKdSWiDuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaAeTsAAKCRDRgEFAKaOo
 NgnyEACQcilnMjnEQ2nFgDxOV39vVrX6snUpT7tlZsK832RuwFZ7Nqy/TMT8xio+NensGpKXHbL
 YX2+hUYmZzdjH2I0PUCzHLEHc3Z3UHxp89xl/1vKvmIrPtJ26IZW+Hb+YvIWAfIM6gvwz57jU/T
 fCpZxT8BC7huiEjGqzH5+qzZiVHVKjw20phs3NiaLPpoDQ+bRoSp7zy8ceoEYrQiBMUk4LJg6NT
 sxkzNDLgx6z7aqX8eU5VFtcbVbByHw9h+S6gFpGRvNzH4pz6FHq179wMYjdLidE2OI3saB56gXi
 owLRsGbuGLmSiuqGzoHOgGIXggiCElDOIQyADKFQEnOzna8DMdCH/f6hLaKQcru2GXeW7yqs9Vx
 tJiizFb3pSJdXkl53GP9ReI7H0b3pLVizJiPsq6b6cecq9yyaorJJqzDl9MU0BCH5QoAc8VVYcV
 g4kO2L5DRQYWCy6+XWqibI731DYGgYVUHFw7RaKc6AZmSrQZBsIGKJkw42MC7fAhMe/LL4mlbPT
 gxy3/bmeo82UlYhwEE8WLZayTxPrjfq6bu2hLbPDTLHXPwDqkXywrm8jO0uX1NJIa6yDyn5opXE
 0QXx4TfL2WHd0hJ2zTOn0qyT23B8dBGGAsuiU3BfVog0DtumpCyD/mcYphB4AEUJsQlWW7tBqXz
 B0siYQ5KflqWi+g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhoj
 hgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Apr 2025 13:03:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6770

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-5.2.rst         | 36 +++++++++++-----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 0ac276c1e..006ea05f5 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -1160,32 +1160,32 @@ Recipe Upgrades in |yocto-ver|
    * - ``gst-devtools``
      - 1.24.10
      - 1.24.12
-   * - ``gstreamer1``
-     - .0 1.24.10
+   * - ``gstreamer1.0``
+     - 1.24.10
      - 1.24.12
-   * - ``gstreamer1``
-     - .0-libav 1.24.10
+   * - ``gstreamer1.0-libav``
+     - 1.24.10
      - 1.24.12
-   * - ``gstreamer1``
-     - .0-plugins-bad 1.24.10
+   * - ``gstreamer1.0-plugins-bad``
+     - 1.24.10
      - 1.24.12
-   * - ``gstreamer1``
-     - .0-plugins-base 1.24.10
+   * - ``gstreamer1.0-plugins-base``
+     - 1.24.10
      - 1.24.12
-   * - ``gstreamer1``
-     - .0-plugins-good 1.24.10
+   * - ``gstreamer1.0-plugins-good``
+     - 1.24.10
      - 1.24.12
-   * - ``gstreamer1``
-     - .0-plugins-ugly 1.24.10
+   * - ``gstreamer1.0-plugins-ugly``
+     - 1.24.10
      - 1.24.12
-   * - ``gstreamer1``
-     - .0-python 1.24.10
+   * - ``gstreamer1.0-python``
+     - 1.24.10
      - 1.24.12
-   * - ``gstreamer1``
-     - .0-rtsp-server 1.24.10
+   * - ``gstreamer1.0-rtsp-server``
+     - 1.24.10
      - 1.24.12
-   * - ``gstreamer1``
-     - .0-vaapi 1.24.10
+   * - ``gstreamer1.0-vaapi``
+     - 1.24.10
      - 1.24.12
    * - ``gtk4``
      - 4.14.5

-- 
2.47.0


