Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26C8C369D3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 13:03:55 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.39291.1745327026771664241
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Apr 2025 06:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pj/BmGQC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F2B943945;
	Tue, 22 Apr 2025 13:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745327025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2S6RgwP0kiL3HPUChQgff7xxyGO2UZJGPSDx4aY2xIA=;
	b=pj/BmGQCf+9e/0X0CD9EtTIfQt/MxCb33Lze74ycehhG3l6PutaXXFq564b0MhPR6zAGJ9
	U2p35XBeORb3KPor7DHENEzH7oqTGIp1vuvxEbfwxCrGuUent6idZUD18bLcFeAJtYwJ8Z
	FrSo15BOysJp6qMOv3CcSEHI7JCmgZESSm753vopEGNqN7fcRoD55WhiReO6iAdcEoC/qw
	vCqEOLTiBD8JDf7R2cUsF68w/3kqaqERCCmHNGmyP1yWuS5h7zx0Tlgsj8aWR049idYcbU
	BdPzOLt9d6hghMoHF1ZidlZdCddzH8NJmWsIJ891yUowfZTcMcnh3kqs+FFi9g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 22 Apr 2025 15:03:35 +0200
Subject: [PATCH 2/2] migration-guides/release-notes-5.2.rst: add missing
 cves
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-release-note-5-2-cve-fixes-v1-2-1d3756fe2417@bootlin.com>
References: <20250422-release-note-5-2-cve-fixes-v1-0-1d3756fe2417@bootlin.com>
In-Reply-To: <20250422-release-note-5-2-cve-fixes-v1-0-1d3756fe2417@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Takayasu Ito <ypa.takayasu.ito@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5650;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=uPm4XSXXh0H9hJEs/Zi3iS954sVV6yaBsoTyyO+eNFk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoB5Ow5FGHmsehTDzaEBzXLZi2VyzIKYWqEvLBP
 4NocGVU0Z+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaAeTsAAKCRDRgEFAKaOo
 NiaUD/9Y2tMTPmj9ZQy3wzUkNDoF1WOCdtp3/TlUX4Z5X7TSjTHVozx+8zqlFtzNSdrUZ1k3k3s
 B06hnvYDGwxSEZmnGJ/2I0JaNyfVoJgHgKWsNHnR1YJ8yu2WDS3gaqJhHdfauvb8n/KY/VLsQ7W
 GbH8jpTGA2E913TQK1buKpLbwEL9gPK5qUZ6EIjElLYNnOD7aX/tc6HeUHgGOKTpSNxo8xVR/Hm
 PN1fJwDzzdlDJAL5y0p5TaVsGgQF1VnyeXaa8vmKAeZ7m4bKvruhPY732ic3JzPQ9qeh0PGXd2I
 06MDTUlHgWV+W4ApkEGaT+U27TJ+TuLC8Z6F31g9aGv5H6VN/o9+d1+fd3iJ+6ZyurIUsRK+fKs
 gqNC3jbNOoUklLX1RDAwkpXN/ypIdsDRyBe9hvnkV5exEJp5m22zhraTLMWGoiileZfcFgZA3/X
 tH+Xw3fFpWxK8WAgcnGhkIrnn4QN/wo0JxeHmEDoOD6xtc7B+WN8y86dfsWYxBsvbhbeQ9X+rAk
 Y0lHrrWvwnu4E6dtTgs7zRd+Wof8auEUfyz6FfrHcp9tjjP89bb/BxAWssIzJRxFTkUihPr3bRc
 Uehu354vJUv3uiUFrEKz5r7WGWu70+MBM6JAu6vzHyPMPmkeH9zKWPNBFbcYJjnJh/6TILfsDFp
 dTqd8RBeRCOgpnA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevjefgteevteduudevvefgffevtedugeefgedugeeljeekkeefgedvuedtveegtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhfrhgvvgguvghskhhtohhprdhorhhgpdhophgvnhhsshhhrdgtohhmpdguvghsthdquhhnrhgvrggthhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeihphgrrdhtrghkrgihrghsuhdrihhtohesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Apr 2025 13:03:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6771

