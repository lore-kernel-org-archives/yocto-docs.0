Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2018.1795162534091253149
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 00:15:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nr/csIXc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 474544E41670
	for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 08:15:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D9CC6017D;
	Fri, 20 Nov 2026 08:15:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EAE711BC1185;
	Fri, 20 Nov 2026 09:15:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795162531; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4SrR01R3gx/z/3jrf1PvrYvqUVDvyrnM3AadxLJq7Y4=;
	b=nr/csIXcu+E7nULbEttChP/YlId+vt0McPKeLnkRk1DOPvy2h3+PYYWQwI7pCy/wJrXGyl
	VhUT1KM3k8fFoPQOw6lnFOerWexMBaBBGXL3tWTtNoXHOccFra4El0O3xZGVAwrG+8mWJ3
	pT4xg7RSZpIFP1VPDY0Tbj+lnVeDAoRWxmkwRmfqkAy9hWDcx4lsGhoF+3IyLuJ40vrhfH
	ChY1JSKww7ceqvpvUCIU+MpU9yQlYQazrow4fZY6Xe+PScY14hSjhnVG3GmMkBV8esIoZe
	1bKyPmUpuZwiNHsfYnddjMkOM4rDBb18LIuuzkz88oeIqBszy3R0X8ml6zYMiQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Nov 2026 09:14:55 +0100
Subject: [PATCH v2 3/4] tools/gen-releases-svg: store docs root dir in
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-gen-releases-svg-fixes-v2-3-abc66b9dd7da@bootlin.com>
References: <20261120-gen-releases-svg-fixes-v2-0-abc66b9dd7da@bootlin.com>
In-Reply-To: <20261120-gen-releases-svg-fixes-v2-0-abc66b9dd7da@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1445;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=7lNZwtMz0Vn0ybxRrzYvtgsF1FClClAgLUBrWeAQPKY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBrAAGEZeUWdf4Gg7VulJIdVOdFfhk2ZVaeEJfwu
 SmsUujFuVWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCawABhAAKCRDRgEFAKaOo
 NhlwD/9tZF20VSTw02B7RC6CkWKaXDIAgnCxeKDDy8HDUKr9UTbVYMF9YTwjfJrIsIs4ZSISRf4
 Evt2PCCJXV1dbYhvMBUqpz0OzfrU6zoBZe/YgN7pjjg4yHOhiUNec7pBwAMnPt1fwsSMvRVJ/Gg
 W38BNlfEA3FL+HcbClt+2Iiqx1dij3QaCWMJuGV8wJq+SZnUxs3HE22iQMqZ/lPCmfWjdZEpzVW
 C1/kMJq64Z/paLWkpT98zpY3zUZTK+R4gMrdGYPbZuF5ujZvS+LAvEBOqhpuF2mv1D7YyQv75cj
 QDVXiaHvY6IRN2QKLzHaZ0auTQneu8ovFsDjtnu1UGJ3Z7e8Uu9zAptZHRnj31e5u7uBONE5AjG
 yaYaY4nM2aQ8HxJUM9DXH6A3kGZVKEWAtNX4uHCX0ZNO6tSuFkzHhemJ8iXXzBCacphBX5L8NZR
 237BoF3IDjzIboysGjNYtSWler74zED3hQxCCKAfxY76AlPmqjmS8ysZq2jP6B6H08PzYFGJgxM
 jQIbKfjUvyxw23nWbvl3He2FTMh6yo/1yWM5RKm5hdS8Z46Z8MIUWcwfW8LWT3znT76AI7Nw7in
 MhauJn5tgjHu/sor5qq8a+0GU+ZN2yQajjmlkgneKy6jXu9TELx20cUnk6USFWcevVam6I65jgP
 /QCmoCge2wuD1xw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 08:15:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10809

To improve readability, store the documentation root directory in a
variable and reuse it in the default assignment for -i and -o.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/gen-releases-svg | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/documentation/tools/gen-releases-svg b/documentation/tools/gen-releases-svg
index 32458bd9e..f8dc8e72d 100755
--- a/documentation/tools/gen-releases-svg
+++ b/documentation/tools/gen-releases-svg
@@ -18,13 +18,16 @@ import tempfile
 
 from pathlib import Path
 
+# documentation/ directory in yocto-docs
+documentation_dir = Path(__file__).resolve().parent.parent
+
 parser = argparse.ArgumentParser(
     description="Parse releases.json and output a releases.svg file"
 )
 parser.add_argument("-i", help="Path to the releases.json file", dest="releases_json_path",
-                    default=Path(__file__).resolve().parent.parent / "releases.json")
+                    default=documentation_dir / "releases.json")
 parser.add_argument("-o", help="Path to the output SVG", dest="output",
-                    default=Path(__file__).resolve().parent.parent / "ref-manual/svg/releases.svg")
+                    default=documentation_dir / "ref-manual/svg/releases.svg")
 args = parser.parse_args()
 
 if not shutil.which("mmdc"):

-- 
2.56.0

