Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10231.1795074981511346005
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2026 23:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1bS/JA3B;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A57E44E4165C;
	Thu, 19 Nov 2026 07:56:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B6AD60237;
	Thu, 19 Nov 2026 07:56:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E98F11BC0FA4;
	Thu, 19 Nov 2026 08:56:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795074979; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EvK0LkuUR6xS0SW7PyqjY7bYB+eOzQvlgzmKRgacBdE=;
	b=1bS/JA3BXP8vE+BsY+vQ5KskVfTJ6AncwjEPf0fb1NEffOfXCwk7Z0xURH6vjBgyIY521t
	+w9lCkqI12iloX/P60VolT9mPibnXETGqHMdE01GJ8GTfp/ZYdEWd/2Oj5y8y1b7licKJP
	sqvTzez7uW9kYKqYkmpenx2QUoxNRZcxitnRha7lVgsgsptB7jPdMGMofem67WeZoJUOtf
	+MeP172MRbU9NqlV5UaJhJukRWSglTU+Gr7JmsvYZxwn7uu99URvR9CyTMReBmetJHlOJ8
	rbkWQoyhNtFRrF2cMa1KQ3ekIXbAFryqzHuQTqTVEjUaZkCoXcNmSlsGuT+vKg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 19 Nov 2026 08:55:55 +0100
Subject: [PATCH 3/4] tools/gen-releases-svg: store docs root dir in
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-gen-releases-svg-fixes-v1-3-b6245fbf8294@bootlin.com>
References: <20261119-gen-releases-svg-fixes-v1-0-b6245fbf8294@bootlin.com>
In-Reply-To: <20261119-gen-releases-svg-fixes-v1-0-b6245fbf8294@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/diRisubuLoGbo2Y7A6oK+VqC2ef31TEy8ibyj5LnB8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq/quNQ3Y9CEeG271BpQKCsxgM5/QQyOmuMhtym
 bWgouqL89aJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCav6rjQAKCRDRgEFAKaOo
 Nh97D/4oZfRcKjZJISAiTnoyT8LMDp6WqQ3Kg1P30MliravwKjygerVNRmkT2e+nKlALoovTaR+
 xqPxTHWA3ABS+2RFPn5Y+tZG/g8Cp/E/faNLs51Pn93KOOIpm6KNEJJ2mnj6RK1H3z+jPX02o3n
 hg/LsJo9kiEY/L6kQGJuc9m9nCK69MHGhw5r9/fn1A6B95oCwbMajglKzGawXB50DvpSHlYbM7i
 8aVDOFIUcwRjikKYDZwGKpcZwse9n6V64Q2G3wo7X/feX3l4KMyP2pGu9YyPbLmzEBPQh2AP9Ob
 wCQNynw++AIl0pbD6KvKZbe85jOCapEAEUQk+ouYwwbP7bpp4sp/OibWTPU5kn7p+xHEeEMEsWq
 SRK+Ej/WwyImFSirrvEqM1mytWJr4eTTrhDhKjZYFJVlOglopEW7ovTxxvXLjUNLSiilcrx71vq
 +QhLSYJtJFn9oZLOugr9tnJMIm24ddRmeh1XsajewTSw6CIw5Ds//0BYB3RmwWqfWT7fVg4M9jp
 UvU1S6u7eYMaYTNCZX8lveXnDplh9GB6flh4U8kP//yyC10ANd9ryMau3agnnvATGs324IKLcLT
 LaRBA8TwIxq4mJZlAQnElnXJBNZ32ABhgAKTZyo7+pyyj5h02KtM+A0Qyc9Pv/MO6MJCiD4FW3d
 1STthfmmhGb/7Fw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2026 07:56:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10797

To improve readability, store the documentation root directory in a
variable and reuse it in the default assignment for -i and -o.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/gen-releases-svg | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/documentation/tools/gen-releases-svg b/documentation/tools/gen-releases-svg
index 77281f37d..be69777ce 100755
--- a/documentation/tools/gen-releases-svg
+++ b/documentation/tools/gen-releases-svg
@@ -18,13 +18,15 @@ import tempfile
 
 from pathlib import Path
 
+docs_root_dir = Path(__file__).resolve().parent.parent
+
 parser = argparse.ArgumentParser(
     description="Parse releases.json and output a releases.svg file"
 )
 parser.add_argument("-i", help="Path to the releases.json file", dest="releases_json_path",
-                    default=Path(__file__).resolve().parent.parent / "releases.json")
+                    default=docs_root_dir / "releases.json")
 parser.add_argument("-o", help="Path to the output SVG", dest="output",
-                    default=Path(__file__).resolve().parent.parent / "ref-manual/svg/releases.svg")
+                    default=docs_root_dir / "ref-manual/svg/releases.svg")
 args = parser.parse_args()
 
 if not shutil.which("mmdc"):

-- 
2.56.0