Add missing fixed CVEs to the release note as reported here:
https://lore.kernel.org/r/5fc0d33e-4ba5-4f8d-80c2-c5c87be79680@gmail.com

Additions can be verified at the following links:
- https://gstreamer.freedesktop.org/security/
- https://www.openssh.com/txt/release-9.9p2
- http://www.dest-unreach.org/socat/

libssh2 CVE-2023-48795 was already fixed in previous releases so remove
it. See the previous migration guides.

Otherwise the CVE entries have been sorted.

Reported-by: Takayasu Ito <ypa.takayasu.ito@gmail.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-5.2.rst         | 24 ++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 006ea05f5..03f454bfc 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -810,7 +810,7 @@ The following CVEs have been fixed:
    * - ``curl``
      - :cve_nist:`2024-8096`, :cve_nist:`2024-9681`, :cve_nist:`2024-11053`, :cve_nist:`2025-0167`, :cve_nist:`2025-0665`, :cve_nist:`2025-0725`
    * - ``expat``
-     - :cve_nist:`2024-50602`, :cve_nist:`2024-8176`
+     - :cve_nist:`2024-8176`, :cve_nist:`2024-50602`
    * - ``ghostscript``
      - :cve_nist:`2024-46951`, :cve_nist:`2024-46952`, :cve_nist:`2024-46953`, :cve_nist:`2024-46954`, :cve_nist:`2024-46955`, :cve_nist:`2024-46956`
    * - ``gnutls``
@@ -818,23 +818,29 @@ The following CVEs have been fixed:
    * - ``go``
      - :cve_nist:`2024-34155`, :cve_nist:`2024-34156`, :cve_nist:`2024-34158`, :cve_nist:`2024-45336`, :cve_nist:`2024-45341`, :cve_nist:`2025-22866`, :cve_nist:`2025-22870`
    * - ``grub``
-     - :cve_nist:`2024-45781`, :cve_nist:`2024-45782`, :cve_nist:`2024-56737`, :cve_nist:`2024-45780`, :cve_nist:`2024-45783`, :cve_nist:`2025-0624`, :cve_nist:`2024-45774`, :cve_nist:`2024-45775`, :cve_nist:`2025-0622`, :cve_nist:`2024-45776`, :cve_nist:`2024-45777`, :cve_nist:`2025-0690`, :cve_nist:`2025-1118`, :cve_nist:`2024-45778`, :cve_nist:`2024-45779`, :cve_nist:`2025-0677`, :cve_nist:`2025-0684`, :cve_nist:`2025-0685`, :cve_nist:`2025-0686`, :cve_nist:`2025-0689`, :cve_nist:`2025-0678`, :cve_nist:`2025-1125`
+     - :cve_nist:`2024-45774`, :cve_nist:`2024-45775`, :cve_nist:`2024-45776`, :cve_nist:`2024-45777`, :cve_nist:`2024-45778`, :cve_nist:`2024-45779`, :cve_nist:`2024-45780`, :cve_nist:`2024-45781`, :cve_nist:`2024-45782`, :cve_nist:`2024-45783`, :cve_nist:`2024-56737`, :cve_nist:`2025-0622`, :cve_nist:`2025-0624`, :cve_nist:`2025-0677`, :cve_nist:`2025-0678`, :cve_nist:`2025-0684`, :cve_nist:`2025-0685`, :cve_nist:`2025-0686`, :cve_nist:`2025-0689`, :cve_nist:`2025-0690`, :cve_nist:`2025-1118`, :cve_nist:`2025-1125`
+   * -  ``gstreamer1.0``
+     - :cve_nist:`2024-47606`
+   * -  ``gstreamer1.0-plugins-base``
+     - :cve_nist:`2024-47538`, :cve_nist:`2024-47541`, :cve_nist:`2024-47542`,  :cve_nist:`2024-47600`, :cve_nist:`2024-47607`, :cve_nist:`2024-47615`, :cve_nist:`2024-47835`
+   * -  ``gstreamer1.0-plugins-good``
+     - :cve_nist:`2024-47537`, :cve_nist:`2024-47539`, :cve_nist:`2024-47540`, :cve_nist:`2024-47543`, :cve_nist:`2024-47544`, :cve_nist:`2024-47545`, :cve_nist:`2024-47546`, :cve_nist:`2024-47596`, :cve_nist:`2024-47597`, :cve_nist:`2024-47598`, :cve_nist:`2024-47599`, :cve_nist:`2024-47601`, :cve_nist:`2024-47602`, :cve_nist:`2024-47603`, :cve_nist:`2024-47606`, :cve_nist:`2024-47613`, :cve_nist:`2024-47774`, :cve_nist:`2024-47775`, :cve_nist:`2024-47776`, :cve_nist:`2024-47777`, :cve_nist:`2024-47778`, :cve_nist:`2024-47834`
    * - ``libarchive``
