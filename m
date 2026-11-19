Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10230.1795074980146463890
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2026 23:56:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Zc7/+SV9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 505E41A1700
	for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2026 07:56:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2773C60237;
	Thu, 19 Nov 2026 07:56:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D9BA11BC0F83;
	Thu, 19 Nov 2026 08:56:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795074973; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qRTkDshlKkxUehvQkISZwLRYovQYX984jQgsJUMfW1E=;
	b=Zc7/+SV9eETfH32pdJifm0Q+OBcBCCoZj5Y22IzqIvxF3y/HwBd35DtoNxY83yFRqGQqTh
	rC1brTPbVDtjnpkXDUsKqgRx8dEyZp+Q3PDFJgySEwiQkraSX1iOeTcqXG1dM3Oy9zXnYv
	8Su4MRoU7Aq0Toaka2poD4vJwEK5FOeRV2dnisfsutHhsdXRQsYxnVuluIauxQL9qC2yFN
	RWhK8bJpj4g6dTLtg3fJWe6oj3XlkipuJMnTzeNVYuxIErqv8+wJLDdTLwiyNgxciWiAq1
	RV5ZMu4ZwEM8w+F6wjKFy4ff4iEaB5efkZfQ23pROts5z9oKFyUmAkbSZFdlqw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 19 Nov 2026 08:55:53 +0100
Subject: [PATCH 1/4] tools/gen-releases-svg: use subprocess check_call
 instead of run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-gen-releases-svg-fixes-v1-1-b6245fbf8294@bootlin.com>
References: <20261119-gen-releases-svg-fixes-v1-0-b6245fbf8294@bootlin.com>
In-Reply-To: <20261119-gen-releases-svg-fixes-v1-0-b6245fbf8294@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=959;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=IESlDn89ySEdXW9701njtXwthuLOX6jv0KzeB4GF2X4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq/quMiksOhmav3b8N9bY9rETa9eCQ8boQ4Mj+Y
 WEtF3kW2daJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCav6rjAAKCRDRgEFAKaOo
 NrQLEADDk/sHtVvqLdXqQvdfMvMoK6uZbgkVR/nZ7AW2j4KB4T6TinXansbwe7ec5N63GtkOhj7
 CKVWYwNLIh+jTzqBtIYGd4qqlOHdtpZduHC+xw8Rhh2ZyIUnA60DKwP3rt38mNqsdb5x1X9JkZR
 J0wJVIdmANKwOuvRfodcaQXaNjLdD/GIt69td4j5rjGC4y4vR9vMEQJvDqaGoUpQ9se0exOoWdL
 Hzn5I4ql0O8N4CpfAzc8x4ne+1nzYpRnHDaVbwdF7w6peUs6ZWsGDmhhymzaA9SxWvrtuYBRsuw
 hQJYIFxyC0J9AZGSjInqF539OOXRhORPe9xw7TrQrytdfht1RrHQ50W9w2OVJKmqRFctq7wdVbu
 6/kvse0Mk+gkisI+UCqhl9TGOCWHk0jQFtll9PlUrJoMuB8wbzfzPWYcnR/DFoUnoxFUG5Y2QiO
 dmF8tOWBwwiITF8m4FFwAhnq6M5AGZzly5hHBSaTAH9TnN+4upyh/83UGUnd0q8OoVrmfB53cSn
 e6r9LxAmuaGiHWgxGcI/Tvj4iaQJDOiQySzLU9Ttl8/Wo0XpwIJyhbSURb1IWbq1zUfSgV02bRi
 Iz1R0HIjC6x5ULyJ2THg2yD3e6a+fd5gBjd3T3BecDZeIaGSTZ9Le1H6/wu1a7heWh6aJJwRKoN
 fDTVhdk6n1QMF9Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2026 07:56:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10795

We don't use the result of the command, so use check_call instead.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/gen-releases-svg | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/documentation/tools/gen-releases-svg b/documentation/tools/gen-releases-svg
index e091c02de..6a601b010 100755
--- a/documentation/tools/gen-releases-svg
+++ b/documentation/tools/gen-releases-svg
@@ -89,7 +89,4 @@ with tempfile.TemporaryDirectory() as tmpdir:
             mmd.write(f"    {codename} {series_version}{" (LTS)" if lts else ""}"
                       f" :{status}, {original_release_date}, {end_date}\n")
 
-    result = subprocess.run(
-        ["mmdc", "--input", mmdpath, "--output", args.output],
-        check=True,
-    )
+    subprocess.check_call(["mmdc", "--input", mmdpath, "--output", args.output])

-- 
2.56.0