-     - :cve_nist:`2024-57970`, :cve_nist:`2025-25724`, :cve_nist:`2025-1632`
+     - :cve_nist:`2024-57970`, :cve_nist:`2025-1632`, :cve_nist:`2025-25724`
    * - ``libcap``
      - :cve_nist:`2025-1390`
    * - ``libsndfile1``
      - :cve_nist:`2024-50612`
-   * - ``libssh2``
-     - :cve_nist:`2023-48795`
    * - ``libtasn1``
      - :cve_nist:`2024-12133`
    * - ``libxml2``
-     - :cve_nist:`2025-24928`, :cve_nist:`2024-56171`
+     - :cve_nist:`2024-56171`, :cve_nist:`2025-24928`
    * - ``ofono``
      - :cve_nist:`2024-7539`, :cve_nist:`2024-7540`, :cve_nist:`2024-7541`, :cve_nist:`2024-7542`
    * - ``omvf``
      - :cve_nist:`2023-45236`, :cve_nist:`2023-45237`, :cve_nist:`2024-25742`
+   * - ``openssh``
+     - :cve_nist:`2025-26465`, :cve_nist:`2025-26466`
    * - ``openssl``
      - :cve_nist:`2024-9143`, :cve_nist:`2024-12797`, :cve_nist:`2024-13176`
    * - ``orc``
@@ -849,10 +855,12 @@ The following CVEs have been fixed:
      - :cve_nist:`2024-41123`, :cve_nist:`2024-41946`
    * - ``rust``
      - :cve_nist:`2024-43402`
+   * - ``socat``
+     - :cve_nist:`2024-54661`
    * - ``tiff``
-     - :cve_nist:`2023-52356`, :cve_nist:`2023-6228`, :cve_nist:`2023-6277`
+     - :cve_nist:`2023-6277`, :cve_nist:`2023-6228`, :cve_nist:`2023-52356`
    * - ``vim``
-     - :cve_nist:`2024-45306`, :cve_nist:`2024-47814`, :cve_nist:`2025-22134`, :cve_nist:`2025-24014`, :cve_nist:`2025-26603`, :cve_nist:`2025-1215`, :cve_nist:`2025-27423`, :cve_nist:`2025-29768`
+     - :cve_nist:`2024-45306`, :cve_nist:`2024-47814`, :cve_nist:`2025-1215`, :cve_nist:`2025-22134`, :cve_nist:`2025-24014`, :cve_nist:`2025-26603`, :cve_nist:`2025-27423`, :cve_nist:`2025-29768`
    * - ``webkitgtk``
      - :cve_nist:`2025-24143`, :cve_nist:`2025-24150`, :cve_nist:`2025-24158`, :cve_nist:`2025-24162`
    * - ``wpa-supplicant``

-- 
2.47.0


